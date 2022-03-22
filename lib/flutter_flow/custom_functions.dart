import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int calculateTotalInt(
  List<BudgetCategoriesRecord> categoriesToCalc,
  BudgetsRecord budget,
) {
  // Add your function code here!
  int total = 0;
  for (var i = 0; i < categoriesToCalc.length; i++) {
    //var currentCat = categoriesToCalc[i];

    total += categoriesToCalc[i].allocatedAmount;
  }
  int remaining = budget.budgetAmount - total;

  return remaining;
}

List<String> getCategoryNames(List<BudgetCategoriesRecord> listForNames) {
  // Add your function code here!
  List<String> list;

  for (var i = 0; i < listForNames.length; i++) {
    list.add(listForNames[i].categoryName);
  }
  return list;
}
