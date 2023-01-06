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
