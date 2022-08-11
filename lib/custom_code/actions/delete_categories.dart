// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future deleteCategories(
  List<CategoriesRecord>? createdCategories,
  BudgetsRecord? budget,
) async {
  // Add your function code here!
  for (var i = 0; i < createdCategories!.length; i++) {
    //if (createdCategories[i].categoryName! != "Bank Charges"){
    await createdCategories[i].reference.delete();
    //}
    final budgetsUpdateData = createBudgetsRecordData(
        unallocatedAmount: (budget!.unallocatedAmount as int) +
            (createdCategories[i].categoryAmount as int)
        //functions.subInt(
        //      FFAppState().currencyTextField, widget.categoryTotal),
        );
    await budget.reference.update(budgetsUpdateData);
  }
}
