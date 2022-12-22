const functions = require('firebase-functions');
const admin = require('firebase-admin');

exports.needsreauth = functions.runWith({ timeoutSeconds: 300 }).https.onRequest(async (req, res) => {

    if (req.body.event == "mono.events.reauthorisation_required") {
      let accountid = req.body.data.account._id;
  
      functions.logger.log("RESPONSE FROM MONO:", req.body);
  
      const account = await admin.firestore().collection('accounts').where('authID', '==', accountid).get();
  
      functions.logger.log("ACCOUNT EXISTING DATA", account.docs[0].data());
  
      const currentdate = new Date();
  
      const update = {
        reauthRequired: true,
        failedSync: currentdate
      };
  
      if (!account.empty) {
        const snapshot = account.docs[0];
        await snapshot.ref.update(update);
  
        // const userid = snapshot.data().accountOwner.path.toString().substring(6);
  
        // const user = await admin.firestore().collection('users').doc(userid).get();
  
        // const reauthNotif = await admin.firestore().collection('ff_push_notifications').add({
        //   initial_page_name: 'Accounts',
        //   notification_sound: 'default',
        //   notification_text: 'Hi ' + user.data().username + ', your authentication is required to update one of your accounts. Kindly ignore this message if you have provided authentication in the last few minutes.',
        //   notification_title: 'Evi',
        //   timestamp: currentdate,
        //   user_refs: snapshot.data().accountOwner.path.toString()
        // });
  
  
      } else {
        functions.logger.log("ACCOUNT NOT FOUND", account);
      }
    }
  
    res.status(200).send();
  
  })