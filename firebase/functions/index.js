const admin = require('firebase-admin');
const { firebaseConfig } = require("firebase-functions");
admin.initializeApp();



//* ACCOUNTS
exports.accountUpdate = require('./accounts/accountUpdate').accountUpdate;
exports.dataSync = require('./accounts/dataSync').dataSync;
exports.reauthFlag = require('./accounts/reauthFlag').reauthFlag;

//* BUDGETS
exports.recalculateSpend = require('./budgets/recalculateSpend').recalculateSpend;
exports.renewBudgets = require('./budgets/renewBudgets').renewBudgets;

//* MARKETING
exports.emailMainCTA = require('./marketing/emailMainCTA').emailMainCTA;

//* OPS
exports.dailyFirestoreBackup = require('./ops/dailyFirestoreBackup').dailyFirestoreBackup;


//* SUBSCRIPTIONS
exports.subscriptionReminder = require('./subscriptions/subscriptionReminder').subscriptionReminder;


//* USERS
exports.checkAppPrompt = require('./users/checkAppPrompt').checkAppPrompt;

//* IMPORT CONTACTS
exports.mailchimpImport = require('./marketing/mailchimpImport').mailchimpImport;

//* LISTEN FOR PAYMENT
exports.newPaymentListener = require('./payment/newPaymentListener').newPaymentListener;

//* WEBHOOK FOR PAYMENT
exports.newPaymentWebhook = require('./payment/newPaymentWebhook').newPaymentWebhook;

//* CANCEL SUBSCRIPTIONS PERIODICALLY
exports.cancelSubscriptions = require('./payment/cancelSubscriptions').cancelSubscriptions;

//* WEBHOOK FOR PAYSTACK
exports.psWebhook = require('./payment/psWebhook').psWebhook;

//* SEND WELCOME EMAIL
exports.sendWelcomeEmail = require('./users/sendWelcomeEmail').sendWelcomeEmail;
