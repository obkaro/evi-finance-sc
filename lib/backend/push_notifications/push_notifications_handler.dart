import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../land_page/land_page_widget.dart';
import '../../sign_up/sign_up_widget.dart';
import '../../login/login_widget.dart';
import '../../user_details/user_details_widget.dart';
import '../../dashboard/dashboard_widget.dart';
import '../../transaction_single/transaction_single_widget.dart';
import '../../add_transaction/add_transaction_widget.dart';
import '../../uncategorized/uncategorized_widget.dart';
import '../../budget_single/budget_single_widget.dart';
import '../../category_single/category_single_widget.dart';
import '../../create_budget_old/create_budget_old_widget.dart';
import '../../create_budget_copy/create_budget_copy_widget.dart';
import '../../edit_budget/edit_budget_widget.dart';
import '../../edit_budget_categories/edit_budget_categories_widget.dart';
import '../../create_budget_categories/create_budget_categories_widget.dart';
import '../../accounts/accounts_widget.dart';
import '../../account_single/account_single_widget.dart';
import '../../link_mono_copy/link_mono_copy_widget.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler(
      {Key key, this.handlePushNotification, this.child})
      : super(key: key);

  final Function(BuildContext) handlePushNotification;
  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.white,
          child: Center(
            child: Builder(
              builder: (context) => Image.asset(
                'assets/images/Group_20_(2).png',
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'LandPage': (data) async => LandPageWidget(),
  'SignUp': (data) async => SignUpWidget(),
  'Login': (data) async => LoginWidget(),
  'UserDetails': (data) async => UserDetailsWidget(),
  'Dashboard': (data) async => DashboardWidget(
        command: getParameter(data, 'command'),
        newAccount: getParameter(data, 'newAccount'),
      ),
  'Transactions': (data) async => NavBarPage(initialPage: 'TransactionsWidget'),
  'TransactionSingle': (data) async => TransactionSingleWidget(
        transaction: await getDocumentParameter(
            data, 'transaction', TransactionsRecord.serializer),
      ),
  'AddTransaction': (data) async => AddTransactionWidget(
        defaultAccount: getParameter(data, 'defaultAccount'),
      ),
  'Uncategorized': (data) async => UncategorizedWidget(
        category: await getDocumentParameter(
            data, 'category', BudgetCategoriesRecord.serializer),
      ),
  'BudgetSingle': (data) async => BudgetSingleWidget(
        budget: await getDocumentParameter(
            data, 'budget', BudgetsRecord.serializer),
        uncategorizedAmount: getParameter(data, 'uncategorizedAmount'),
      ),
  'CategorySingle': (data) async => CategorySingleWidget(
        category: await getDocumentParameter(
            data, 'category', BudgetCategoriesRecord.serializer),
      ),
  'CreateBudgetOld': (data) async => CreateBudgetOldWidget(),
  'CreateBudgetCopy': (data) async => CreateBudgetCopyWidget(),
  'EditBudget': (data) async => EditBudgetWidget(
        createdbudget: await getDocumentParameter(
            data, 'createdbudget', BudgetsRecord.serializer),
        uncategorized: await getDocumentParameter(
            data, 'uncategorized', BudgetCategoriesRecord.serializer),
      ),
  'editBudgetCategories': (data) async => EditBudgetCategoriesWidget(
        createdBudget: await getDocumentParameter(
            data, 'createdBudget', BudgetsRecord.serializer),
        uncategorized: await getDocumentParameter(
            data, 'uncategorized', BudgetCategoriesRecord.serializer),
      ),
  'CreateBudgetCategories': (data) async => CreateBudgetCategoriesWidget(
        createdBudget: await getDocumentParameter(
            data, 'createdBudget', BudgetsRecord.serializer),
        uncategorized: await getDocumentParameter(
            data, 'uncategorized', BudgetCategoriesRecord.serializer),
      ),
  'Accounts': (data) async => AccountsWidget(),
  'AccountSingle': (data) async => AccountSingleWidget(
        account: await getDocumentParameter(
            data, 'account', AccountsRecord.serializer),
      ),
  'Profile': (data) async => NavBarPage(initialPage: 'ProfileWidget'),
  'LinkMonoCopy': (data) async => LinkMonoCopyWidget(),
  'Admin': (data) async => NavBarPage(initialPage: 'AdminWidget'),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
