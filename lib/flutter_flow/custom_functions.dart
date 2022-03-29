import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int calculateRemBudget(
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
  double budgPercent = 1 - (budget.budgetSpent / budget.budgetAmount);

  while (budgPercent > 1) {
    budgPercent--;
  }

  while (budgPercent < 0) {
    budgPercent++;
  }

  return budgPercent;
}

int calcRemBudget(BudgetsRecord budget) {
  // Add your function code here!
  return budget.budgetAmount - budget.budgetSpent;
}

double calcCategoryPercent(BudgetCategoriesRecord category) {
  // Add your function code here!
  double percent = (category.spentAmount / category.allocatedAmount);

  while (percent > 1) {
    percent--;
  }
  while (percent < 0) {
    percent++;
  }

  return percent;
}

int returnNegative(int positiveNum) {
  // Add your function code here!
  return 0 - positiveNum;
}

int subInt(
  int value1,
  int value2,
) {
  // Add your function code here!
  return value1 - value2;
}

int budgetRemMinusAmt(
  int amountFromWidget,
  int budgetRemaining,
) {
  // Add your function code here!
  return budgetRemaining - amountFromWidget;
}

int checkEditCatTotal(
  int budgetRemaining,
  int widgetStateAmount,
  int categoryTotal,
) {
  // Add your function code here!
  return widgetStateAmount + (budgetRemaining - categoryTotal);
}
