import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

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
  'LoginCopy': (data) async => LoginCopyWidget(),
  'OnboardingInfo': (data) async => OnboardingInfoWidget(),
  'Transactions': (data) async => TransactionsWidget(),
  'TransactionSingle': (data) async => TransactionSingleWidget(
        transaction: await getDocumentParameter(
            data, 'transaction', TransactionsRecord.serializer),
      ),
  'ActiveBudget': (data) async => NavBarPage(initialPage: 'ActiveBudget'),
  'Budgets': (data) async => BudgetsWidget(),
  'BudgetSingle': (data) async => BudgetSingleWidget(
        budget: await getDocumentParameter(
            data, 'budget', BudgetsRecord.serializer),
      ),
  'CategorySingle': (data) async => CategorySingleWidget(
        category: await getDocumentParameter(
            data, 'category', BudgetCategoriesRecord.serializer),
      ),
  'createBudgetCategories': (data) async => CreateBudgetCategoriesWidget(
        createdBudget: await getDocumentParameter(
            data, 'createdBudget', BudgetsRecord.serializer),
      ),
  'editBudgetCategories': (data) async => EditBudgetCategoriesWidget(
        createdBudget: await getDocumentParameter(
            data, 'createdBudget', BudgetsRecord.serializer),
        uncategorized: await getDocumentParameter(
            data, 'uncategorized', BudgetCategoriesRecord.serializer),
      ),
  'Accounts': (data) async => NavBarPage(initialPage: 'Accounts'),
  'AccountSingle': (data) async => AccountSingleWidget(
        account: await getDocumentParameter(
            data, 'account', AccountsRecord.serializer),
      ),
  'Settings': (data) async => NavBarPage(initialPage: 'Settings'),
  'Admin': (data) async => AdminWidget(),
  'ProfileSettings': (data) async => ProfileSettingsWidget(),
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
