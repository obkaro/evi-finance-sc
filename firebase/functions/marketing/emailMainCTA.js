const functions = require('firebase-functions');
const admin = require('firebase-admin');

const postmark = require('postmark');

//WEBFLOW FORM SUBMISSIONS
exports.emailMainCTA = functions.runWith({secrets: ['POSTMARK_TRANS_TOKEN']}).https.onRequest(async (req, res) => {
  functions.logger.log('WEBFLOW FORM SUBMISSION');
  functions.logger.log(req.body);
  functions.logger.log(req.body.data.Email);
  const formid = req.body._id;
  functions.logger.log(formid);

  const time = admin.firestore.Timestamp.now();

  const client = new postmark.Client(process.env.POSTMARK_TRANS_TOKEN);

  client.sendEmailWithTemplate({
    "From": "hello@evifinance.com",
    "To": req.body.data.Email,
    "TemplateAlias": "welcome-1",
    "TemplateModel": {
      "product_url": "https://evifinance.com",
      "product_name": "Evi",
      "action_url": "https://play.google.com/store/apps/details?id=com.evi.finance",
      "support_email": "hello@evifinance.com",
      "company_name": "Evi Technologies",
      // "name": "name_Value",
      // "login_url": "login_url_Value",
      // "username": "username_Value",
      // "trial_length": "trial_length_Value",
      // "trial_start_date": "trial_start_date_Value",
      // "trial_end_date": "trial_end_date_Value",
      // "live_chat_url": "live_chat_url_Value",
      "sender_name": "Evi Finance",
      // "help_url": "help_url_Value",
      // "company_address": "company_address_Value"
    }
  });
  res.status(200).send();

})