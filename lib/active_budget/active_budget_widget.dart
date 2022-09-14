import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../category_single/category_single_widget.dart';
import '../components/create_custom_category_widget.dart';
import '../components/edit_category_widget.dart';
import '../components/m_appbar_widget.dart';
import '../create_budget/create_budget_widget.dart';
import '../edit_budget/edit_budget_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ActiveBudgetWidget extends StatefulWidget {
  const ActiveBudgetWidget({
    Key? key,
    this.command,
  }) : super(key: key);

  final String? command;

  @override
  _ActiveBudgetWidgetState createState() => _ActiveBudgetWidgetState();
}

class _ActiveBudgetWidgetState extends State<ActiveBudgetWidget> {
  BudgetsRecord? createdBudget2;
  BudgetsRecord? createdBudget;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ActiveBudget'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(132),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          flexibleSpace: MAppbarWidget(
            titleText: 'Active Budget',
            icon: Icon(
              Icons.pie_chart_rounded,
              color: FlutterFlowTheme.of(context).secondaryPrimary,
              size: 32,
            ),
            bgColor: FlutterFlowTheme.of(context).secondaryColor,
            fgColor: FlutterFlowTheme.of(context).primaryBackground,
            textColor: FlutterFlowTheme.of(context).secondaryPrimary,
            actionIcon: Icon(
              Icons.edit_rounded,
              color: FlutterFlowTheme.of(context).secondaryPrimary,
              size: 24,
            ),
            iconAction: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditBudgetWidget(),
                ),
              );
            },
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (currentUserDocument!.activeBudget != null)
                  AuthUserStreamWidget(
                    child: StreamBuilder<BudgetsRecord>(
                      stream: BudgetsRecord.getDocument(
                          currentUserDocument!.activeBudget!),
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
                        final columnBudgetsRecord = snapshot.data!;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (currentUserDocument!.activeBudget != null)
                              StreamBuilder<List<CategoriesRecord>>(
                                stream: queryCategoriesRecord(
                                  parent: columnBudgetsRecord.reference,
                                  queryBuilder: (categoriesRecord) =>
                                      categoriesRecord.where('category_name',
                                          isNotEqualTo: 'Unallocated'),
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
                                  List<CategoriesRecord>
                                      containerCategoriesRecordList =
                                      snapshot.data!;
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 0,
                                          height: 0,
                                          child:
                                              custom_widgets.BackButtonControl(
                                            width: 0,
                                            height: 0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 16, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Stack(
                                                alignment:
                                                    AlignmentDirectional(1, -1),
                                                children: [
                                                  if (containerCategoriesRecordList
                                                          .length >
                                                      0)
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: StreamBuilder<
                                                              List<
                                                                  TransactionsRecord>>(
                                                            stream:
                                                                queryTransactionsRecord(
                                                              queryBuilder: (transactionsRecord) =>
                                                                  transactionsRecord.where(
                                                                      'transactionBudget',
                                                                      isEqualTo:
                                                                          columnBudgetsRecord
                                                                              .reference),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
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
                                                              List<TransactionsRecord>
                                                                  containerTransactionsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Stack(
                                                                      children: [
                                                                        if (containerTransactionsRecordList.length <=
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                20,
                                                                                0,
                                                                                20),
                                                                            child:
                                                                                CircularPercentIndicator(
                                                                              percent: 1,
                                                                              radius: 90,
                                                                              lineWidth: 20,
                                                                              animation: false,
                                                                              progressColor: FlutterFlowTheme.of(context).primaryColor,
                                                                              backgroundColor: FlutterFlowTheme.of(context).eviredTransparent,
                                                                              center: Text(
                                                                                '${functions.formatBudgetCurrency(columnBudgetsRecord.budgetAmount)} ',
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).subtitle1Family,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle1Family),
                                                                                    ),
                                                                              ),
                                                                              startAngle: 0,
                                                                            ),
                                                                          ),
                                                                        if (containerTransactionsRecordList.length >
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                20,
                                                                                0,
                                                                                20),
                                                                            child:
                                                                                CircularPercentIndicator(
                                                                              percent: functions.calcBudgetChart(columnBudgetsRecord, columnBudgetsRecord.budgetSpent)!,
                                                                              radius: 90,
                                                                              lineWidth: 20,
                                                                              animation: true,
                                                                              progressColor: FlutterFlowTheme.of(context).darkPrimary,
                                                                              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                                                                              center: Text(
                                                                                '${functions.subtractCurrency(columnBudgetsRecord.budgetAmount, functions.sumTransactionAmounts(containerTransactionsRecordList.toList()))}',
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).subtitle1Family,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle1Family),
                                                                                    ),
                                                                              ),
                                                                              startAngle: 0,
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              16),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            '${dateTimeFormat('MMMEd', columnBudgetsRecord.budgetStart)} - ${dateTimeFormat('MMMEd', columnBudgetsRecord.budgetEnd)}',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText1,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              16),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          if (containerTransactionsRecordList.length >
                                                                              0)
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'Spent',
                                                                                  style: FlutterFlowTheme.of(context).bodyText2,
                                                                                ),
                                                                                Text(
                                                                                  functions.formatTransCurrency(columnBudgetsRecord.budgetSpent),
                                                                                  style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).subtitle1Family,
                                                                                        fontSize: 20,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle1Family),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          if (containerTransactionsRecordList.length >
                                                                              0)
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'Limit',
                                                                                  style: FlutterFlowTheme.of(context).bodyText2,
                                                                                ),
                                                                                Text(
                                                                                  functions.formatTransCurrency(columnBudgetsRecord.budgetAmount),
                                                                                  style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).subtitle1Family,
                                                                                        fontSize: 20,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle1Family),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                        ],
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
                                                ],
                                              ),
                                              Divider(
                                                thickness: 1,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .fadedDivider,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final displayedCategories =
                                                        containerCategoriesRecordList
                                                            .toList();
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          displayedCategories
                                                              .length,
                                                          (displayedCategoriesIndex) {
                                                        final displayedCategoriesItem =
                                                            displayedCategories[
                                                                displayedCategoriesIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 16),
                                                          child: StreamBuilder<
                                                              List<
                                                                  TransactionsRecord>>(
                                                            stream:
                                                                queryTransactionsRecord(
                                                              queryBuilder: (transactionsRecord) =>
                                                                  transactionsRecord.where(
                                                                      'transactionCategory',
                                                                      isEqualTo:
                                                                          displayedCategoriesItem
                                                                              .reference),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
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
                                                              List<TransactionsRecord>
                                                                  containerTransactionsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return InkWell(
                                                                onTap:
                                                                    () async {
                                                                  // Action_ViewSingleCategory
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              CategorySingleWidget(
                                                                        category:
                                                                            displayedCategoriesItem,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                onLongPress:
                                                                    () async {
                                                                  HapticFeedback
                                                                      .lightImpact();
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return Padding(
                                                                        padding:
                                                                            MediaQuery.of(context).viewInsets,
                                                                        child:
                                                                            EditCategoryWidget(
                                                                          budget:
                                                                              columnBudgetsRecord,
                                                                          categoryToEdit:
                                                                              displayedCategoriesItem,
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  height: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            32),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16,
                                                                            8,
                                                                            16,
                                                                            8),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2,
                                                                              0,
                                                                              2,
                                                                              8),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                displayedCategoriesItem.categoryName!,
                                                                                style: FlutterFlowTheme.of(context).subtitle1,
                                                                              ),
                                                                              Text(
                                                                                functions.formatBudgetCurrency(displayedCategoriesItem.categoryAmount),
                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              8),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  StreamBuilder<CategoriesRecord>(
                                                                                    stream: CategoriesRecord.getDocument(displayedCategoriesItem.reference),
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
                                                                                      final progressBarCategoriesRecord = snapshot.data!;
                                                                                      return LinearPercentIndicator(
                                                                                        percent: functions.calcCategoryPercent(displayedCategoriesItem, containerTransactionsRecordList.toList()),
                                                                                        width: MediaQuery.of(context).size.width * 0.81,
                                                                                        lineHeight: 8,
                                                                                        animation: true,
                                                                                        progressColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                        backgroundColor: FlutterFlowTheme.of(context).eviredTransparent,
                                                                                        barRadius: Radius.circular(12),
                                                                                        padding: EdgeInsets.zero,
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2,
                                                                              0,
                                                                              2,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                functions.subtractCurrencyOf(displayedCategoriesItem.categoryAmount, functions.sumTransactionAmounts(containerTransactionsRecordList.toList())),
                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 10),
                                          child: InkWell(
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child:
                                                        CreateCustomCategoryWidget(
                                                      budget:
                                                          columnBudgetsRecord,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Unallocated: ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                          ),
                                                          Text(
                                                            functions.formatBudgetCurrency(
                                                                columnBudgetsRecord
                                                                    .unallocatedAmount),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
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
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            if (columnBudgetsRecord.reference != null)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 20),
                                child: InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: CreateCustomCategoryWidget(
                                            budget: columnBudgetsRecord,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 120,
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
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Tap to add a new category',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1Family,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                                  lineHeight: 1.4,
                                                ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            icon: Icon(
                                              Icons.add_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 48,
                                            ),
                                            onPressed: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child:
                                                        CreateCustomCategoryWidget(
                                                      budget:
                                                          columnBudgetsRecord,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                if (currentUserDocument!.activeBudget == null)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: AuthUserStreamWidget(
                      child: InkWell(
                        onTap: () async {
                          final budgetsCreateData = createBudgetsRecordData(
                            budgetDateCreated: getCurrentTimestamp,
                            budgetID: random_data.randomString(
                              24,
                              24,
                              true,
                              true,
                              true,
                            ),
                            status: 'unattached',
                          );
                          var budgetsRecordReference =
                              BudgetsRecord.collection.doc();
                          await budgetsRecordReference.set(budgetsCreateData);
                          createdBudget = BudgetsRecord.getDocumentFromData(
                              budgetsCreateData, budgetsRecordReference);
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateBudgetWidget(
                                budget: createdBudget,
                              ),
                            ),
                          );

                          setState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Tap to create a budget',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                        lineHeight: 1.4,
                                      ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.add_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 48,
                                  ),
                                  onPressed: () async {
                                    final budgetsCreateData =
                                        createBudgetsRecordData(
                                      budgetDateCreated: getCurrentTimestamp,
                                      budgetID: random_data.randomString(
                                        24,
                                        24,
                                        true,
                                        true,
                                        true,
                                      ),
                                      status: 'unattached',
                                    );
                                    var budgetsRecordReference =
                                        BudgetsRecord.collection.doc();
                                    await budgetsRecordReference
                                        .set(budgetsCreateData);
                                    createdBudget2 =
                                        BudgetsRecord.getDocumentFromData(
                                            budgetsCreateData,
                                            budgetsRecordReference);
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CreateBudgetWidget(
                                          budget: createdBudget2,
                                        ),
                                      ),
                                    );

                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
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
