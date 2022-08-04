const functions = require("firebase-functions");

//const moment = require('moment');
// The Firebase Admin SDK to access Firestore.
const admin = require('firebase-admin');
const { firebaseConfig } = require("firebase-functions");
admin.initializeApp();


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
    } else {
      functions.logger.log("ACCOUNT NOT FOUND", account);
    }

    functions.logger.log("ACCOUNT EXISTING DATA", account);

    res.status(200).send();
  }

})


exports.needsreauth = functions.runWith({timeoutSeconds: 300}).https.onRequest(async (req, res) => {

  let accountid = req.body.data.account._id;

  functions.logger.log("RESPONSE FROM MONO:", req.body);

  const account = await admin.firestore().collection('accounts').where('authID', '==', accountid).get();

  functions.logger.log("ACCOUNT EXISTING DATA", account.data());

  const update = { reauthRequired: true };

  if (!account.empty) {

    const snapshot = account.docs[0];

    await snapshot.ref.update(update);

  } else {
    functions.logger.log("ACCOUNT NOT FOUND", account);
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

        const newEnd = new Date(existingEnd.getTime() + (endOffset*86400000));

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

        const user = await admin.firestore().collection('users').doc(userID).update({
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
      })
    })

  return null;
})


exports.testNotifications = functions.https.onRequest(async (req,res) => {

  const notification = req.body;
  //const user_refs = ""
  const timestamp = admin.firestore.Timestamp.now();

  const newNotification = await admin.firestore().collection('ff_push_notifications').add(
    {
      initial_page_name: req.body.initial_page_name,
      notification_sound: req.body.notification_sound,
      notification_text: req.body.notification_text,
      notification_title: req.body.notification_title,
      parameter_data: req.body.parameter_data,
      user_refs: req.body.user_refs,
      timestamp: timestamp
    }
  );

  functions.logger.log("NOTIFICATION:", newNotification.data());

  res.status(200).send(newNotification.data());

})