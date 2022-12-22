const functions = require('firebase-functions');
const admin = require('firebase-admin');

exports.renewBudgets = functions.pubsub.schedule('*/15 * * * *').onRun(async (context) => {

    const time = admin.firestore.Timestamp.now();
  
    const budgets = await admin.firestore().collection('budgets').where('status', '==', 'active').where('budgetEnd', '<', time).get()
      .then(querySnapshot => {
        querySnapshot.forEach(async documentSnapshot => {
  
          const newID = Math.random().toString(36).substring(2, 16) + Math.random().toString(36).substring(2, 16);
  
          const existingEnd = documentSnapshot.data().budgetEnd.toDate();
          const endOffset = documentSnapshot.data().duration;
  
          functions.logger.log("EXISTING END", existingEnd.toString());
  
          const newStart = new Date(existingEnd.getTime());
  
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
            parentBudget: documentSnapshot.ref,
            budgetSpent: 0
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
                category_id: catID,
                //category_owner: document.data().category_owner,
                spentAmount: 0,
                createdDate: time
              });
            })
          })
  
          const user = await admin.firestore().collection('users').doc(userID).get();
  
          functions.logger.log('USER DATA = ', user.data());
  
          const renewedNotif = await admin.firestore().collection('ff_push_notifications').add({
            initial_page_name: 'ActiveBudget',
            notification_sound: 'default',
            notification_text: 'Hi ' + user.data().username + ', your ' + documentSnapshot.data().budgetDuration + ' budget has been renewed. Come check it out!',
            notification_title: 'Evi',
            timestamp: time,
            user_refs: documentSnapshot.data().budgetOwner.path.toString()
          });
  
  
        })
      })
  
    return null;
  })