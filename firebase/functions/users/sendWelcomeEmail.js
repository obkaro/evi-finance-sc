const functions = require('firebase-functions');
const admin = require('firebase-admin');

// const axios = require('axios');
// const mailchimp = require('@mailchimp/mailchimp_marketing');
const postmark = require('postmark');

exports.sendWelcomeEmail = functions.runWith({ secrets: ["POSTMARK_TRANS_TOKEN"] })
    .firestore.document('users/{userid}/billingEvents/{id}').onCreate(async (snap, context) => {
        const user = await admin.firestore().doc(`users/${context.params.userid}`).get();

        functions.logger.log('User created: ', user);

        const client = new postmark.Client(process.env.POSTMARK_TRANS_TOKEN);

        client.sendEmailWithTemplate({
            "From": "hello@evifinance.com",
            "To": user.email,
            "TemplateAlias": "welcome-2",
            "TemplateModel": {
                "product_url": "https://evifinance.com",
                "product_name": "Evi",
                "action_url": "https://paystack.com/pay/72s1jk0v8i",
                "support_email": "hello@evifinance.com",
                "company_name": "Evi Technologies",
                "twitter_url": "https://twitter.com/evifinance",
                "instagram_url": "https://www.instagram.com/evifinance/",
                "whatsapp_number": "+2348145392090",
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

    });