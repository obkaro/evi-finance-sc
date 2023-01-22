const functions = require('firebase-functions');
const admin = require('firebase-admin');

const axios = require('axios');

exports.newPaymentListener = functions.firestore.document('users/{userid}/billingEvents/{eventid}')
    .onCreate(async (snap, context) => {

        const billingEvent = snap.data();
        const eventid = context.params.eventid;
        const userid = context.params.userid;

        // TODO: INSERT SOME VALIDATION LOGIC HERE

        functions.logger.log('CREATED NEW PAYMENT', billingEvent);

        // const got = await import('got');

        functions.logger.log('EVENT ID', context.params.eventid);

        // const options = {
        //     method: 'POST',
        //     url: 'https://api.flutterwave.com/v3/payments',
        //     headers: {
        //         Authorization: `Bearer `
        //     },
        //     data: {
        //         tx_ref: eventid,
        //         amount: "1190",
        //         currency: "NGN",
        //         redirect_url: "https://evi-web-ketcis.flutterflow.app/payment",
        //         meta: {
        //             user_id: userid,
        //             consumer_mac: "92a3-912ba-1192a"
        //         },
        //         customer: {
        //             email: billingEvent.email,
        //             //phonenumber: "080****4528",
        //             name: billingEvent.username
        //         },
        //         customizations: {
        //             title: "Evi Finance",
        //             logo: "https://uploads-ssl.webflow.com/63271ce98ed0284719d64fe4/63bd6f47407d432dcea6214e_evi-app-icon.png",
        //             description: "Monthly access to Evi"
        //         },
        //         payment_plan: 31632
        //     }
        // };

        // axios.request(options)
        //     .then(async function (response) {

        functions.logger.log('RESPONSE', response.data);

        const paymentInfo = await admin.firestore().collection('users')
            .doc(userid).collection('paymentInfo')
            .limit(1).get()
            .then(async snapshot => {
                const info = snapshot.docs[0];
                functions.logger.log('INFO', info.data());

                const payment = await admin.firestore().collection('users')
                    .doc(userid).collection('paymentInfo')
                    .doc(info.id).update({
                        billingEventId: eventid,
                        // paymentUrl: response.data.data.link,
                        payStatus: 'pending',
                        email: billingEvent.email,
                        username: billingEvent.username,
                    });
            });
        // })

        // .catch(function (error) {
        //     functions.logger.log('ERROR', error);
        // });


        // try {
        //     const response = await got.post("https://api.flutterwave.com/v3/payments", {
        //         headers: {
        //             Authorization: `Bearer `
        //         },
        //         json: {
        //             tx_ref: hashed_id,
        //             amount: "100",
        //             currency: "NGN",
        //             redirect_url: "https://evifinance.com/accountmanagement",
        //             meta: {
        //                 user_id: billingEvent.ownerId,
        //                 consumer_mac: "92a3-912ba-1192a"
        //             },
        //             customer: {
        //                 email: billingEvent.email,
        //                 //phonenumber: "080****4528",
        //                 name: billingEvent.username
        //             },
        //             customizations: {
        //                 title: "Evi Finance",
        //                 logo: "https://uploads-ssl.webflow.com/63271ce98ed0284719d64fe4/6327db8acd40a873e8132f50_evi-logo-2.svg",
        //                 description: "Monthly access to Evi"
        //             },
        //             payment_plan: 31632
        //         }
        //     }).json();
        //     functions.logger.log('RESPONSE: ', response);
        // } catch (err) {
        //     Functions.logger.log('ERROR: ', err);
        //     functions.logger.log('ERROR CODE: ', err.code);
        //     functions.logger.log('ERROR BODY: ', err.response.body);
        // }

        // const writelink = await admin.firestore().collection('paymentInfo').doc(billingEvent.ownerId).update({
        //     payStatus: 'pending',
        //     paymentUrl: response.data.link
        // })

        return null;

    });