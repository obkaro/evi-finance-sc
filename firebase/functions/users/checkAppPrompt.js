const functions = require('firebase-functions');
const admin = require('firebase-admin');

//SCHEDULE NOTIFICAITON TO CHECK TRANSACTIONS
exports.checkAppPrompt = functions.pubsub.schedule('0 15 */2 * *').onRun(async (context) => {
    const userlist = await admin.firestore().collection('users').get();
  
    const time = admin.firestore.Timestamp.now();
  
    userlist.docs.forEach(async (user) => {
      const checknotif = await admin.firestore().collection('ff_push_notifications').add({
        initial_page_name: 'dashboard',
        notification_sound: 'default',
        notification_text: `Hey ${user.data().username}, come see what's happened on your accounts over the last couple of days!`,
        notification_title: 'Stay on track',
        timestamp: time,
        user_refs: user.ref.path.toString()
      });
    })
  })