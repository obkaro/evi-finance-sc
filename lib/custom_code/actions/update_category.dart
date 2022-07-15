// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:evi/auth/auth_util.dart';
import 'package:collection/collection.dart';

Future updateCategory(
  CategoriesRecord category,
  int value,
) async {
  // Add your function code here!
  final CategoriesUpdateData = createCategoriesRecordData(
    categoryAmount: value,
  );
  await category.reference.update(CategoriesUpdateData);
}
