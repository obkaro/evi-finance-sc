// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../main.dart';

Future<DateTimeRange?> selectDateRangeExisting(
  BuildContext context,
  BudgetsRecord createdBudget,
  //DateTimeRange oldRange,
) async {
  // Add your function code here!
  DateTimeRange? newRange = await showDateRangePicker(
    context: context,
    firstDate: DateTime(2022),
    lastDate: DateTime(2023),
    currentDate: getCurrentTimestamp,
    saveText: 'Next',
    //initialDateRange: oldRange,
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
