const functions = require('firebase-functions');
const admin = require('firebase-admin');

//const axios = require('axios');

exports.newPaymentWebhook = functions.runWith({
    timeoutSeconds: 300,
    memory: '1GB',
    secrets: ["FW_WEBHOOK_HASH"],
})
    .https.onRequest(async (req, res) => {
        functions.logger.log('REQUEST', req);
        // Check if the request is authorized
        if (req.headers['verif-hash'] != process.env.FW_WEBHOOK_HASH) {
            res.status(403).send('Forbidden');
            return;
        }

        const payload = req.body;

        functions.logger.log('PAYLOAD', payload);

        // Fetch the billing event
        const updateBillingEvent = admin.firestore().collection('users')
            .where('email', '==', payload.customer.email)
            .limit(1).get().then(async snapshot => {
                functions.logger.log('USERDOC', snapshot.docs[0].ref.id);
                const user = snapshot.docs[0];

                functions.logger.log('TXREF', payload.txRef);

                const event = await admin.firestore().collection('users').doc(user.ref.id)
                    .collection('billingEvents').doc(payload.txRef).get()
                    .then(async snapshot => {
                        if (!snapshot.empty) {
                            functions.logger.log('SNAPSHOT IS EMPTY');
                            const billingEvent = snapshot;
                            functions.logger.log('EXISTING EVENT', billingEvent.data())

                            //Check if the billing event has already been updated
                            if (billingEvent.data().status != payload.status) {

                                // Update the billing event
                                await billingEvent.ref.update({
                                    ...payload,
                                    //billingStatus: 'updated'
                                });
                                functions.logger.log('Billing Event updated');

                                createdDate = new Date(Date.parse(payload.createdAt));
                                functions.logger.log('CREATED DATE', createdDate);

                                switch (payload.status) {
                                    case 'successful':
                                        functions.logger.log('Payment successful');
                                        const updateUser = admin.firestore().collection('users').doc(user.ref.id)
                                            .collection('paymentInfo').limit(1).get()
                                            .then(async snapshot => {
                                                if (!snapshot.empty) {
                                                    const paymentInfo = snapshot.docs[0];
                                                    await paymentInfo.ref.update({
                                                        payStatus: 'active',
                                                        lastPayment: admin.firestore.Timestamp.fromDate(createdDate),
                                                        expireDate: admin.firestore.FieldValue.delete(),
                                                        billingEventID: payload.txRef,
                                                        //nextPayment: admin.firestore.Timestamp.fromDate(payload.createdAt),
                                                    });
                                                }
                                            });
                                        break;
                                    case 'failed':
                                        functions.logger.log('Payment failed');
                                        break;
                                    case 'deactivated':
                                        functions.logger.log('Subscription deactivated');
                                        const deactivateUser = admin.firestore().collection('users').doc(user.ref.id)
                                            .collection('paymentInfo').limit(1).get()
                                            .then(async snapshot => {
                                                if (!snapshot.empty) {
                                                    const paymentInfo = snapshot.docs[0];
                                                    await paymentInfo.ref.update({
                                                        payStatus: 'expired',
                                                        billingEventID: payload.txRef,
                                                        //nextPayment: admin.firestore.Timestamp.fromDate(payload.createdAt),
                                                    });
                                                }
                                            });
                                        break;
                                }

                            } else {
                                functions.logger.log('Billing Event already exists');

                                await billingEvent.ref.update({
                                    //...payload,
                                    recievedDuplicate: admin.firestore.Timestamp.now(),
                                });

                                res.status(200).send('Webhook received');
                            }
                        }
                    });
            });

        res.status(200).send('Webhook received');
    });