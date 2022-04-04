import '../backend/backend.dart';
import '../category_single/category_single_widget.dart';
import '../edit_budget_categories/edit_budget_categories_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BudgetSingleWidget extends StatefulWidget {
  const BudgetSingleWidget({
    Key key,
    this.budget,
  }) : super(key: key);

  final BudgetsRecord budget;

  @override
  _BudgetSingleWidgetState createState() => _BudgetSingleWidgetState();
}

class _BudgetSingleWidgetState extends State<BudgetSingleWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BudgetCategoriesRecord>>(
      stream: queryBudgetCategoriesRecord(
        queryBuilder: (budgetCategoriesRecord) => budgetCategoriesRecord
            .where('categoryBudget', isEqualTo: widget.budget.reference),
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
        List<BudgetCategoriesRecord> budgetSingleBudgetCategoriesRecordList =
            snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              widget.budget.budgetName,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Spline Sans',
                    color: Colors.white,
                    fontSize: 22,
                    useGoogleFonts: false,
                  ),
            ),
            actions: [
              StreamBuilder<List<BudgetCategoriesRecord>>(
                stream: queryBudgetCategoriesRecord(
                  queryBuilder: (budgetCategoriesRecord) =>
                      budgetCategoriesRecord
                          .where('categoryBudget',
                              isEqualTo: widget.budget.reference)
                          .where('categoryName', isEqualTo: 'Uncategorized'),
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
                  List<BudgetCategoriesRecord>
                      iconButtonBudgetCategoriesRecordList = snapshot.data;
                  // Return an empty Container when the document does not exist.
                  if (snapshot.data.isEmpty) {
                    return Container();
                  }
                  final iconButtonBudgetCategoriesRecord =
                      iconButtonBudgetCategoriesRecordList.isNotEmpty
                          ? iconButtonBudgetCategoriesRecordList.first
                          : null;
                  return FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.edit_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditBudgetCategoriesWidget(
                            createdBudget: widget.budget,
                            uncategorized: iconButtonBudgetCategoriesRecord,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
            centerTitle: false,
            elevation: 2,
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
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 20),
                                child: CircularPercentIndicator(
                                    percent: functions
                                        .calcBudgetChart(widget.budget),
                                    radius: 112.5,
                                    lineWidth: 24,
                                    animation: true,
                                    progressColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                    center: Text(
                                      '${functions.calcRemBudget(widget.budget)} Left',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Spline Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    startAngle: 0),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Spent',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                    Text(
                                      functions.formatBudgetCurrency(
                                          widget.budget.budgetSpent),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Target',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                    Text(
                                      functions.formatBudgetCurrency(
                                          widget.budget.budgetAmount),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          StreamBuilder<List<BudgetCategoriesRecord>>(
                            stream: queryBudgetCategoriesRecord(
                              queryBuilder: (budgetCategoriesRecord) =>
                                  budgetCategoriesRecord.where('categoryBudget',
                                      isEqualTo: widget.budget.reference),
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
                                  columnBudgetCategoriesRecordList =
                                  snapshot.data;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    columnBudgetCategoriesRecordList.length,
                                    (columnIndex) {
                                  final columnBudgetCategoriesRecord =
                                      columnBudgetCategoriesRecordList[
                                          columnIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 16),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 100,
                                          decoration: BoxDecoration(),
                                          child: InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      CategorySingleWidget(
                                                    category:
                                                        columnBudgetCategoriesRecord,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 10),
                                                        child: Text(
                                                          columnBudgetCategoriesRecord
                                                              .categoryName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title3,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 10),
                                                        child: Text(
                                                          '${functions.subtractCurrency(columnBudgetCategoriesRecord.allocatedAmount, columnBudgetCategoriesRecord.spentAmount)} of ${functions.formatBudgetCurrency(columnBudgetCategoriesRecord.allocatedAmount)} left',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  LinearPercentIndicator(
                                                                percent: functions
                                                                    .calcCategoryPercent(
                                                                        columnBudgetCategoriesRecord),
                                                                width: 250,
                                                                lineHeight: 8,
                                                                animation: true,
                                                                progressColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFF1B998B),
                                                              ),
                                                            ),
                                                          ],
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
                                  );
                                }),
                              );
                            },
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
