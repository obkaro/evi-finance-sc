// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future unlinkAllTransCategories(
  List<TransactionsRecord> transactions,
  BudgetCategoriesRecord category,
) async {
  // Add your function code here!
  for (var i = 0; i < transactions.length; i++) {
    final categoryUpdateData = {
      'isCategorized': false,
      'linkedCategory': FieldValue.delete(),
    };

    await transactions[i].reference.update(categoryUpdateData);
  }
}
