const functions = require('firebase-functions');
const admin = require('firebase-admin');

const client = require("@mailchimp/mailchimp_marketing");

exports.mailchimpImport = functions.runWith({ secrets: ['MAILCHIMP_KEY']}).firestore.document('subscriptions/{Id}')
.onWrite(async (change, context) => {
    
    //const payload = req.body;

    client.setConfig({
        apiKey: process.env.MAILCHIMP_KEY,
        server: "us17",
    });

    const run = async () => {
        const response = await client.lists.addListMember("6704dd2600", {
            email_address: "testprod1234@gmail.com",
            status: "subscribed",
            merge_fields: {
                FNAME: "Asampd",
                LNAME: "Oni",
                FULLNAME: "Asampd Oni",
                UNAME: "asampd",
                CHANNEL: "youtube",
            }
        });
        console.log(response);
    };

    run();

    return null;
});