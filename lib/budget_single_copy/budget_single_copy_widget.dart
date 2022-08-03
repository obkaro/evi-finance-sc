import '../backend/backend.dart';
import '../category_single/category_single_widget.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BudgetSingleCopyWidget extends StatefulWidget {
  const BudgetSingleCopyWidget({
    Key? key,
    this.budget,
  }) : super(key: key);

  final BudgetsRecord? budget;

  @override
  _BudgetSingleCopyWidgetState createState() => _BudgetSingleCopyWidgetState();
}

class _BudgetSingleCopyWidgetState extends State<BudgetSingleCopyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BudgetSingleCopy'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CategoriesRecord>>(
      stream: queryCategoriesRecord(
        parent: widget.budget!.reference,
        queryBuilder: (categoriesRecord) =>
            categoriesRecord.where('category_name', isNotEqualTo: 'dummy'),
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
        List<CategoriesRecord> budgetSingleCopyCategoriesRecordList =
            snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
            automaticallyImplyLeading: true,
            title: Text(
              '${dateTimeFormat('MEd', widget.budget!.budgetStart)} - ${dateTimeFormat('MEd', widget.budget!.budgetEnd)}',
              style: FlutterFlowTheme.of(context).title3,
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.edit_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: StreamBuilder<List<TransactionsRecord>>(
                                  stream: queryTransactionsRecord(
                                    queryBuilder: (transactionsRecord) =>
                                        transactionsRecord.where(
                                            'transactionCategory',
                                            whereIn:
                                                budgetSingleCopyCategoriesRecordList
                                                    .map((e) => e.reference)
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 50,
                                          ),
                                        ),
                                      );
                                    }
                                    List<TransactionsRecord>
                                        containerTransactionsRecordList =
                                        snapshot.data!;
                                    return Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 300,
                                            child: FlutterFlowLineChart(
                                              data: [
                                                FFLineChartData(
                                                  xData:
                                                      containerTransactionsRecordList
                                                          .map((d) =>
                                                              d.trasactionDate)
                                                          .toList(),
                                                  yData:
                                                      containerTransactionsRecordList
                                                          .map((d) => d
                                                              .transactionAmount)
                                                          .toList(),
                                                  settings: LineChartBarData(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    barWidth: 0.5,
                                                    isCurved: true,
                                                    dotData:
                                                        FlDotData(show: false),
                                                    belowBarData: BarAreaData(
                                                      show: true,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .eviredTransparent,
                                                    ),
                                                  ),
                                                )
                                              ],
                                              backgroundColor:
                                                  Color(0x00FFFFFF),
                                              axisBounds: AxisBounds(),
                                              xAxisLabelInfo: AxisLabelInfo(
                                                showLabels: true,
                                                labelTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                labelInterval: 10,
                                              ),
                                              yAxisLabelInfo: AxisLabelInfo(),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 20),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                if (containerTransactionsRecordList
                                                        .length >
                                                    0)
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Spent',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2,
                                                      ),
                                                      Text(
                                                        functions.formatBudgetCurrency(
                                                            functions.sumTransactionAmounts(
                                                                containerTransactionsRecordList
                                                                    .toList())),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1Family,
                                                                  fontSize: 20,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                if (containerTransactionsRecordList
                                                        .length >
                                                    0)
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Target',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2,
                                                      ),
                                                      Text(
                                                        functions
                                                            .formatBudgetCurrency(
                                                                widget.budget!
                                                                    .budgetAmount),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1Family,
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                            child: FutureBuilder<List<CategoriesRecord>>(
                              future: queryCategoriesRecordOnce(
                                parent: widget.budget!.reference,
                                queryBuilder: (categoriesRecord) =>
                                    categoriesRecord.where('category_name',
                                        isEqualTo: 'Unallocated'),
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
                                // Return an empty Container when the document does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final containerCategoriesRecord =
                                    containerCategoriesRecordList.first;
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 14,
                                        color: FlutterFlowTheme.of(context)
                                            .shadowGray,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 16),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      decoration: BoxDecoration(),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
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
                                                      widget.budget!
                                                          .unallocatedAmount),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2,
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
                          ),
                          Divider(
                            thickness: 1,
                            color: FlutterFlowTheme.of(context).fadedDivider,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Builder(
                              builder: (context) {
                                final budgetCategories =
                                    budgetSingleCopyCategoriesRecordList
                                        .toList();
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children:
                                      List.generate(budgetCategories.length,
                                          (budgetCategoriesIndex) {
                                    final budgetCategoriesItem =
                                        budgetCategories[budgetCategoriesIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 16),
                                      child: StreamBuilder<
                                          List<TransactionsRecord>>(
                                        stream: queryTransactionsRecord(
                                          queryBuilder: (transactionsRecord) =>
                                              transactionsRecord.where(
                                                  'transactionCategory',
                                                  isEqualTo:
                                                      budgetCategoriesItem
                                                          .reference),
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
                                              snapshot.data!;
                                          return InkWell(
                                            onTap: () async {
                                              // Action_ViewSingleCategory
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      CategorySingleWidget(
                                                    category:
                                                        budgetCategoriesItem,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 16, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Text(
                                                              budgetCategoriesItem
                                                                  .categoryName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Text(
                                                              functions.subtractCurrencyOf(
                                                                  budgetCategoriesItem
                                                                      .categoryAmount,
                                                                  functions.sumTransactionAmounts(
                                                                      containerTransactionsRecordList
                                                                          .toList())),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle2
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle2Family,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              LinearPercentIndicator(
                                                                percent: functions.calcCategoryPercent(
                                                                    budgetCategoriesItem,
                                                                    containerTransactionsRecordList
                                                                        .toList()),
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.81,
                                                                lineHeight: 8,
                                                                animation: true,
                                                                progressColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .eviredTransparent,
                                                                barRadius: Radius
                                                                    .circular(
                                                                        12),
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
