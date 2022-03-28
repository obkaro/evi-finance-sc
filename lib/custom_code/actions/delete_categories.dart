// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future deleteCategories(List<BudgetCategoriesRecord> createdCategories) async {
  // Add your function code here!
  for (var i = 0; i < createdCategories.length; i++) {
    while (createdCategories[i].categoryName != 'Uncategorized') {
      await createdCategories[i].reference.delete();
    }
  }
}
