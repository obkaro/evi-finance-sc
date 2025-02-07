import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int calculateRemBudgetCat(
  List<CategoriesRecord> categoriesToCalc,
  BudgetsRecord budget,
) {
  // Add your function code here!
  int total = 0;
  for (var i = 0; i < categoriesToCalc.length; i++) {
    //var currentCat = categoriesToCalc[i];

    total += categoriesToCalc[i].categoryAmount as int;
  }
  int remaining = budget.budgetAmount! - total;

  return remaining;
}

DateTime addHoursToTimestamp(
  DateTime startTime,
  int hoursToAdd,
) {
  // Add your function code here!

  return startTime.add(Duration(hours: hoursToAdd));
}

String calcRemCatCurrency(
  List<CategoriesRecord> categoriesToCalc,
  BudgetsRecord budget,
) {
  // Add your function code here!
  final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'en_US', name: 'NGN', decimalDigits: 0);

  int total = 0;
  for (var i = 0; i < categoriesToCalc.length; i++) {
    //var currentCat = categoriesToCalc[i];

    total += categoriesToCalc[i].categoryAmount as int;
  }
  int remaining = budget.budgetAmount! - total;

  return formatCurrency.format(remaining);
}

double? calcChartPercent(
  int totalAmount,
  int spentAmount,
) {
  // Add your function code here!

  if (spentAmount == 0) {
    return 0;
  }

  double percent = 1 - (spentAmount / totalAmount);

  if (spentAmount >= totalAmount) {
    percent = 0;
  }

  return percent;
}

double calcCategoryPercent(
  CategoriesRecord? category,
  int? spentAmount,
) {
  // Add your function code here!
  if (spentAmount == 0) {
    return 1;
  }

  double percent = 1 - (spentAmount! / (category!.categoryAmount as int));

  if (spentAmount >= (category.categoryAmount as int)) {
    percent = 0;
  }

  return percent;
}

double calcCategoryPercentCircle(
  CategoriesRecord? category,
  List<TransactionsRecord>? transactions,
) {
  // Add your function code here!
  int totalTransactions = 0;

  for (var i = 0; i < transactions!.length; i++) {
    totalTransactions += transactions[i].transactionAmount as int;
  }

  double percent = (totalTransactions / (category!.categoryAmount as int));

  if (totalTransactions >= (category.categoryAmount as int)) {
    percent = 0;
  }

  return percent;
}

int subInt(
  int? value1,
  int? value2,
) {
  // Add your function code here!
  int result = value1! - value2!;

  if (value2 > value1) {
    result = value2 - value1;
  }

  return result;
}

int addInt(
  int? value1,
  int? value2,
) {
  // Add your function code here!
  int result = value1! + value2!;

  return result;
}

int checkEditCatTotal(
  int? budgetRemaining,
  int? widgetStateAmount,
  int? originalCategoryAmt,
) {
  // Add your function code here!

  //Originally implemented in bottom sheet for edit budget category
  //This function checks if the new category amount exceeds the allocated budget
  //by adding the existing category amount back into the remaining budget amount
  //and then subtracting the new amount from it. If it results -ve, the new amount is too big

  return (budgetRemaining! + originalCategoryAmt!) - widgetStateAmount!;
}

String formatTransCurrency(int? num) {
  // Add your function code here!
  //NumberFormat formatNumber = NumberFormat.decimalPattern('en_us');
  final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'en_US', name: 'NGN', decimalDigits: 2);

  return formatCurrency.format(num! / 100);
}

String formatBudgetCurrency(int? num) {
  // Add your function code here!
  //NumberFormat formatNumber = NumberFormat.decimalPattern('en_us');
  final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'en_US', name: 'NGN', decimalDigits: 0);

  return formatCurrency.format(num! / 100);
}

String subtractCurrency(
  int? value1,
  int? value2,
) {
  // Add your function code here!
  String formatedResult;
  int result;
  final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'en_US', name: 'NGN', decimalDigits: 2);

  if (value1! > value2!) {
    result = value1 - value2;
    formatedResult = formatCurrency.format(result / 100) + '\nAvailable';
  } else if (value2 == value1) {
    formatedResult = 'Exhausted';
  } else if (value2 > value1) {
    result = value2 - value1;
    formatedResult = formatCurrency.format(result / 100) + '\nOverspent';
  } else {
    formatedResult = "error";
  }

  return formatedResult;
}

String subtractCurrencyText(
  int? value1,
  int? value2,
) {
  // Add your function code here!
  String formatedResult;
  int result;
  final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'en_US', name: 'NGN', decimalDigits: 2);

  if (value1! > value2!) {
    result = value1 - value2;
    formatedResult = 'Available';
  } else if (value2 == value1) {
    formatedResult = 'Exhausted';
  } else if (value2 > value1) {
    result = value2 - value1;
    formatedResult = 'Overspent';
  } else {
    formatedResult = "error";
  }

  return formatedResult;
}

String subtractCurrencyDecimal(
  int? value1,
  int? value2,
) {
  // Add your function code here!
  String formatedResult;
  int result;
  final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'en_US', name: 'NGN', decimalDigits: 2);

  if (value1! > value2!) {
    result = value1 - value2;
    formatedResult = formatCurrency.format(result / 100);
  } else if (value2 == value1) {
    formatedResult = 'Exhausted';
  } else if (value2 > value1) {
    result = value2 - value1;
    formatedResult = formatCurrency.format(result / 100);
  } else {
    formatedResult = "error";
  }

  return formatedResult;
}

String subtractCurrencyOf(
  int? value1,
  int? value2,
) {
  // Add your function code here!
  String formatedResult;
  int result;
  final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'en_US', name: 'NGN', decimalDigits: 2);

  if (value2! == 0) {
    result = value1! - value2;
    formatedResult = formatCurrency.format(result / 100) + ' Available';
  } else if (value1! > value2!) {
    result = value1 - value2;
    formatedResult = formatCurrency.format(result / 100) +
        //' of ' +
        //formatCurrency.format(value1 / 100) +
        ' Available';
  } else if (value2 == value1) {
    formatedResult = 'Exhausted';
  } else if (value2 > value1) {
    result = value2 - value1;
    formatedResult = formatCurrency.format(result / 100) +
        //' of ' +
        //formatCurrency.format(value1 / 100) +
        ' Overspent';
  } else {
    formatedResult = "error";
  }

  return formatedResult;
}

String subtractCurrencyOfCopy(
  int? value1,
  int? value2,
) {
  // Add your function code here!
  String formatedResult;
  int result;
  final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'en_US', name: 'NGN', decimalDigits: 2);

  if (value2! == 0) {
    result = value1! - value2;
    formatedResult = formatCurrency.format(result / 100) + ' Available';
  } else if (value1! > value2!) {
    result = value1 - value2;
    formatedResult = formatCurrency.format(result / 100) +
        ' of ' +
        formatCurrency.format(value1 / 100) +
        ' Available';
  } else if (value2 == value1) {
    formatedResult = 'Exhausted';
  } else if (value2 > value1) {
    result = value2 - value1;
    formatedResult = formatCurrency.format(result / 100) +
        ' of ' +
        formatCurrency.format(value1 / 100) +
        ' Overspent';
  } else {
    formatedResult = "error";
  }

  return formatedResult;
}

int sumTransactionAmounts(List<TransactionsRecord> transactions) {
  // Add your function code here!
  int total = 0;

  for (var i = 0; i < transactions.length; i++) {
    total += transactions[i].transactionAmount as int;
  }

  return total;
}

String overOrUnder(
  int? value1,
  int? value2,
) {
  // Add your function code here!
  String result = 'Left';

  if (value2! > value1!) {
    result = 'Over';
  }

  return result;
}

int sumCategoryAmounts(List<CategoriesRecord> categories) {
  // Add your function code here!
  int total = 0;
  for (var i = 0; i < categories.length; i++) {
    total += categories[i].categoryAmount as int;
  }

  return total;
}

int sumAccountBalances(List<AccountsRecord> accounts) {
  // Add your function code here!
  int total = 0;
  for (int i = 0; i < accounts.length; i++) {
    total += accounts[i].accountBalance as int;
  }

  return total;
}

DateTime addDaysToDate(
  DateTime? startDate,
  int? daysToAdd,
) {
  // Add your function code here!
  var newDate = DateTime(
      startDate!.year, startDate.month, startDate.day + (daysToAdd as int));

  return newDate;
}

int isBudgetExising(DocumentReference? userBudget) {
  // Add your function code here!
  int existing = 0;

  if (userBudget != null) {
    existing = 1;
  }

  return existing;
}

String transactionTypeColor(String transactionType) {
  // Add your function code here!

  String color = "";
  if (transactionType == "credit") {
    color = "0xFFFF0003";
  }
  return color;
}

int setNewExpectedSubDate(SubscriptionsRecord? subscription) {
  // Add your function code here!

  int days = 0;

  switch (subscription!.recurrence) {
    case "Weekly":
      days = 7;
      break;
    case "Monthly":
      days = 30;
      break;
    case "Quaterly":
      days = 90;
      break;
    case "Yearly":
      days = 365;
      break;
  }

  return days;
}

bool chartDisplay(
  int totalAmount,
  double lowerLimit,
  int spentAmount,
  double upperLimit,
) {
  // Add your function code here!
  bool display = false;

  if (spentAmount != 0 &&
      spentAmount >= (totalAmount * lowerLimit) &&
      spentAmount < (totalAmount * upperLimit)) {
    display = true;
  }

  return display;
}

String toTitleCase(String string) {
  // Add your function code here!
  return string
      .trim()
      .splitMapJoin(
        RegExp(r'\s+'),
        onMatch: (m) => ' ',
        onNonMatch: (n) {
          return '${n.substring(0, 1).toUpperCase()}${n.substring(1).toLowerCase()}';
        },
      )
      .trim();
}

String fiftyPercent(double numberValue) {
  return (numberValue / 2).toStringAsFixed(2);
}
