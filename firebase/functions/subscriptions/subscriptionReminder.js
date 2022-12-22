const functions = require('firebase-functions');
const admin = require('firebase-admin');

exports.subscriptionReminder = functions.firestore.document('subscriptions/{Id}')
  .onWrite(async (change, context) => {

    functions.logger.log(change.after.data());
    const doc = change.after.exists ? change.after.data() : null;

    if (doc == null) { return null; }
    functions.logger.log(doc.expChargeDate);
    const daysBefore = 1;
    const parsedDate = doc.expChargeDate.toDate();

    const reminderDate = new Date(parsedDate.getTime() - (daysBefore * 86400000));
    functions.logger.log(reminderDate);
    const ownerid = doc.owner.path.toString().substring(6);

    const user = await admin.firestore().collection('users').doc(ownerid).get();

    const time = admin.firestore.Timestamp.now();

    const subscriptionNotif = await admin.firestore().collection('ff_push_notifications').add({
      initial_page_name: 'subscriptionDetails',
      notification_sound: 'default',
      notification_text: `Hey ${user.data().username}, your ${doc.name} subscription is due tomorrow.`,
      notification_title: 'Evi',
      parameter_data: change.after.ref.path,
      scheduled_time: admin.firestore.Timestamp.fromDate(reminderDate),
      timestamp: time,
      user_refs: user.ref.path.toString()
    });
    return null;
  })