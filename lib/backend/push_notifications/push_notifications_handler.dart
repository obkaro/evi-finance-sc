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

final _handledMessageIds = <String?>{};

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
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
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
      if (mounted) {
        setState(() => _loading = false);
      }
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
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/evi-logo-720h.png',
              width: MediaQuery.of(context).size.width * 0.5,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'Transactions': (data) async => TransactionsWidget(),
  'TransactionSingle': (data) async => TransactionSingleWidget(
        transaction: await getDocumentParameter(
            data, 'transaction', TransactionsRecord.serializer),
      ),
  'ForgotPassword': (data) async => ForgotPasswordWidget(),
  'Dashboard': (data) async => NavBarPage(initialPage: 'Dashboard'),
  'SingleBudget': (data) async => SingleBudgetWidget(
        budgetRef: getParameter(data, 'budgetRef'),
      ),
  'ConnectFirstAccount': (data) async => ConnectFirstAccountWidget(),
  'CreateBudget': (data) async => CreateBudgetWidget(
        budget: await getDocumentParameter(
            data, 'budget', BudgetsRecord.serializer),
      ),
  'EditBudget': (data) async => EditBudgetWidget(
        budgetRef: getParameter(data, 'budgetRef'),
      ),
  'Budgets': (data) async => BudgetsWidget(),
  'Accounts': (data) async => AccountsWidget(),
  'AllocateBudget': (data) async => AllocateBudgetWidget(
        createdBudget: await getDocumentParameter(
            data, 'createdBudget', BudgetsRecord.serializer),
      ),
  'CategorySingle': (data) async => CategorySingleWidget(
        category: await getDocumentParameter(
            data, 'category', CategoriesRecord.serializer),
      ),
  'Settings': (data) async => SettingsWidget(),
  'AccountSingle': (data) async => AccountSingleWidget(
        account: await getDocumentParameter(
            data, 'account', AccountsRecord.serializer),
      ),
  'ProfileSettings': (data) async => ProfileSettingsWidget(),
  'LandingPageView': (data) async => LandingPageViewWidget(),
  'WelcomeToEvi': (data) async => WelcomeToEviWidget(),
  'FirstBudget': (data) async => FirstBudgetWidget(
        budget: await getDocumentParameter(
            data, 'budget', BudgetsRecord.serializer),
      ),
  'assignTransactions': (data) async => AssignTransactionsWidget(
        transactions: [],
      ),
  'RecurringPayments': (data) async => RecurringPaymentsWidget(),
  'CreateRecurring': (data) async => CreateRecurringWidget(
        subscriptionRecord: getParameter(data, 'subscriptionRecord'),
      ),
  'editSubsciption': (data) async => EditSubsciptionWidget(
        subscriptionRecord: getParameter(data, 'subscriptionRecord'),
      ),
  'subscriptionDetails': (data) async => SubscriptionDetailsWidget(
        subscription: await getDocumentParameter(
            data, 'subscription', SubscriptionsRecord.serializer),
      ),
  'EditIncomeSources': (data) async => EditIncomeSourcesWidget(),
  'Menu': (data) async => NavBarPage(initialPage: 'Menu'),
  'EmailAuth': (data) async => EmailAuthWidget(),
  'InitPaywall': (data) async => InitPaywallWidget(),
  'Paywall': (data) async => PaywallWidget(),
  'SignUpProgress': (data) async => SignUpProgressWidget(),
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
