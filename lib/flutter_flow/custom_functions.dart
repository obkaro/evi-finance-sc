import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int calculateRemBudgetCat(
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

String calcRemCatCurrency(
  List<BudgetCategoriesRecord> categoriesToCalc,
  BudgetsRecord budget,
) {
  // Add your function code here!
  final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'en_US', name: 'NGN', decimalDigits: 0);

  int total = 0;
  for (var i = 0; i < categoriesToCalc.length; i++) {
    //var currentCat = categoriesToCalc[i];

    total += categoriesToCalc[i].allocatedAmount;
  }
  int remaining = budget.budgetAmount - total;

  return formatCurrency.format(remaining);
}

List<String> getCategoryNames(List<BudgetCategoriesRecord> listForNames) {
  // Add your function code here!
  List<String> list;

  for (var i = 0; i < listForNames.length; i++) {
    list.add(listForNames[i].categoryName);
  }
  return list;
}

double calcBudgetChart(
  BudgetsRecord budget,
  List<TransactionsRecord> transactions,
) {
  // Add your function code here!

  int totalCategoriesSpent = 0;

  for (var e = 0; e < transactions.length; e++) {
    totalCategoriesSpent += transactions[e].transactionAmount;
  }

  double budgPercent = (totalCategoriesSpent / budget.budgetAmount);

  if (totalCategoriesSpent >= budget.budgetAmount) {
    budgPercent = 1.0;
  }

  return budgPercent;
}

String calcRemBudgetCopy(BudgetsRecord budget) {
  // Add your function code here!
  final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'en_US', name: 'NGN', decimalDigits: 0);
  int remaining = budget.budgetAmount - budget.budgetSpent;
  return formatCurrency.format(remaining);
}

double calcCategoryPercent(
  BudgetCategoriesRecord category,
  List<TransactionsRecord> transactions,
) {
  // Add your function code here!
  int totalTransactions = 0;

  for (var i = 0; i < transactions.length; i++) {
    totalTransactions += transactions[i].transactionAmount;
  }

  double percent = (totalTransactions / category.allocatedAmount);

  if (totalTransactions >= category.allocatedAmount) {
    percent = 1.0;
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
  int result = value1 - value2;

  if (value2 > value1) {
    result = value2 - value1;
  }

  return result;
}

int addInt(
  int value1,
  int value2,
) {
  // Add your function code here!
  int result = value1 + value2;

  return result;
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
  int originalCategoryAmt,
) {
  // Add your function code here!

  //Originally implemented in bottom sheet for edit budget category
  //This function checks if the new category amount exceeds the allocated budget
  //by adding the existing category amount back into the remaining budget amount
  //and then subtracting the new amount from it. If it results -ve, the new amount is too big

  return (budgetRemaining + originalCategoryAmt) - widgetStateAmount;
}

int koboToNaira(int koboValue) {
  // Add your function code here!
  return (koboValue / 100).round();
}

String formatTransCurrency(int num) {
  // Add your function code here!
  //NumberFormat formatNumber = NumberFormat.decimalPattern('en_us');
  final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'en_US', name: 'NGN', decimalDigits: 2);

  return formatCurrency.format(num / 100);
}

String formatBudgetCurrency(int num) {
  // Add your function code here!
  //NumberFormat formatNumber = NumberFormat.decimalPattern('en_us');
  final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'en_US', name: 'NGN', decimalDigits: 0);

  return formatCurrency.format(num / 100);
}

String subtractCurrency(
  int value1,
  int value2,
) {
  // Add your function code here!
  String formatedResult;
  int result;
  final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'en_US', name: 'NGN', decimalDigits: 0);

  if (value1 > value2) {
    result = value1 - value2;
    formatedResult = formatCurrency.format(result / 100) + ' Left';
  } else if (value2 == value1) {
    formatedResult = 'Exhausted';
  } else if (value2 > value1) {
    result = value2 - value1;
    formatedResult = formatCurrency.format(result / 100) + ' Over';
  }

  return formatedResult;
}

int sumTotalCategoriesSpent(
  List<BudgetCategoriesRecord> categoriesToSum,
  List<TransactionsRecord> transactions,
) {
  // Add your function code here!
  //This function takes a number of categories and outputs the sum of their spent amounts

  int totalSpent = 0;

  for (var i = 0; i < transactions.length; i++) {
    totalSpent += transactions[i].transactionAmount;
  }

  return totalSpent;
}

String repeatingOrOnce(bool repeatingSwitch) {
  // Add your function code here!
  String rTrue = 'Repeating';
  String rFalse = 'One Time';
  if (repeatingSwitch = true) {
    return rTrue;
  } else {
    return rFalse;
  }
}

int sumTransactionAmounts(List<TransactionsRecord> transactions) {
  // Add your function code here!
  int total = 0;

  for (var i = 0; i < transactions.length; i++) {
    total += transactions[i].transactionAmount;
  }

  return total;
}

String overOrUnder(
  int value1,
  int value2,
) {
  // Add your function code here!
  String result = 'Left';

  if (value2 > value1) {
    result = 'Over';
  }

  return result;
}

int listCounterBudgets(List<BudgetsRecord> budgets) {
  // Add your function code here!
  return budgets.length;
}

int sumCategoryAmounts(List<BudgetCategoriesRecord> categories) {
  // Add your function code here!
  int total = 0;
  for (var i = 0; i < categories.length; i++) {
    total += categories[i].allocatedAmount;
  }

  return total;
}

int sumAccountBalances(List<AccountsRecord> accounts) {
  // Add your function code here!
  int total = 0;
  for (int i = 0; i < accounts.length; i++) {
    total += accounts[i].accountBalance;
  }

  return total;
}

DateTime addDaysToDate(
  DateTime startDate,
  int daysToAdd,
) {
  // Add your function code here!
  var newDate =
      DateTime(startDate.year, startDate.month, startDate.day + daysToAdd);

  return newDate;
}

bool listChecker(List<BudgetCategoriesRecord> listToCheck) {
  // Add your function code here!
  int count = 0;
  bool emptyOrNot = false;
  for (int i = 0; i < listToCheck.length; i++) {
    count++;
  }
  if (count < 1) {
    emptyOrNot = true;
  }
  return emptyOrNot;
  //true = empty, false = not empty.
}

int isBudgetExising(DocumentReference userBudget) {
  // Add your function code here!
  int existing = 0;

  if (userBudget != null) {
    existing = 1;
  }

  return existing;
}
