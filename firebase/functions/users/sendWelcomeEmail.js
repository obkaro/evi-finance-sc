const functions = require('firebase-functions');
const admin = require('firebase-admin');

// const axios = require('axios');
// const mailchimp = require('@mailchimp/mailchimp_marketing');
const postmark = require('postmark');

exports.sendWelcomeEmail = functions.runWith({ secrets: ["POSTMARK_TRANS_TOKEN"] })
    .firestore.document('users/{userid}/billingEvents/{id}').onCreate(async (snap, context) => {
        const user = await admin.firestore().doc(`users/${context.params.userid}`).get();

        functions.logger.log('User created: ', user.data());

        // function getValueFromEmail(email) {
        //     const emailHash = email.split("").reduce(function (a, b) {
        //         a = (a << 5) - a + b.charCodeAt(0);
        //         return a & a;
        //     }, 0);

        //     return Math.floor(emailHash % 3) + 1;
        // }

        // const value = getValueFromEmail(user.data().email);
        const value = Math.floor(Math.random() * 3) + 1;
        functions.logger.log('Value: ', value);

        let subscriptionLink = "https://paystack.com/pay/-k4x16e-kt";
        let price = 250;

        if (value == 1) {
            subscriptionLink = "https://paystack.com/pay/72s1jk0v8i";
            price = 900;
        }

        if (value == 2) {
            subscriptionLink = "https://paystack.com/pay/yisd4i4vkq";
            price = 500;
        }

        if (value == 3) {
            subscriptionLink = "https://paystack.com/pay/-k4x16e-kt";
            price = 250;
        }

        const client = new postmark.Client(process.env.POSTMARK_TRANS_TOKEN);

        try {
            client.sendEmailWithTemplate({
                "From": "hello@evifinance.com",
                "To": user.data().email,
                "TemplateAlias": "welcome-2",
                "TemplateModel": {
                    "product_url": "https://evifinance.com",
                    "product_name": "Evi",
                    "action_url": subscriptionLink,
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
            }).then(async () => {
                await admin.firestore().doc(`users/${context.params.userid}`).update({
                    welcomeEmailSent: admin.firestore.Timestamp.now(),
                    subscriptionLink: subscriptionLink,
                    subscriptionPrice: price
                });
            });
            functions.logger.log(`Email with ${price} sent to: `, user.data().email);
        } catch (error) {
            functions.logger.log(`Error sending email with ${price}: `, error);
        }
    });