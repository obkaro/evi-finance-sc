// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// Begin custom action code
import 'package:evi/auth/auth_util.dart';
import 'package:collection/collection.dart';

Future<List<DocumentReference>> writeTransactions(
  dynamic transactionJsonResponse,
  AccountsRecord buttonAccountsRecord,
  List<TransactionsRecord> accountTransactions,
) async {
  // Add your function code here!

  print(transactionJsonResponse);

  TransactionList transaction =
      new TransactionList.fromJson(transactionJsonResponse);

  print(transaction.data[1].narration);

  // final List<String> existingIDS =
  //     accountTransactions.map((e) => e.transactionMonoID).toList();

  final List<int> existingAmounts =
      accountTransactions.map((e) => e.transactionAmount).toList();

  final List<String> existingNarrations =
      accountTransactions.map((e) => e.transactionNarration).toList();

  final List<int> existingBalances =
      accountTransactions.map((e) => e.balanceAfter).toList();

  final List<DateTime> existingDates =
      accountTransactions.map((e) => e.trasactionDate).toList();

  // final List<String> existingTypes =
  //     accountTransactions.map((e) => e.transactionType).toList();

  List<String> myUniqueKeys = [];

  for (final quads in IterableZip(
      [existingAmounts, existingNarrations, existingBalances, existingDates])) {
    myUniqueKeys.add(quads[0].toString() +
        quads[1] +
        quads[2].toString() +
        quads[3].toString());
  }

  // for (var a = 0; a < existingAmounts.length; a++) {
  //   String amount = existingAmounts[a].toString();
  //   for (var n = 0; n < existingNarrations.length; n++) {
  //     String narration = existingNarrations[n];
  //     for (var b = 0; b < existingBalances.length; b++) {
  //       String balance = existingBalances[b].toString();
  //       for (var d = 0; d < existingDates.length; d++) {
  //         String date = existingDates[d].toString();
  //         myUniqueKeys.add(amount + narration + balance + date);
  //       }
  //     }
  //   }
  // }

  print(myUniqueKeys);

  int writtenTransactions = 1;

  for (var i = 0; i < transaction.data.length; i++) {
    // if (!existingAmounts.contains(transaction.data[i].amount) &&
    //     !existingDates.contains(DateTime.parse(transaction.data[i].date)) &&
    //     !existingBalances.contains(transaction.data[i].balance) &&
    //     !existingNarrations.contains(transaction.data[i].narration) &&
    //     !existingTypes.contains(transaction.data[i].type)) {
    String transactionKey = transaction.data[i].amount.toString() +
        transaction.data[i].narration +
        transaction.data[i].balance.toString() +
        (DateTime.parse(transaction.data[i].date)).toLocal().toString();

    print(transactionKey);

    if (!myUniqueKeys.contains(transactionKey)) {
      final transactionsCreateData = createTransactionsRecordData(
        account: buttonAccountsRecord.reference,
        trasactionDate: DateTime.parse(transaction.data[i].date),
        //monoCategory: transaction.data[i].,
        transactionOwner: currentUserReference,
        balanceAfter: transaction.data[i].balance,
        transactionAmount: transaction.data[i].amount,
        transactionMonoID: transaction.data[i].id,
        transactionType: transaction.data[i].type,
        transactionNarration: transaction.data[i].narration,
        monoCategory: transaction.data[i].monoCategory,
        isCategorized: false,
      );
      await TransactionsRecord.collection.doc().set(transactionsCreateData);

      writtenTransactions++;

      print(writtenTransactions);
    }
  }
}

class TransactionList {
  final List<Transaction> data;

  TransactionList({this.data});

  factory TransactionList.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    print(list.runtimeType);

    List<Transaction> transactionlist =
        list.map((i) => Transaction.fromJson(i)).toList();

    return TransactionList(data: transactionlist);
  }
}

class Transaction {
  final String id;
  final String type;
  final int amount;
  final String narration;
  final String date;
  final int balance;
  final String monoCategory;

  Transaction(
      {this.id,
      this.type,
      this.amount,
      this.balance,
      this.date,
      this.narration,
      this.monoCategory});

  factory Transaction.fromJson(Map<String, dynamic> parsedJson) {
    return Transaction(
        id: parsedJson['_id'],
        type: parsedJson['type'],
        amount: parsedJson['amount'],
        narration: parsedJson['narration'],
        date: parsedJson['date'],
        balance: parsedJson['balance'],
        monoCategory: parsedJson['category']);
  }
}
