// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future unlinkAllTransCategories(
  List<TransactionsRecord>? transactions,
) async {
  // Add your function code here!
  for (var i = 0; i < transactions!.length; i++) {
    final transactionsUpdateData = {
      ...createTransactionsRecordData(
        categoryDetails: createCategoryDetailsStruct(delete: true),
        subscriptionDetails: createSubscriptionDetailsStruct(delete: true),
        isAssigned: false,
      ),
      'transactionCategory': FieldValue.delete(),
      'recurringRef': FieldValue.delete(),
      'transactionBudget': FieldValue.delete(),
      'dateAssigned': FieldValue.delete(),
    };
    await transactions[i].reference.update(transactionsUpdateData);
  }
}
