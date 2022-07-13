import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../category_single/category_single_widget.dart';
import '../components/budget_options_widget.dart';
import '../components/create_custom_category_widget.dart';
import '../components/create_new_budget_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ActiveBudgetWidget extends StatefulWidget {
  const ActiveBudgetWidget({Key? key}) : super(key: key);

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: AppBar(
          backgroundColor: Color(0x00FF0054),
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.pie_chart_rounded,
                                color: Colors.white,
                                size: 32,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 20, 24, 20),
                                child: Text(
                                  'Budget',
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Spline Sans',
                                        color: Color(0xFFF9F9F9),
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: Visibility(
        visible: (currentUserDocument!.activeBudget != null),
        child: AuthUserStreamWidget(
          child: StreamBuilder<List<BudgetCategoriesRecord>>(
            stream: queryBudgetCategoriesRecord(
              queryBuilder: (budgetCategoriesRecord) =>
                  budgetCategoriesRecord.where('categoryBudget',
                      isEqualTo: currentUserDocument!.activeBudget),
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
              List<BudgetCategoriesRecord>
                  floatingActionButtonBudgetCategoriesRecordList =
                  snapshot.data!;
              return FloatingActionButton(
                onPressed: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: BudgetOptionsWidget(
                          budget: currentUserDocument!.activeBudget,
                          categoriesSum: functions.sumCategoryAmounts(
                              floatingActionButtonBudgetCategoriesRecordList
                                  .toList()),
                        ),
                      );
                    },
                  );
                },
                backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                elevation: 8,
                child: Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              );
            },
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if ((currentUserDocument!.activeBudget != null))
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
                            if ((currentUserDocument!.activeBudget != null))
                              StreamBuilder<List<BudgetCategoriesRecord>>(
                                stream: queryBudgetCategoriesRecord(
                                  queryBuilder: (budgetCategoriesRecord) =>
                                      budgetCategoriesRecord
                                          .where('categoryBudget',
                                              isEqualTo: columnBudgetsRecord!
                                                  .reference)
                                          .where('categoryName',
                                              isNotEqualTo: 'dummy'),
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
                                      snapshot.data!;
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 16, 20, 16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Stack(
                                                alignment:
                                                    AlignmentDirectional(1, -1),
                                                children: [
                                                  if ((containerBudgetCategoriesRecordList
                                                          .length) >
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
                                                              queryBuilder: (transactionsRecord) => transactionsRecord.where(
                                                                  'linkedCategory',
                                                                  whereIn: containerBudgetCategoriesRecordList
                                                                      .map((e) =>
                                                                          e!.reference)
                                                                      .toList()),
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
                                                                        if ((containerTransactionsRecordList.length) <=
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                20,
                                                                                0,
                                                                                20),
                                                                            child:
                                                                                CircularPercentIndicator(
                                                                              percent: 0,
                                                                              radius: 112.5,
                                                                              lineWidth: 16,
                                                                              animation: true,
                                                                              progressColor: FlutterFlowTheme.of(context).primaryColor,
                                                                              backgroundColor: FlutterFlowTheme.of(context).eviredTransparent,
                                                                              center: Text(
                                                                                '${functions.formatBudgetCurrency(columnBudgetsRecord!.budgetAmount)} ',
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                      fontFamily: 'Source Sans Pro',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                              ),
                                                                              startAngle: 0,
                                                                            ),
                                                                          ),
                                                                        if ((containerTransactionsRecordList.length) >
                                                                            0)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                20,
                                                                                0,
                                                                                20),
                                                                            child:
                                                                                CircularPercentIndicator(
                                                                              percent: functions.calcBudgetChart(columnBudgetsRecord, containerTransactionsRecordList.toList()),
                                                                              radius: 112.5,
                                                                              lineWidth: 16,
                                                                              animation: true,
                                                                              progressColor: FlutterFlowTheme.of(context).primaryColor,
                                                                              backgroundColor: FlutterFlowTheme.of(context).eviredTransparent,
                                                                              center: Text(
                                                                                '${functions.subtractCurrency(columnBudgetsRecord!.budgetAmount, functions.sumTransactionAmounts(containerTransactionsRecordList.toList()))}',
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                      fontFamily: 'Source Sans Pro',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
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
                                                                            '${dateTimeFormat('MMMEd', columnBudgetsRecord!.budgetStart)} - ${dateTimeFormat('MMMEd', columnBudgetsRecord!.budgetEnd)}',
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
                                                                          if ((containerTransactionsRecordList.length) >
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
                                                                                  functions.formatBudgetCurrency(functions.sumTransactionAmounts(containerTransactionsRecordList.toList())),
                                                                                  style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                        fontFamily: 'Source Sans Pro',
                                                                                        fontSize: 20,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          if ((containerTransactionsRecordList.length) >
                                                                              0)
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'Target',
                                                                                  style: FlutterFlowTheme.of(context).bodyText2,
                                                                                ),
                                                                                Text(
                                                                                  functions.formatBudgetCurrency(columnBudgetsRecord!.budgetAmount),
                                                                                  style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                        fontFamily: 'Source Sans Pro',
                                                                                        fontSize: 20,
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 10),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 16, 16, 16),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 100,
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
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
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Unallocated',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2,
                                                                ),
                                                                Text(
                                                                  functions.formatBudgetCurrency(
                                                                      columnBudgetsRecord!
                                                                          .unallocatedAmount),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
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
                                              Divider(),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final displayedCategories =
                                                        containerBudgetCategoriesRecordList
                                                                ?.toList() ??
                                                            [];
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
                                                                      'linkedCategory',
                                                                      isEqualTo:
                                                                          displayedCategoriesItem!
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
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  height: 80,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16,
                                                                            16,
                                                                            16,
                                                                            16),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                10),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  displayedCategoriesItem!.categoryName!,
                                                                                  style: FlutterFlowTheme.of(context).subtitle2,
                                                                                ),
                                                                                Text(
                                                                                  '${functions.subtractCurrencyLine(displayedCategoriesItem!.allocatedAmount, functions.sumTransactionAmounts(containerTransactionsRecordList.toList()))}',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  LinearPercentIndicator(
                                                                                    percent: functions.calcCategoryPercent(displayedCategoriesItem, containerTransactionsRecordList.toList()),
                                                                                    width: MediaQuery.of(context).size.width * 0.81,
                                                                                    lineHeight: 8,
                                                                                    animation: true,
                                                                                    progressColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                    backgroundColor: FlutterFlowTheme.of(context).eviredTransparent,
                                                                                    barRadius: Radius.circular(12),
                                                                                    padding: EdgeInsets.zero,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
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
                                      ],
                                    ),
                                  );
                                },
                              ),
                            if ((columnBudgetsRecord!.reference != null))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 16),
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
                                    child: InkWell(
                                      onTap: () async {
                                        final categoriesCreateData =
                                            createCategoriesRecordData(
                                          categoryName: 'asda',
                                          categoryAmount: 3223451,
                                        );
                                        await CategoriesRecord.createDoc(
                                                columnBudgetsRecord!.reference)
                                            .set(categoriesCreateData);
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: CreateCustomCategoryWidget(
                                                budget: columnBudgetsRecord,
                                              ),
                                            );
                                          },
                                        );
                                      },
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
                                                  fontFamily: 'Source Sans Pro',
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
                if ((functions
                        .isBudgetExising(currentUserDocument!.activeBudget)) ==
                    0)
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
                          );
                          var budgetsRecordReference =
                              BudgetsRecord.collection.doc();
                          await budgetsRecordReference.set(budgetsCreateData);
                          createdBudget = BudgetsRecord.getDocumentFromData(
                              budgetsCreateData, budgetsRecordReference);
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: CreateNewBudgetWidget(
                                  budget: createdBudget,
                                ),
                              );
                            },
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
                                        fontFamily: 'Source Sans Pro',
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
                                    );
                                    var budgetsRecordReference =
                                        BudgetsRecord.collection.doc();
                                    await budgetsRecordReference
                                        .set(budgetsCreateData);
                                    createdBudget2 =
                                        BudgetsRecord.getDocumentFromData(
                                            budgetsCreateData,
                                            budgetsRecordReference);
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: CreateNewBudgetWidget(
                                            budget: createdBudget2,
                                          ),
                                        );
                                      },
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
