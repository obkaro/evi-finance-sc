// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import '../../main.dart';

Future<DateTimeRange?> selectDateRange(
    BuildContext context, BudgetsRecord createdBudget) async {
  // Add your function code here!
  DateTimeRange? newRange = await showDateRangePicker(
    context: context,
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
    currentDate: getCurrentTimestamp,
    saveText: 'Next',
  );

  if (newRange == null) {
    createdBudget.reference.delete();
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => NavBarPage(initialPage: 'Budgets'),
      ),
      (r) => false,
    );
  }
  return newRange;
}
