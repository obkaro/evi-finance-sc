const functions = require("firebase-functions");

//const moment = require('moment');
// The Firebase Admin SDK to access Firestore.
const admin = require('firebase-admin');
const { firebaseConfig } = require("firebase-functions");
admin.initializeApp();

const sdk = require('api')('@mono/v1.0#33hmc2izkyejmoej');
const axios = require('axios');


exports.accountupdate = functions.https.onRequest(async (req, res) => {

  functions.logger.log("REQUEST BODY", req.body);

  let payload = req.body;

  //for MONO ACCOUNT UPDATE
  if (payload.event == "mono.events.account_updated") {

    const account = await admin.firestore().collection('accounts').where('authID', '==', payload.data.account._id).get();

    const currentdate = new Date();

    const update = {
      accountBalance: req.body.data.account.balance,
      accountName: req.body.data.account.name,
      accountNumber: req.body.data.account.accountNumber,
      accountType: req.body.data.account.type,
      authID: req.body.data.account._id,
      authMethod: req.body.data.meta.data_status,
      bankCode: req.body.data.account.institution.bankCode,
      bvn: req.body.data.account.bvn,
      currency: req.body.data.account.currency,
      dataStatus: req.body.data.meta.data_status,
      institutionName: req.body.data.account.institution.name,
      institutionType: req.body.data.account.institution.type,
      lastSync: currentdate,
      reauthRequired: false
    };

    functions.logger.log("Update Object", update);

    if (!account.empty) {
      const snapshot = account.docs[0];
      await snapshot.ref.update(update);

      const options = {
        method: 'GET',
        url: 'https://api.withmono.com/accounts/' + req.body.data.account._id + '/transactions',
        headers: { Accept: 'application/json', 'mono-sec-key': 'live_sk_k7LNk7ovmMi9CsrmCUid' }
      };
      axios
        .request(options)
        .then(async function (response) {

          response.data.forEach(element => {

            const id = element.amount + element.narration + element.date + element.balance;
            const parsedDate = Date.parse(element.date);

            const writetransactions = await admin.firestore().collection('transactions').doc(id).set(
              {
                account: account.docs[0].ref.path,
                trasactionDate: admin.firestore.Timestamp.fromDate(parsedDate),
                //monoCategory: transaction.data[i].,
                transactionOwner: account.docs[0].accountOwner.path,
                balanceAfter: element.balance,
                transactionAmount: element.amount,
                transactionMonoID: element._id,
                transactionType: element.type,
                transactionNarration: element.narration,
                monoCategory: element.category,
              }, { merge: true }
            )
          });
          functions.logger.log(response.data);
        })
        .catch(function (error) {
          console.error(error);
        });
    } else {
      functions.logger.log("ACCOUNT NOT FOUND", account);
    }

    functions.logger.log("ACCOUNT EXISTING DATA", account);

    res.status(200).send();
  }

})


exports.needsreauth = functions.runWith({ timeoutSeconds: 300 }).https.onRequest(async (req, res) => {

  if (req.body.event == "mono.events.reauthorisation_required") {
    let accountid = req.body.data.account._id;

    functions.logger.log("RESPONSE FROM MONO:", req.body);

    const account = await admin.firestore().collection('accounts').where('authID', '==', accountid).get();

    functions.logger.log("ACCOUNT EXISTING DATA", account.docs[0].data());

    const update = { reauthRequired: true };

    if (!account.empty) {
      const snapshot = account.docs[0];
      await snapshot.ref.update(update);

      const userid = snapshot.data().accountOwner.path.toString().substring(6);

      const user = await admin.firestore().collection('users').doc(userid).get();

      const reauthNotif = await admin.firestore().collection('ff_push_notifications').add({
        initial_page_name: 'Accounts',
        notification_sound: 'default',
        notification_text: 'Hi ' + user.data().username + ', your authentication is required to update one of your accounts. Kindly ignore this message if you have provided authentication in the last few minutes.',
        notification_title: 'Evi',
        timestamp: time,
        user_refs: snapshot.data().accountOwner.path.toString()
      });


    } else {
      functions.logger.log("ACCOUNT NOT FOUND", account);
    }
  }

  res.status(200).send();

})


exports.renewbudgets = functions.pubsub.schedule('*/15 * * * *').onRun(async (context) => {

  const time = admin.firestore.Timestamp.now();

  const budgets = await admin.firestore().collection('budgets').where('status', '==', 'active').where('budgetEnd', '<', time).get()
    .then(querySnapshot => {
      querySnapshot.forEach(async documentSnapshot => {

        const newID = Math.random().toString(36).substring(2, 16) + Math.random().toString(36).substring(2, 16);

        const existingEnd = documentSnapshot.data().budgetEnd.toDate();
        const endOffset = documentSnapshot.data().duration + 1;

        functions.logger.log("EXISTING END", existingEnd.toString());

        const newStart = new Date(existingEnd.getTime() + 86400000);

        functions.logger.log("after start:", existingEnd.getTime());

        const newEnd = new Date(existingEnd.getTime() + (endOffset * 86400000));

        functions.logger.log("end offset:", endOffset);

        functions.logger.log("after end:", existingEnd.getTime());

        functions.logger.log("NEW START:", newStart.toDateString());
        functions.logger.log("NEW END:", newEnd.toDateString());

        const newBudget = await admin.firestore().collection('budgets').add({
          budgetAmount: documentSnapshot.data().budgetAmount,
          budgetDateCreated: documentSnapshot.data().budgetDateCreated,
          budgetDuration: documentSnapshot.data().budgetDuration,
          budgetEnd: admin.firestore.Timestamp.fromDate(newEnd),
          budgetID: newID,
          budgetOwner: documentSnapshot.data().budgetOwner,
          budgetStart: admin.firestore.Timestamp.fromDate(newStart),
          unallocatedAmount: documentSnapshot.data().unallocatedAmount,
          duration: documentSnapshot.data().duration,
          status: 'active',
        })

        documentSnapshot.ref.update({
          status: 'archived'
        })

        const userID = documentSnapshot.data().budgetOwner.path.toString().substring(6);

        functions.logger.log("PATH", documentSnapshot.data().budgetOwner.path);

        functions.logger.log(userID);

        const userUpdate = await admin.firestore().collection('users').doc(userID).update({
          activeBudget: newBudget
        })

        const catID = Math.random().toString(36).substring(2, 16) + Math.random().toString(36).substring(2, 16);


        await documentSnapshot.ref.collection('categories').get().then((snapshot) => {
          snapshot.forEach(async (document) => {

            await newBudget.collection('categories').add({
              category_amount: document.data().category_amount,
              category_name: document.data().category_name,
              category_budget: newBudget,
              category_id: catID
            });
          })
        })

        const user = await admin.firestore().collection('users').doc(userID).get();

        functions.logger.log('USER DATA = ', user.data());

        const renewedNotif = await admin.firestore().collection('ff_push_notifications').add({
          initial_page_name: 'Budgets',
          notification_sound: 'default',
          notification_text: 'Hey ' + user.data().username + ', your ' + documentSnapshot.data().budgetDuration + ' has been renewed. Come check it out!',
          notification_title: 'Evi',
          timestamp: time,
          user_refs: documentSnapshot.data().budgetOwner.path.toString()
        });


      })
    })

  return null;
})


exports.testNotifications = functions.https.onRequest(async (req, res) => {

  // const notification = req.body;
  // //const user_refs = ""
  // const timestamp = admin.firestore.Timestamp.now();

  // const newNotification = await admin.firestore().collection('ff_push_notifications').add(
  //   {
  //     initial_page_name: req.body.initial_page_name,
  //     notification_sound: req.body.notification_sound,
  //     notification_text: req.body.notification_text,
  //     notification_title: req.body.notification_title,
  //     parameter_data: req.body.parameter_data,
  //     user_refs: req.body.user_refs,
  //     timestamp: timestamp
  //   }
  // );

  // functions.logger.log("NOTIFICATION:", newNotification.data());

  // res.status(200).send(newNotification.data());

  //const action = admin.firestore().collection('transactions').

})

exports.budgetCreated = functions.firestore.document('budgets/{budgetID}').onCreate((snap, context) => {
  const createdBudget = snap.data();


});