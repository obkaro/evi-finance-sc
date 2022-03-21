// Automatic FlutterFlow imports
import 'package:flutter/foundation.dart';

import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

// Begin custom action code
//import 'package:evi_finance/create_budget/create_budget_widget.dart';

//import 'dart:convert';
import 'package:evi_finance/auth/auth_util.dart';

Future<List<DocumentReference>> writeTransactions(
    dynamic transactionJsonResponse,
    AccountsRecord buttonAccountsRecord) async {
  // Add your function code here!

  print(transactionJsonResponse);

  TransactionList transaction =
      new TransactionList.fromJson(transactionJsonResponse);

  print(transaction.data[1].narration);

  for (var i = 0; i < transaction.data.length; i++) {
    var currentTransaction = transaction.data[i];

    final transactionsCreateData = createTransactionsRecordData(
      account: buttonAccountsRecord.reference,
      trasactionDate: getCurrentTimestamp,
      //monoCategory: transaction.data[i].,
      transactionOwner: currentUserReference,
      balanceAfter: transaction.data[i].balance,
      transactionAmount: transaction.data[i].amount,
    );
    await TransactionsRecord.collection.doc().set(transactionsCreateData);
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

  Transaction(
      {this.id,
      this.type,
      this.amount,
      this.balance,
      this.date,
      this.narration});

  factory Transaction.fromJson(Map<String, dynamic> parsedJson) {
    return Transaction(
      id: parsedJson['_id'],
      type: parsedJson['type'],
      amount: parsedJson['amount'],
      narration: parsedJson['narration'],
      date: parsedJson['date'],
      balance: parsedJson['balance'],
    );
  }
}
