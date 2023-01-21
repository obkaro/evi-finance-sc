// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<PaymentInfoRecord> fetchPayInfo(
    BuildContext context, DocumentReference? paymentInfoRef) async {
  // Add your function code here!

  final paymentInfo = PaymentInfoRecord.getDocument(paymentInfoRef!);
  return paymentInfo.first;
}
