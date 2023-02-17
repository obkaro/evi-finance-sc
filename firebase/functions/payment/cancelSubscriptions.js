const functions = require('firebase-functions');
const admin = require('firebase-admin');

const axios = require('axios');

exports.cancelSubscriptions = functions.runWith({
    timeoutSeconds: 300,
    memory: '1GB',
    secrets: ["FW_KEY"],
})
    .pubsub.schedule('0 6 * * *').onRun(async (context) => {

        const time = admin.firestore.Timestamp.now();

        // const subscriptions = await admin.firestore().collectionGroup('paymentInfo')
        //     .where('payStatus', '==', 'active')
        //     .where('expireDate', '<', time)
        //     .get();

        // subscriptions.forEach(async documentSnapshot => {

        //     const subscriptionId = documentSnapshot.data().subscriptionId;

        //     const options = {
        //         method: 'PUT',
        //         url: `https://api.flutterwave.com/v3/subscriptions/${subscriptionId}/cancel`,
        //         headers: {
        //             Authorization: `Bearer ${process.env.FW_KEY}`
        //         },
        //         data: {
        //             id: subscriptionId
        //         }
        //     };

        //     axios.request(options)
        //         .then(async function (response) {
        //             functions.logger.log('RESPONSE', response.data);
        //             await documentSnapshot.ref.update({
        //                 payStatus: 'expired'
        //             });
        //         })
        //         .catch(function (error) {
        //             functions.logger.log('ERROR', error);
        //         });

        // });

    });