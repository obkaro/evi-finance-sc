import '../account_single/account_single_widget.dart';
import '../accounts/accounts_widget.dart';
import '../assign_transactions/assign_transactions_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../budgets/budgets_widget.dart';
import '../components/circular_indicator_small_widget.dart';
import '../components/empty_list_widget.dart';
import '../components/loading_budget_summary_widget.dart';
import '../components/loading_dash_accounts_widget.dart';
import '../components/loading_empty_widget.dart';
import '../components/loading_nothingtext_title1_widget.dart';
import '../components/loading_test_widget.dart';
import '../components/loading_transaction_widget.dart';
import '../components/transaction_list_item_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../transactions/transactions_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Dashboard'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
                Container(
                  width: 0,
                  height: 0,
                  child: custom_widgets.BackButtonControl(
                    width: 0,
                    height: 0,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset(
                                  'assets/images/Group_22.png',
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.cover,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Welcome back, ',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondarySecondary,
                                              fontStyle: FontStyle.italic,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2Family),
                                            ),
                                      ),
                                      AuthUserStreamWidget(
                                        child: Text(
                                          valueOrDefault(
                                              currentUserDocument?.username,
                                              ''),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1Family,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryPrimary,
                                                fontStyle: FontStyle.italic,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .subtitle1Family),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                StreamBuilder<List<TransactionsRecord>>(
                                  stream: queryTransactionsRecord(
                                    queryBuilder: (transactionsRecord) =>
                                        transactionsRecord
                                            .where('transactionOwner',
                                                isEqualTo: currentUserReference)
                                            .where('isAssigned',
                                                isEqualTo: false),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: LoadingTestWidget(),
                                      );
                                    }
                                    List<TransactionsRecord>
                                        badgeTransactionsRecordList =
                                        snapshot.data!;
                                    return InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AssignTransactionsWidget(),
                                          ),
                                        );
                                      },
                                      child: Badge(
                                        badgeContent: Text(
                                          badgeTransactionsRecordList.length
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family,
                                                color: Colors.white,
                                                fontSize: 8,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1Family),
                                              ),
                                        ),
                                        showBadge:
                                            badgeTransactionsRecordList.length >
                                                0,
                                        shape: BadgeShape.circle,
                                        badgeColor: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        elevation: 4,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6, 6, 6, 6),
                                        position: BadgePosition.topEnd(),
                                        animationType: BadgeAnimationType.scale,
                                        toAnimate: true,
                                        child: Icon(
                                          Icons.notifications,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryPrimary,
                                          size: 24,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 8),
                                      child: Text(
                                        'Your Total Balance',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondarySecondary,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                            ),
                                      ),
                                    ),
                                    StreamBuilder<List<AccountsRecord>>(
                                      stream: queryAccountsRecord(
                                        queryBuilder: (accountsRecord) =>
                                            accountsRecord.where('accountOwner',
                                                isEqualTo:
                                                    currentUserReference),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: Center(
                                              child:
                                                  LoadingNothingtextTitle1Widget(),
                                            ),
                                          );
                                        }
                                        List<AccountsRecord>
                                            textAccountsRecordList =
                                            snapshot.data!;
                                        return Text(
                                          functions.formatTransCurrency(
                                              functions.sumAccountBalances(
                                                  textAccountsRecordList
                                                      .toList())),
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .title1Family,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryPrimary,
                                                useGoogleFonts:
                                                    GoogleFonts.asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title1Family),
                                              ),
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation']!);
                                      },
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
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: Text(
                                'Connected Accounts',
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AccountsWidget(),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 16),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                child: StreamBuilder<List<AccountsRecord>>(
                                  stream: queryAccountsRecord(
                                    queryBuilder: (accountsRecord) =>
                                        accountsRecord.where('accountOwner',
                                            isEqualTo: currentUserReference),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: LoadingDashAccountsWidget(),
                                      );
                                    }
                                    List<AccountsRecord> rowAccountsRecordList =
                                        snapshot.data!;
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          rowAccountsRecordList.length,
                                          (rowIndex) {
                                        final rowAccountsRecord =
                                            rowAccountsRecordList[rowIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 12, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AccountSingleWidget(
                                                    account: rowAccountsRecord,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: 148,
                                              height: 148,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(24, 20, 24, 20),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      width: 64,
                                                      height: 64,
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
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            300),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                            ),
                                                          ),
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  rowAccountsRecord
                                                                      .accountLogo!,
                                                              width: 40,
                                                              height: 40,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          if (rowAccountsRecord
                                                                  .reauthRequired ==
                                                              true)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1, -1),
                                                              child: Icon(
                                                                Icons
                                                                    .warning_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                size: 16,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: Text(
                                                        functions.formatTransCurrency(
                                                            rowAccountsRecord
                                                                .accountBalance),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                    ).animateOnPageLoad(animationsMap[
                                        'rowOnPageLoadAnimation']!);
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await actions.flutterMono(
                                      context,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 64,
                                          height: 64,
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  borderWidth: 1,
                                                  buttonSize: 60,
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 30,
                                                  ),
                                                  onPressed: () async {
                                                    await actions.flutterMono(
                                                      context,
                                                    );
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Refreshing transactions. This might take a minute...',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: Color(
                                                                    0xFFC1C1C1),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            Colors.black,
                                                      ),
                                                    );
                                                  },
                                                ),
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
                        ),
                      ),
                      if (currentUserDocument!.activeBudget != null)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 8),
                          child: AuthUserStreamWidget(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: Text(
                                    'Active Budget',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BudgetsWidget(),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (currentUserDocument!.activeBudget != null)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          child: AuthUserStreamWidget(
                            child: StreamBuilder<BudgetsRecord>(
                              stream: BudgetsRecord.getDocument(
                                  currentUserDocument!.activeBudget!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: LoadingBudgetSummaryWidget(),
                                  );
                                }
                                final containerBudgetsRecord = snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'ActiveBudget'),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 20, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: 100,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    CircularIndicatorSmallWidget(
                                                      totalAmount:
                                                          containerBudgetsRecord
                                                              .budgetAmount,
                                                      spentAmount:
                                                          containerBudgetsRecord
                                                              .budgetSpent,
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20, 0,
                                                                    0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          8),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    functions.subtractCurrencyDecimal(
                                                                        containerBudgetsRecord
                                                                            .budgetAmount,
                                                                        containerBudgetsRecord
                                                                            .budgetSpent),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle1,
                                                                  ),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        '${functions.subtractCurrencyText(containerBudgetsRecord.budgetAmount, containerBudgetsRecord.budgetSpent)}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle2,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Text(
                                                              '${dateTimeFormat(
                                                                'MMMEd',
                                                                containerBudgetsRecord
                                                                    .budgetStart,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )} - ${dateTimeFormat(
                                                                'MMMEd',
                                                                containerBudgetsRecord
                                                                    .budgetEnd,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyText1Family),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(32, 16, 32, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: Text(
                                'Recent Transactions',
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TransactionsWidget(),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: StreamBuilder<List<TransactionsRecord>>(
                            stream: queryTransactionsRecord(
                              queryBuilder: (transactionsRecord) =>
                                  transactionsRecord.where('transactionOwner',
                                      isEqualTo: currentUserReference),
                              limit: 7,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: LoadingTransactionWidget(),
                                );
                              }
                              List<TransactionsRecord>
                                  listViewTransactionsRecordList =
                                  snapshot.data!;
                              if (listViewTransactionsRecordList.isEmpty) {
                                return Center(
                                  child: Container(
                                    width: double.infinity,
                                    height: 300,
                                    child: EmptyListWidget(
                                      text:
                                          'Connect an account to import transactions',
                                      icon: Icon(
                                        Icons.compare_arrows_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 64,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewTransactionsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewTransactionsRecord =
                                      listViewTransactionsRecordList[
                                          listViewIndex];
                                  return TransactionListItemWidget(
                                    transactionDoc: listViewTransactionsRecord,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<List<VersionsRecord>>(
                  stream: queryVersionsRecord(
                    queryBuilder: (versionsRecord) =>
                        versionsRecord.orderBy('releaseDate', descending: true),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: Center(
                          child: LoadingEmptyWidget(),
                        ),
                      );
                    }
                    List<VersionsRecord> forceUpdateWidgetVersionsRecordList =
                        snapshot.data!;
                    final forceUpdateWidgetVersionsRecord =
                        forceUpdateWidgetVersionsRecordList.isNotEmpty
                            ? forceUpdateWidgetVersionsRecordList.first
                            : null;
                    return Container(
                      width: 0,
                      height: 0,
                      child: custom_widgets.ForceUpdateWidget(
                        width: 0,
                        height: 0,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
