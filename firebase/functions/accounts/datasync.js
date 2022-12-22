const functions = require('firebase-functions');
const admin = require('firebase-admin');

const sdk = require('api')('@mono/v1.0#33hmc2izkyejmoej');
const axios = require('axios');


//PERIODIC DATA SYNC
exports.dataSync = functions.pubsub.schedule('0 */14 * * *').onRun(async (context) => {

    const accounts = await admin.firestore().collection('accounts').get();
  
    accounts.docs.forEach(async (account) => {
      const options = {
        method: 'POST',
        url: 'https://api.withmono.com/accounts/' + account.data().authID + '/sync?allow_incomplete_statement=false',
        headers: { Accept: 'application/json', 'mono-sec-key': 'live_sk_k7LNk7ovmMi9CsrmCUid' }
      };
      axios
        .request(options)
        .then(async function (response) {
  
          // if(response.data.event === "mono.events.account_synced") {
  
          //     const options = {
          //       method: 'GET',
          //       url: 'https://api.withmono.com/accounts/' + req.body.data.account._id + '/transactions',
          //       headers: { Accept: 'application/json', 'mono-sec-key': 'live_sk_k7LNk7ovmMi9CsrmCUid' }
          //     };
          //     axios
          //       .request(options)
          //       .then(async function (response) {});
          // }
  
          functions.logger.log(account.data().authID, response.data);
  
          // if (response.data.event === "mono.events.reauthorisation_required") {
          //   //Set requth required to true and notify user
          // }
  
          // if (response.data.event === "mono.events.sync_failed") { }
          //Set failed sync date
        }).catch(function (error) {
          console.error(error);
        });
      res.status(200).send();
    });
  })