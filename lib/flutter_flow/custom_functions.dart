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

double calcBudgetChart(BudgetsRecord budget) {
  // Add your function code here!
  return 1 - (budget.budgetSpent / budget.budgetAmount);
}

int calcRemBudget(BudgetsRecord budget) {
  // Add your function code here!
  return budget.budgetAmount - budget.budgetSpent;
}

double calcCategoryPercent(BudgetCategoriesRecord category) {
  // Add your function code here!
  double percent = 1 - (category.spentAmount / category.allocatedAmount);

  if (percent > 1) {
    percent--;
  }
  if (percent < 0) {
    percent++;
  }

  return percent;
}

int returnNegative(int positiveNum) {
  // Add your function code here!
  return 0 - positiveNum;
}
