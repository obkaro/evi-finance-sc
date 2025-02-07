// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future normalizeTransSub(TransactionsRecord transaction) async {
  // Add your function code here!

  final subscriptionsUpdateData = {
    ...createSubscriptionsRecordData(
      lastCharge: createMoneyStruct(delete: true),
    ),
    'transactions': FieldValue.arrayRemove([transaction!.reference]),
    'narrations': FieldValue.arrayRemove([transaction!.transactionNarration]),
    'lastChargeDate': FieldValue.delete(),
    'dateAssigned': FieldValue.delete(),
  };

  //Update/reset the subscription record stored in the transaction collection
  await transaction!.recurringRef!.update(subscriptionsUpdateData);
}
