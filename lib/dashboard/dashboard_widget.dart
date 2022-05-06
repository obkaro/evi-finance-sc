import '../account_single/account_single_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../transaction_single/transaction_single_widget.dart';
import '../transactions/transactions_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({
    Key key,
    this.command,
    this.newAccount,
  }) : super(key: key);

  final String command;
  final DocumentReference newAccount;

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Dashboard'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Hello Somebody,',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Linked Accounts',
                        style: FlutterFlowTheme.of(context).subtitle2,
                      ),
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent('Text-ON_TAP');
                          logFirebaseEvent('Text-Navigate-To');
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NavBarPage(initialPage: 'Accounts'),
                            ),
                          );
                        },
                        child: Text(
                          'See All',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Source Sans Pro',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<List<AccountsRecord>>(
                  stream: queryAccountsRecord(
                    queryBuilder: (accountsRecord) => accountsRecord
                        .where('accountOwner', isEqualTo: currentUserReference),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: SpinKitRing(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      );
                    }
                    List<AccountsRecord> rowAccountsRecordList = snapshot.data;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(rowAccountsRecordList.length,
                            (rowIndex) {
                          final rowAccountsRecord =
                              rowAccountsRecordList[rowIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent('Container-ON_TAP');
                                logFirebaseEvent('Container-Navigate-To');
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AccountSingleWidget(
                                      account: rowAccountsRecord,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 145,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                        child: Stack(
                                          alignment: AlignmentDirectional(0, 0),
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          300),
                                                ),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                              ),
                                            ),
                                            FutureBuilder<
                                                List<
                                                    ConstInstitutionLogosRecord>>(
                                              future:
                                                  queryConstInstitutionLogosRecordOnce(
                                                queryBuilder:
                                                    (constInstitutionLogosRecord) =>
                                                        constInstitutionLogosRecord.where(
                                                            'institutionCode',
                                                            isEqualTo:
                                                                rowAccountsRecord
                                                                    .bankCode),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: SpinKitRing(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ConstInstitutionLogosRecord>
                                                    imageConstInstitutionLogosRecordList =
                                                    snapshot.data;
                                                // Return an empty Container when the document does not exist.
                                                if (snapshot.data.isEmpty) {
                                                  return Container();
                                                }
                                                final imageConstInstitutionLogosRecord =
                                                    imageConstInstitutionLogosRecordList
                                                            .isNotEmpty
                                                        ? imageConstInstitutionLogosRecordList
                                                            .first
                                                        : null;
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Image.network(
                                                    imageConstInstitutionLogosRecord
                                                        .institutionLogo,
                                                    width: 45,
                                                    height: 45,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Text(
                                          functions.formatTransCurrency(
                                              rowAccountsRecord.accountBalance),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recently Viewed Budget',
                        style: FlutterFlowTheme.of(context).subtitle2,
                      ),
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent('Text-ON_TAP');
                          logFirebaseEvent('Text-Navigate-To');
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NavBarPage(initialPage: 'Budgets'),
                            ),
                          );
                        },
                        child: Text(
                          'See All',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Source Sans Pro',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 0),
                  child: StreamBuilder<List<BudgetsRecord>>(
                    stream: queryBudgetsRecord(
                      queryBuilder: (budgetsRecord) => budgetsRecord.where(
                          'budgetOwner',
                          isEqualTo: currentUserReference),
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitRing(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<BudgetsRecord> containerBudgetsRecordList =
                          snapshot.data;
                      // Return an empty Container when the document does not exist.
                      if (snapshot.data.isEmpty) {
                        return Container();
                      }
                      final containerBudgetsRecord =
                          containerBudgetsRecordList.isNotEmpty
                              ? containerBudgetsRecordList.first
                              : null;
                      return Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: StreamBuilder<List<BudgetCategoriesRecord>>(
                          stream: queryBudgetCategoriesRecord(
                            queryBuilder: (budgetCategoriesRecord) =>
                                budgetCategoriesRecord
                                    .where('categoryBudget',
                                        isEqualTo:
                                            containerBudgetsRecord.reference)
                                    .where('categoryName',
                                        isNotEqualTo: 'Uncategorized'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitRing(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            List<BudgetCategoriesRecord>
                                containerBudgetCategoriesRecordList =
                                snapshot.data;
                            return Container(
                              width: double.infinity,
                              height: 96,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: StreamBuilder<
                                          List<TransactionsRecord>>(
                                        stream: queryTransactionsRecord(
                                          queryBuilder: (transactionsRecord) =>
                                              transactionsRecord.where(
                                                  'linkedCategory',
                                                  whereIn:
                                                      containerBudgetCategoriesRecordList
                                                          .map((e) =>
                                                              e.reference)
                                                          .toList()),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: SpinKitRing(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          List<TransactionsRecord>
                                              containerTransactionsRecordList =
                                              snapshot.data;
                                          return Container(
                                            width: 100,
                                            height: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                CircularPercentIndicator(
                                                  percent: functions.calcBudgetChart(
                                                      containerBudgetsRecord,
                                                      containerTransactionsRecordList
                                                          .toList()),
                                                  radius: 32,
                                                  lineWidth: 8,
                                                  animation: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .customColor1,
                                                  startAngle: 0,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${dateTimeFormat('MMMEd', containerBudgetsRecord.budgetStart)} - ${dateTimeFormat('MMMEd', containerBudgetsRecord.budgetEnd)}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1,
                                                        ),
                                                        Text(
                                                          '${functions.formatBudgetCurrency(functions.subInt(containerBudgetsRecord.budgetAmount, functions.sumTransactionAmounts(containerTransactionsRecordList.toList())))} Remaining',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle2,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Transactions',
                        style: FlutterFlowTheme.of(context).subtitle2,
                      ),
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent('Text-ON_TAP');
                          logFirebaseEvent('Text-Navigate-To');
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransactionsWidget(),
                            ),
                          );
                        },
                        child: Text(
                          'See All',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Source Sans Pro',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 20),
                      child: StreamBuilder<List<TransactionsRecord>>(
                        stream: queryTransactionsRecord(
                          queryBuilder: (transactionsRecord) =>
                              transactionsRecord
                                  .where('transactionOwner',
                                      isEqualTo: currentUserReference)
                                  .orderBy('trasactionDate', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitRing(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<TransactionsRecord>
                              columnTransactionsRecordList = snapshot.data;
                          return SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                  columnTransactionsRecordList.length,
                                  (columnIndex) {
                                final columnTransactionsRecord =
                                    columnTransactionsRecordList[columnIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FutureBuilder<AccountsRecord>(
                                      future: AccountsRecord.getDocumentOnce(
                                          columnTransactionsRecord.account),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: SpinKitRing(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        final rowAccountsRecord = snapshot.data;
                                        return InkWell(
                                          onTap: () async {
                                            logFirebaseEvent('Row-ON_TAP');
                                            // Action_TransactionSingle
                                            logFirebaseEvent(
                                                'Row-Action_TransactionSingle');
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TransactionSingleWidget(
                                                  transaction:
                                                      columnTransactionsRecord,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 60,
                                                height: 60,
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      300),
                                                        ),
                                                      ),
                                                    ),
                                                    StreamBuilder<
                                                        List<
                                                            ConstInstitutionLogosRecord>>(
                                                      stream:
                                                          queryConstInstitutionLogosRecord(
                                                        queryBuilder: (constInstitutionLogosRecord) =>
                                                            constInstitutionLogosRecord.where(
                                                                'institutionCode',
                                                                isEqualTo:
                                                                    rowAccountsRecord
                                                                        .bankCode),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  SpinKitRing(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<ConstInstitutionLogosRecord>
                                                            imageConstInstitutionLogosRecordList =
                                                            snapshot.data;
                                                        // Return an empty Container when the document does not exist.
                                                        if (snapshot
                                                            .data.isEmpty) {
                                                          return Container();
                                                        }
                                                        final imageConstInstitutionLogosRecord =
                                                            imageConstInstitutionLogosRecordList
                                                                    .isNotEmpty
                                                                ? imageConstInstitutionLogosRecordList
                                                                    .first
                                                                : null;
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          child: Image.network(
                                                            imageConstInstitutionLogosRecord
                                                                .institutionLogo,
                                                            width: 40,
                                                            height: 40,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 0, 0, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'Row-ON_TAP');
                                                      logFirebaseEvent(
                                                          'Row-Navigate-To');
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              TransactionSingleWidget(
                                                            transaction:
                                                                columnTransactionsRecord,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if (columnTransactionsRecord
                                                                        .isCategorized ??
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            8),
                                                                    child: StreamBuilder<
                                                                        BudgetCategoriesRecord>(
                                                                      stream: BudgetCategoriesRecord.getDocument(
                                                                          columnTransactionsRecord
                                                                              .linkedCategory),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50,
                                                                              height: 50,
                                                                              child: SpinKitRing(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 50,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final textBudgetCategoriesRecord =
                                                                            snapshot.data;
                                                                        return AutoSizeText(
                                                                          textBudgetCategoriesRecord
                                                                              .categoryName
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                25,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).subtitle1,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                if (!(columnTransactionsRecord
                                                                        .isCategorized) ??
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            8),
                                                                    child:
                                                                        AutoSizeText(
                                                                      'Uncategorized',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Source Sans Pro',
                                                                            color:
                                                                                Color(0xFFFF0003),
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                Text(
                                                                  '${dateTimeFormat('Hm', columnTransactionsRecord.trasactionDate)} | ${dateTimeFormat('MMMEd', columnTransactionsRecord.trasactionDate)}',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            8),
                                                                child:
                                                                    AutoSizeText(
                                                                  functions
                                                                      .formatTransCurrency(
                                                                          columnTransactionsRecord
                                                                              .transactionAmount)
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            15,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Source Sans Pro',
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                ),
                                                              ),
                                                              Stack(
                                                                children: [
                                                                  if ((columnTransactionsRecord
                                                                          .transactionType) ==
                                                                      'debit')
                                                                    AutoSizeText(
                                                                      columnTransactionsRecord
                                                                          .transactionType
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            15,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Source Sans Pro',
                                                                            color:
                                                                                Color(0xFFFF0003),
                                                                          ),
                                                                    ),
                                                                  if ((columnTransactionsRecord
                                                                          .transactionType) ==
                                                                      'credit')
                                                                    AutoSizeText(
                                                                      columnTransactionsRecord
                                                                          .transactionType
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            15,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Source Sans Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                          ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    Divider(),
                                  ],
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
