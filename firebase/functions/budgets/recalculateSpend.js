const functions = require('firebase-functions');
const admin = require('firebase-admin');

exports.recalculateSpend = functions.firestore.document('transactions/{id}')
  .onWrite(async (change, context) => {
    const oldDoc = change.before.data();
    const newDoc = change.after.data();

    if (oldDoc == newDoc || oldDoc == null) {
      functions.logger.log('CREATED NEW TRANSACTION, OR NO CHANGE')
      return null;
    }

    if (newDoc == null && oldDoc.transactionBudget != null) {
      functions.logger.log('DELETED NEW TRANSACTION')
      const updateOldBudget = await admin.firestore().doc(oldDoc.transactionBudget.path)
        .update({
          budgetSpent: admin.firestore.FieldValue.increment(-(oldDoc.transactionAmount))
        });
      const updateOldCategory = await admin.firestore().doc(oldDoc.transactionCategory.path)
        .update({
          spentAmount: admin.firestore.FieldValue.increment(-(oldDoc.transactionAmount))
        });
        return null;
    }

    if (newDoc == null && oldDoc.transactionBudget == null) {
      functions.logger.log('DELETED TRANSACTION - NO CHANGE')
      return null;
    }

    let budgetCase = 'default';

    if (oldDoc.transactionBudget == null) { budgetCase = 'null' }
    else if (newDoc.transactionBudget == null) { budgetCase = 'default' }
    else if (oldDoc.transactionBudget.path == newDoc.transactionBudget.path) { budgetCase = 'same' }
    else if (oldDoc.transactionBudget.path != newDoc.transactionBudget.path) { budgetCase = 'default' }

    switch (budgetCase) {
      case 'null':
        functions.logger.log('CASE: NULL');
        functions.logger.log(budgetCase);
        const updateBudget = await admin.firestore().doc(newDoc.transactionBudget.path)
          .update({
            budgetSpent: admin.firestore.FieldValue.increment(newDoc.transactionAmount)
          });
        break;
      case 'same':
        functions.logger.log('CASE: EQUAL TO NEW BUDGET');
        functions.logger.log(budgetCase);
        break;
      case 'default':
        functions.logger.log('DEFAULT');
        functions.logger.log(budgetCase);
        const updateOldBudget = await admin.firestore().doc(oldDoc.transactionBudget.path)
          .update({
            budgetSpent: admin.firestore.FieldValue.increment(-(newDoc.transactionAmount))
          });
        if (newDoc.transactionBudget != null) {
          const updateNewBudget = await admin.firestore().doc(newDoc.transactionBudget.path)
            .update({
              budgetSpent: admin.firestore.FieldValue.increment(newDoc.transactionAmount)
            });
        }
    }

    let categoryCase = 'default';

    if (oldDoc.transactionCategory == null) { categoryCase = 'null' }
    else if (newDoc.transactionCategory == null) { categoryCase = 'default' }
    else if (oldDoc.transactionCategory.path == newDoc.transactionCategory.path) { categoryCase = 'same' }
    else if (oldDoc.transactionCategory.path != newDoc.transactionCategory.path) { categoryCase = 'default' }

    switch (categoryCase) {
      case 'null':
        functions.logger.log('CASE: NULL');
        functions.logger.log(categoryCase);
        const updateCategory = await admin.firestore().doc(newDoc.transactionCategory.path)
          .update({
            spentAmount: admin.firestore.FieldValue.increment(newDoc.transactionAmount)
          });
        break;
      case 'same':
        functions.logger.log('CASE: EQUAL TO NEW Category');
        functions.logger.log(categoryCase);
        break;
      case 'default':
        functions.logger.log('DEFAULT');
        functions.logger.log(categoryCase);
        const updateOldCategory = await admin.firestore().doc(oldDoc.transactionCategory.path)
          .update({
            spentAmount: admin.firestore.FieldValue.increment(-(newDoc.transactionAmount))
          });
        if (newDoc.transactionCategory != null) {
          const updateNewCategory = await admin.firestore().doc(newDoc.transactionCategory.path)
            .update({
              spentAmount: admin.firestore.FieldValue.increment(newDoc.transactionAmount)
            });
        }
    }

    return null;

  })