// const functions = require('firebase-functions');

// //const moment = require('moment');
// // The Firebase Admin SDK to access Firestore.
const admin = require('firebase-admin');
const { firebaseConfig } = require("firebase-functions");
admin.initializeApp();

// const sdk = require('api')('@mono/v1.0#33hmc2izkyejmoej');
// const axios = require('axios');

// const firestore = require('@google-cloud/firestore');
// const client = new firestore.v1.FirestoreAdminClient();


//* ACCOUNTS
// const accountupdate = require('./accounts/accountupdate');
exports.accountupdate = require('./accounts/accountupdate').accountupdate;

// const datasync = require('./accounts/datasync');
exports.datasync = require('./accounts/datasync').datasync;

// const needsreauth = require('./accounts/needsreauth');
exports.needsreauth = require('./accounts/needsreauth').needsreauth;

//* BUDGETS
// const recalcspentamounts = require('./budgets/recalcspentamounts');
exports.recalcspentamounts = require('./budgets/recalcspentamounts').recalcspentamounts;

// const renewbudgets = require('./budgets/renewbudgets');
exports.renewbudgets = require('./budgets/renewbudgets').renewbudgets;

//* MARKETING


//* OPS
// const scheduledbackup24 = require('./ops/scheduledbackup24');
exports.scheduledbackup24 = require('./ops/scheduledbackup24').scheduledbackup24;


//* SUBSCRIPTIONS
// const subscriptionReminder = require('./subscriptions/subscriptionReminder');
exports.subscriptionReminder = require('./subscriptions/subscriptionReminder').subscriptionReminder;


//* USERS
// const checkreminder = require('./users/checkreminder');
exports.checkreminder = require('./users/checkreminder').checkreminder;


// //* ACCOUNTS
// const accountupdate = require('./accounts/accountupdate');
// exports.accountupdate = accountupdate

// const datasync = require('./accounts/datasync');
// exports.datasync = datasync;

// const needsreauth = require('./accounts/needsreauth');
// exports.needsreauth = needsreauth;

// //* BUDGETS
// const recalcspentamounts = require('./budgets/recalcspentamounts');
// exports.recalcspentamounts = recalcspentamounts;

// const renewbudgets = require('./budgets/renewbudgets');
// exports.renewbudgets = renewbudgets;

// //* MARKETING


// //* OPS
// const scheduledbackup24 = require('./ops/scheduledbackup24');
// exports.scheduledbackup24 = scheduledbackup24;


// //* SUBSCRIPTIONS
// const subscriptionReminder = require('./subscriptions/subscriptionReminder');
// exports.subscriptionReminder = subscriptionReminder;


// //* USERS
// const checkreminder = require('./users/checkreminder');
// exports.checkreminder = checkreminder;

// // BACKUP FIRESTORE
// const bucket = 'gs://evi-prod-backups';

// exports.scheduledbackup24 = functions.pubsub
//                                             .schedule('every 24 hours')
//                                             .onRun((context) => {

//   const projectId = process.env.GCP_PROJECT || process.env.GCLOUD_PROJECT;
//   const databaseName = 
//     client.databasePath(projectId, '(default)');

//   return client.exportDocuments({
//     name: databaseName,
//     outputUriPrefix: bucket,
//     // Leave collectionIds empty to export all collections
//     // or set to a list of collection IDs to export,
//     // collectionIds: ['users', 'posts']
//     collectionIds: []
//     })
//   .then(responses => {
//     const response = responses[0];
//     console.log(`Operation Name: ${response['name']}`);
//     return;
//   })
//   .catch(err => {
//     console.error(err);
//     throw new Error('Export operation failed');
//   });
// });

// // UPDATE ACCOUNTS
// exports.accountupdate = functions.runWith({ timeoutSeconds: 300, memory: '1GB', })
//   .https.onRequest(async (req, res) => {

//     functions.logger.log("REQUEST BODY", req.body);

//     let payload = req.body;

//     //for MONO ACCOUNT UPDATE
//     if (payload.event == "mono.events.account_updated") {

//       const account = await admin.firestore().collection('accounts')
//         .where('authID', '==', payload.data.account._id)
//         .get();

//       const logo = await admin.firestore().collection('constInstitutionLogos')
//         .where('institutionCode', '==', payload.data.account.institution.bankCode)
//         .get();

//       const currentdate = new Date();

//       const update = {
//         accountBalance: req.body.data.account.balance,
//         accountName: req.body.data.account.name,
//         accountNumber: req.body.data.account.accountNumber,
//         accountType: req.body.data.account.type,
//         authID: req.body.data.account._id,
//         authMethod: req.body.data.meta.data_status,
//         bankCode: req.body.data.account.institution.bankCode,
//         bvn: req.body.data.account.bvn,
//         currency: req.body.data.account.currency,
//         dataStatus: req.body.data.meta.data_status,
//         institutionName: req.body.data.account.institution.name,
//         institutionType: req.body.data.account.institution.type,
//         lastSync: currentdate,
//         reauthRequired: false,
//         accountLogo: logo.docs[0].data().institutionLogo,
//         awaitingWebhook: false,
//       };

//       // axios
//       //   .request(options)
//       //   .then(async function (response) {

//       //functions.logger.log("Update Object", update);

//       if (!account.empty) {
//         const snapshot = account.docs[0];
//         await snapshot.ref.update(update);

//         const options = {
//           method: 'GET',
//           url: 'https://api.withmono.com/accounts/' + req.body.data.account._id + '/transactions',
//           headers: { Accept: 'application/json', 'mono-sec-key': 'live_sk_k7LNk7ovmMi9CsrmCUid' }
//         };
//         axios
//           .request(options)
//           .then(async function (response) {

//             //functions.logger.log("RESPONSE", response.data);

//             const transactions = response.data.data;

//             //for (let element in transactions) {

//             response.data.data.forEach(async element => {

//               //functions.logger.log("ELEMENT", element);

//               const id = element.amount + element.narration + element.date + element.balance + account.docs[0].ref.path.toString();
//               const parsedDate = new Date(Date.parse(element.date));

//               //functions.logger.log(id);

//               const hash = function (str, seed = 0) {
//                 let h1 = 0xdeadbeef ^ seed, h2 = 0x41c6ce57 ^ seed;
//                 for (let i = 0, ch; i < str.length; i++) {
//                   ch = str.charCodeAt(i);
//                   h1 = Math.imul(h1 ^ ch, 2654435761);
//                   h2 = Math.imul(h2 ^ ch, 1597334677);
//                 }
//                 h1 = Math.imul(h1 ^ (h1 >>> 16), 2246822507) ^ Math.imul(h2 ^ (h2 >>> 13), 3266489909);
//                 h2 = Math.imul(h2 ^ (h2 >>> 16), 2246822507) ^ Math.imul(h1 ^ (h1 >>> 13), 3266489909);
//                 return 4294967296 * (2097151 & h2) + (h1 >>> 0);
//               };

//               functions.logger.log(hash(id));

//               const exisiting = await admin.firestore().collection('transactions').doc(hash(id).toString()).get();

//               if (!exisiting.exists) {
//                 functions.logger.log('TRANSACTION DOES NOT EXIST. WRITING DATA...')
//                 const writetransactions = await admin.firestore().collection('transactions').doc(hash(id).toString()).set(
//                   {
//                     account: account.docs[0].ref,
//                     trasactionDate: admin.firestore.Timestamp.fromDate(parsedDate),
//                     //monoCategory: transaction.data[i].,
//                     transactionOwner: account.docs[0].data().accountOwner,
//                     balanceAfter: element.balance,
//                     transactionAmount: element.amount,
//                     transactionMonoID: element._id,
//                     transactionType: element.type,
//                     transactionNarration: element.narration,
//                     monoCategory: element.category,
//                     accountDetails: {
//                       logo: logo.docs[0].data().institutionLogo
//                     },
//                     isAssigned: false
//                   },
//                 )
//               } else {
//                 functions.logger.log('TRANSACTION ALREADY EXISTS')
//               }
//             });
//             //functions.logger.log(response.data);
//           })
//           .catch(function (error) {
//             console.error(error);
//           });
//       } else {
//         functions.logger.log("ACCOUNT NOT FOUND", account);
//       }

//       //functions.logger.log("ACCOUNT EXISTING DATA", account);

//       res.status(200).send('SUCCESS');
//     } else res.status(200).send('INVALID REQUEST');

//   })


// //PERIODIC DATA SYNC
// exports.datasync = functions.pubsub.schedule('0 */14 * * *').onRun(async (context) => {

//   const accounts = await admin.firestore().collection('accounts').get();

//   accounts.docs.forEach(async (account) => {
//     const options = {
//       method: 'POST',
//       url: 'https://api.withmono.com/accounts/' + account.data().authID + '/sync?allow_incomplete_statement=false',
//       headers: { Accept: 'application/json', 'mono-sec-key': 'live_sk_k7LNk7ovmMi9CsrmCUid' }
//     };
//     axios
//       .request(options)
//       .then(async function (response) {

//         // if(response.data.event === "mono.events.account_synced") {

//         //     const options = {
//         //       method: 'GET',
//         //       url: 'https://api.withmono.com/accounts/' + req.body.data.account._id + '/transactions',
//         //       headers: { Accept: 'application/json', 'mono-sec-key': 'live_sk_k7LNk7ovmMi9CsrmCUid' }
//         //     };
//         //     axios
//         //       .request(options)
//         //       .then(async function (response) {});
//         // }

//         functions.logger.log(account.data().authID, response.data);

//         // if (response.data.event === "mono.events.reauthorisation_required") {
//         //   //Set requth required to true and notify user
//         // }

//         // if (response.data.event === "mono.events.sync_failed") { }
//         //Set failed sync date
//       }).catch(function (error) {
//         console.error(error);
//       });
//     res.status(200).send();
//   });
// })


// exports.needsreauth = functions.runWith({ timeoutSeconds: 300 }).https.onRequest(async (req, res) => {

//   if (req.body.event == "mono.events.reauthorisation_required") {
//     let accountid = req.body.data.account._id;

//     functions.logger.log("RESPONSE FROM MONO:", req.body);

//     const account = await admin.firestore().collection('accounts').where('authID', '==', accountid).get();

//     functions.logger.log("ACCOUNT EXISTING DATA", account.docs[0].data());

//     const currentdate = new Date();

//     const update = {
//       reauthRequired: true,
//       failedSync: currentdate
//     };

//     if (!account.empty) {
//       const snapshot = account.docs[0];
//       await snapshot.ref.update(update);

//       // const userid = snapshot.data().accountOwner.path.toString().substring(6);

//       // const user = await admin.firestore().collection('users').doc(userid).get();

//       // const reauthNotif = await admin.firestore().collection('ff_push_notifications').add({
//       //   initial_page_name: 'Accounts',
//       //   notification_sound: 'default',
//       //   notification_text: 'Hi ' + user.data().username + ', your authentication is required to update one of your accounts. Kindly ignore this message if you have provided authentication in the last few minutes.',
//       //   notification_title: 'Evi',
//       //   timestamp: currentdate,
//       //   user_refs: snapshot.data().accountOwner.path.toString()
//       // });


//     } else {
//       functions.logger.log("ACCOUNT NOT FOUND", account);
//     }
//   }

//   res.status(200).send();

// })


// exports.renewbudgets = functions.pubsub.schedule('*/15 * * * *').onRun(async (context) => {

//   const time = admin.firestore.Timestamp.now();

//   const budgets = await admin.firestore().collection('budgets').where('status', '==', 'active').where('budgetEnd', '<', time).get()
//     .then(querySnapshot => {
//       querySnapshot.forEach(async documentSnapshot => {

//         const newID = Math.random().toString(36).substring(2, 16) + Math.random().toString(36).substring(2, 16);

//         const existingEnd = documentSnapshot.data().budgetEnd.toDate();
//         const endOffset = documentSnapshot.data().duration;

//         functions.logger.log("EXISTING END", existingEnd.toString());

//         const newStart = new Date(existingEnd.getTime());

//         functions.logger.log("after start:", existingEnd.getTime());

//         const newEnd = new Date(existingEnd.getTime() + (endOffset * 86400000));

//         functions.logger.log("end offset:", endOffset);
//         functions.logger.log("after end:", existingEnd.getTime());

//         functions.logger.log("NEW START:", newStart.toDateString());
//         functions.logger.log("NEW END:", newEnd.toDateString());

//         const newBudget = await admin.firestore().collection('budgets').add({
//           budgetAmount: documentSnapshot.data().budgetAmount,
//           budgetDateCreated: documentSnapshot.data().budgetDateCreated,
//           budgetDuration: documentSnapshot.data().budgetDuration,
//           budgetEnd: admin.firestore.Timestamp.fromDate(newEnd),
//           budgetID: newID,
//           budgetOwner: documentSnapshot.data().budgetOwner,
//           budgetStart: admin.firestore.Timestamp.fromDate(newStart),
//           unallocatedAmount: documentSnapshot.data().unallocatedAmount,
//           duration: documentSnapshot.data().duration,
//           status: 'active',
//           parentBudget: documentSnapshot.ref,
//           budgetSpent: 0
//         })

//         documentSnapshot.ref.update({
//           status: 'archived'
//         })

//         const userID = documentSnapshot.data().budgetOwner.path.toString().substring(6);

//         functions.logger.log("PATH", documentSnapshot.data().budgetOwner.path);

//         functions.logger.log(userID);

//         const userUpdate = await admin.firestore().collection('users').doc(userID).update({
//           activeBudget: newBudget
//         })

//         const catID = Math.random().toString(36).substring(2, 16) + Math.random().toString(36).substring(2, 16);


//         await documentSnapshot.ref.collection('categories').get().then((snapshot) => {
//           snapshot.forEach(async (document) => {

//             await newBudget.collection('categories').add({
//               category_amount: document.data().category_amount,
//               category_name: document.data().category_name,
//               category_budget: newBudget,
//               category_id: catID,
//               //category_owner: document.data().category_owner,
//               spentAmount: 0,
//               createdDate: time
//             });
//           })
//         })

//         const user = await admin.firestore().collection('users').doc(userID).get();

//         functions.logger.log('USER DATA = ', user.data());

//         const renewedNotif = await admin.firestore().collection('ff_push_notifications').add({
//           initial_page_name: 'ActiveBudget',
//           notification_sound: 'default',
//           notification_text: 'Hi ' + user.data().username + ', your ' + documentSnapshot.data().budgetDuration + ' budget has been renewed. Come check it out!',
//           notification_title: 'Evi',
//           timestamp: time,
//           user_refs: documentSnapshot.data().budgetOwner.path.toString()
//         });


//       })
//     })

//   return null;
// })

// //SCHEDULE NOTIFICAITON TO CHECK TRANSACTIONS
// exports.checkreminder = functions.pubsub.schedule('0 15 */2 * *').onRun(async (context) => {
//   const userlist = await admin.firestore().collection('users').get();

//   const time = admin.firestore.Timestamp.now();

//   userlist.docs.forEach(async (user) => {
//     const checknotif = await admin.firestore().collection('ff_push_notifications').add({
//       initial_page_name: 'dashboard',
//       notification_sound: 'default',
//       notification_text: `Hey ${user.data().username}, come see what's happened on your accounts over the last couple of days!`,
//       notification_title: 'Stay on track',
//       timestamp: time,
//       user_refs: user.ref.path.toString()
//     });
//   })
// })


// exports.subscriptionReminder = functions.firestore.document('subscriptions/{Id}')
//   .onWrite(async (change, context) => {

//     functions.logger.log(change.after.data());
//     const doc = change.after.exists ? change.after.data() : null;

//     if (doc == null) { return null; }
//     functions.logger.log(doc.expChargeDate);
//     const daysBefore = 1;
//     const parsedDate = doc.expChargeDate.toDate();

//     const reminderDate = new Date(parsedDate.getTime() - (daysBefore * 86400000));
//     functions.logger.log(reminderDate);
//     const ownerid = doc.owner.path.toString().substring(6);

//     const user = await admin.firestore().collection('users').doc(ownerid).get();

//     const time = admin.firestore.Timestamp.now();

//     const subscriptionNotif = await admin.firestore().collection('ff_push_notifications').add({
//       initial_page_name: 'subscriptionDetails',
//       notification_sound: 'default',
//       notification_text: `Hey ${user.data().username}, your ${doc.name} subscription is due tomorrow.`,
//       notification_title: 'Evi',
//       parameter_data: change.after.ref.path,
//       scheduled_time: admin.firestore.Timestamp.fromDate(reminderDate),
//       timestamp: time,
//       user_refs: user.ref.path.toString()
//     });
//     return null;
//   })


// exports.recalcspentamounts = functions.firestore.document('transactions/{id}')
//   .onWrite(async (change, context) => {
//     const oldDoc = change.before.data();
//     const newDoc = change.after.data();

//     if (oldDoc == newDoc || oldDoc == null) {
//       functions.logger.log('CREATED NEW TRANSACTION, OR NO CHANGE')
//       return null;
//     }

//     if (newDoc == null && oldDoc.transactionBudget != null) {
//       functions.logger.log('DELETED NEW TRANSACTION')
//       const updateOldBudget = await admin.firestore().doc(oldDoc.transactionBudget.path)
//         .update({
//           budgetSpent: admin.firestore.FieldValue.increment(-(oldDoc.transactionAmount))
//         });
//       const updateOldCategory = await admin.firestore().doc(oldDoc.transactionCategory.path)
//         .update({
//           spentAmount: admin.firestore.FieldValue.increment(-(oldDoc.transactionAmount))
//         });
//         return null;
//     }

//     if (newDoc == null && oldDoc.transactionBudget == null) {
//       functions.logger.log('DELETED TRANSACTION - NO CHANGE')
//       return null;
//     }

//     let budgetCase = 'default';

//     if (oldDoc.transactionBudget == null) { budgetCase = 'null' }
//     else if (newDoc.transactionBudget == null) { budgetCase = 'default' }
//     else if (oldDoc.transactionBudget.path == newDoc.transactionBudget.path) { budgetCase = 'same' }
//     else if (oldDoc.transactionBudget.path != newDoc.transactionBudget.path) { budgetCase = 'default' }

//     switch (budgetCase) {
//       case 'null':
//         functions.logger.log('CASE: NULL');
//         functions.logger.log(budgetCase);
//         const updateBudget = await admin.firestore().doc(newDoc.transactionBudget.path)
//           .update({
//             budgetSpent: admin.firestore.FieldValue.increment(newDoc.transactionAmount)
//           });
//         break;
//       case 'same':
//         functions.logger.log('CASE: EQUAL TO NEW BUDGET');
//         functions.logger.log(budgetCase);
//         break;
//       case 'default':
//         functions.logger.log('DEFAULT');
//         functions.logger.log(budgetCase);
//         const updateOldBudget = await admin.firestore().doc(oldDoc.transactionBudget.path)
//           .update({
//             budgetSpent: admin.firestore.FieldValue.increment(-(newDoc.transactionAmount))
//           });
//         if (newDoc.transactionBudget != null) {
//           const updateNewBudget = await admin.firestore().doc(newDoc.transactionBudget.path)
//             .update({
//               budgetSpent: admin.firestore.FieldValue.increment(newDoc.transactionAmount)
//             });
//         }
//     }

//     let categoryCase = 'default';

//     if (oldDoc.transactionCategory == null) { categoryCase = 'null' }
//     else if (newDoc.transactionCategory == null) { categoryCase = 'default' }
//     else if (oldDoc.transactionCategory.path == newDoc.transactionCategory.path) { categoryCase = 'same' }
//     else if (oldDoc.transactionCategory.path != newDoc.transactionCategory.path) { categoryCase = 'default' }

//     switch (categoryCase) {
//       case 'null':
//         functions.logger.log('CASE: NULL');
//         functions.logger.log(categoryCase);
//         const updateCategory = await admin.firestore().doc(newDoc.transactionCategory.path)
//           .update({
//             spentAmount: admin.firestore.FieldValue.increment(newDoc.transactionAmount)
//           });
//         break;
//       case 'same':
//         functions.logger.log('CASE: EQUAL TO NEW Category');
//         functions.logger.log(categoryCase);
//         break;
//       case 'default':
//         functions.logger.log('DEFAULT');
//         functions.logger.log(categoryCase);
//         const updateOldCategory = await admin.firestore().doc(oldDoc.transactionCategory.path)
//           .update({
//             spentAmount: admin.firestore.FieldValue.increment(-(newDoc.transactionAmount))
//           });
//         if (newDoc.transactionCategory != null) {
//           const updateNewCategory = await admin.firestore().doc(newDoc.transactionCategory.path)
//             .update({
//               spentAmount: admin.firestore.FieldValue.increment(newDoc.transactionAmount)
//             });
//         }
//     }

//     return null;

//   })