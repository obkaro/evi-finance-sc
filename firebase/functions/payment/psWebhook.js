const functions = require('firebase-functions');
const admin = require('firebase-admin');

//const axios = require('axios');
const crypto = require('crypto');

exports.psWebhook = functions.runWith({
    timeoutSeconds: 300,
    memory: '1GB',
    secrets: ["PS_LIVE_SK"],
})
    .https.onRequest(async (req, res) => {

        const payload = req.body;
        functions.logger.log('PAYLOAD', payload);

        const hash = crypto.createHmac('sha512', process.env.PS_LIVE_SK)
            .update(JSON.stringify(req.body)).digest('hex');

        functions.logger.log('HASH', hash);

        if (hash !== req.headers['x-paystack-signature']) {
            res.sendStatus(400);
            return;
        }

        const event = payload.event;
        res.sendStatus(200);

        switch (event) {
            case 'charge.success':
                functions.logger.log('CHARGE SUCCESS');
                await admin.firestore().collection('users')
                    .where('email', '==', payload.data.customer.email)
                    .limit(1).get().then(async snapshot => {
                        
                        const user = snapshot.docs[0];
                        functions.logger.log('USER', user.ref.id);
                        
                        await admin.firestore().collection(`users/${user.ref.id}/psWebhooks`)
                            .doc(payload.data.reference).update({
                                ...payload,
                                timeUpdated: admin.firestore.FieldValue.serverTimestamp()
                            })
                            .catch(err => { functions.logger.log(err) });
                    });
                break;

            case 'subscription.create':
                    functions.logger.log('SUBSCRIPTION CREATE');
                await admin.firestore().collection('users')
                    .where('email', '==', payload.data.customer.email)
                    .limit(1).get().then(async snapshot => {
                        
                        const user = snapshot.docs[0];
                        const nextPayDate = new Date(Date.parse(payload.data.next_payment_date));

                        functions.logger.log('USER', user.ref.id);
                        
                        await admin.firestore().collection('users').doc(user.ref.id).set({
                            sub_status: 'active',
                            sub_code: payload.data.subscription_code,
                            plan_code: payload.data.plan.plan_code,
                            customer_code: payload.data.customer.customer_code,
                            next_payment_date: admin.firestore.Timestamp.fromDate(nextPayDate),
                            payment_auth_code: payload.data.authorization.authorization_code,
                            ps_email_token: payload.data.email_token,
                            expire_date: admin.firestore.FieldValue.delete(),
                            first_name: payload.data.customer.first_name ?? "",
                            last_name: payload.data.customer.last_name ?? "",
                            phone_number: payload.data.customer.phone ?? "",
                        }, { merge: true })
                            .then(async () => {
                                
                                await admin.firestore().collection(`users/${user.ref.id}/psWebhooks`)
                                .add({
                                        ...payload,
                                        timeCreated: admin.firestore.FieldValue.serverTimestamp(),
                                        timeUpdated: admin.firestore.FieldValue.serverTimestamp()
                                    }, { merge: true });
                            })
                            .catch(err => { functions.logger.log(err) });
                    });
                break;
                case 'subscription.disable':
                    functions.logger.log('SUBSCRIPTION DISABLE');
                await admin.firestore().collection('users')
                    .where('email', '==', payload.data.customer.email)
                    .limit(1).get().then(async snapshot => {

                        const user = snapshot.docs[0];
                        functions.logger.log('USER', user.ref.id);

                        await admin.firestore().collection('users').doc(user.ref.id).set({
                            sub_status: 'expired',
                            // next_payment_date: admin.firestore.FieldValue.delete(),
                            expire_date: user.data().next_payment_date,
                            ps_email_token: payload.data.email_token
                        }, { merge: true })
                            .then(async () => {

                                await admin.firestore().collection(`users/${user.ref.id}/psWebhooks`)
                                    .add({
                                        ...payload,
                                        timeCreated: admin.firestore.FieldValue.serverTimestamp(),
                                        timeUpdated: admin.firestore.FieldValue.serverTimestamp()
                                    }, { merge: true });
                            })
                            .catch(err => { functions.logger.log(err) });
                    });
                    break;
                    case 'subscription.not_renew':
                        functions.logger.log('SUBSCRIPTION NOT RENEW');
                    await admin.firestore().collection('users')
                        .where('email', '==', payload.data.customer.email)
                        .limit(1).get().then(async snapshot => {
                                
                                const user = snapshot.docs[0];
                                functions.logger.log('USER', user.ref.id);
    
                                await admin.firestore().collection('users').doc(user.ref.id).set({
                                    // sub_status: 'expired',
                                    next_payment_date: admin.firestore.FieldValue.delete(),
                                    expire_date: user.data().next_payment_date,
                                    ps_email_token: payload.data.email_token
                                }, { merge: true })
                                    .then(async () => {
    
                                        await admin.firestore().collection(`users/${user.ref.id}/psWebhooks`)
                                            .add({
                                                ...payload,
                                                timeCreated: admin.firestore.FieldValue.serverTimestamp(),
                                                timeUpdated: admin.firestore.FieldValue.serverTimestamp()
                                            }, { merge: true });
                                    })
                                    .catch(err => { functions.logger.log(err) });
                            });
                            break;

        }
        return;
    });