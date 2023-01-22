
const functions = require('firebase-functions');
const admin = require('firebase-admin');

const sdk = require('api')('@mono/v1.0#33hmc2izkyejmoej');
const axios = require('axios');

// UPDATE ACCOUNTS
exports.accountUpdate = functions.runWith({ 
  timeoutSeconds: 300, 
  memory: '1GB', 
  secrets: ['MONO_SK', 'MONO_SEC_ACCT_UPDATE']
})
  .https.onRequest(async (req, res) => {

    if (req.headers['mono-webhook-secret'] != process.env.MONO_SEC_ACCT_UPDATE) {
      res.status(403).send('Forbidden');
      return;
    }

    functions.logger.log("REQUEST BODY", req.body);

    let payload = req.body;

    //for MONO ACCOUNT UPDATE
    if (payload.event == "mono.events.account_updated") {

      const account = await admin.firestore().collection('accounts')
        .where('authID', '==', payload.data.account._id)
        .get();

      const logo = await admin.firestore().collection('constInstitutionLogos')
        .where('institutionCode', '==', payload.data.account.institution.bankCode)
        .get();

      const currentdate = new Date();

      const update = {
        accountBalance: req.body.data.account.balance,
        accountName: req.body.data.account.name,
        accountNumber: req.body.data.account.accountNumber,
        accountType: req.body.data.account.type,
        authID: req.body.data.account._id,
        authMethod: req.body.data.meta.data_status,
        bankCode: req.body.data.account.institution.bankCode,
        bvn: req.body.data.account.bvn,
        currency: req.body.data.account.currency,
        dataStatus: req.body.data.meta.data_status,
        institutionName: req.body.data.account.institution.name,
        institutionType: req.body.data.account.institution.type,
        lastSync: currentdate,
        reauthRequired: false,
        accountLogo: logo.docs[0].data().institutionLogo,
        awaitingWebhook: false,
      };

      // axios
      //   .request(options)
      //   .then(async function (response) {

      //functions.logger.log("Update Object", update);

      if (!account.empty) {
        const snapshot = account.docs[0];
        await snapshot.ref.update(update);

        const options = {
          method: 'GET',
          url: 'https://api.withmono.com/accounts/' + req.body.data.account._id + '/transactions',
          headers: { Accept: 'application/json', 'mono-sec-key': process.env.MONO_SK }
        };
        axios
          .request(options)
          .then(async function (response) {

            //functions.logger.log("RESPONSE", response.data);

            const transactions = response.data.data;

            //for (let element in transactions) {

            response.data.data.forEach(async element => {

              //functions.logger.log("ELEMENT", element);

              const id = element.amount + element.narration + element.date + element.balance + account.docs[0].ref.path.toString();
              const parsedDate = new Date(Date.parse(element.date));

              //functions.logger.log(id);

              const hash = function (str, seed = 0) {
                let h1 = 0xdeadbeef ^ seed, h2 = 0x41c6ce57 ^ seed;
                for (let i = 0, ch; i < str.length; i++) {
                  ch = str.charCodeAt(i);
                  h1 = Math.imul(h1 ^ ch, 2654435761);
                  h2 = Math.imul(h2 ^ ch, 1597334677);
                }
                h1 = Math.imul(h1 ^ (h1 >>> 16), 2246822507) ^ Math.imul(h2 ^ (h2 >>> 13), 3266489909);
                h2 = Math.imul(h2 ^ (h2 >>> 16), 2246822507) ^ Math.imul(h1 ^ (h1 >>> 13), 3266489909);
                return 4294967296 * (2097151 & h2) + (h1 >>> 0);
              };

              //functions.logger.log(hash(id));

              const exisiting = await admin.firestore().collection('transactions').doc(hash(id).toString()).get();

              if (!exisiting.exists) {
                functions.logger.log('TRANSACTION DOES NOT EXIST. WRITING DATA...')
                const writetransactions = await admin.firestore().collection('transactions').doc(hash(id).toString()).set(
                  {
                    account: account.docs[0].ref,
                    trasactionDate: admin.firestore.Timestamp.fromDate(parsedDate),
                    //monoCategory: transaction.data[i].,
                    transactionOwner: account.docs[0].data().accountOwner,
                    balanceAfter: element.balance,
                    transactionAmount: element.amount,
                    transactionMonoID: element._id,
                    transactionType: element.type,
                    transactionNarration: element.narration,
                    monoCategory: element.category,
                    accountDetails: {
                      logo: logo.docs[0].data().institutionLogo
                    },
                    isAssigned: false
                  },
                )
              } else {
                functions.logger.log('TRANSACTION ALREADY EXISTS')
              }
            });
            //functions.logger.log(response.data);
          })
          .catch(function (error) {
            console.error(error);
          });
      } else {
        functions.logger.log("ACCOUNT NOT FOUND", account);
      }

      //functions.logger.log("ACCOUNT EXISTING DATA", account);

      res.status(200).send('SUCCESS');
    } else res.status(200).send('INVALID REQUEST');

  })
