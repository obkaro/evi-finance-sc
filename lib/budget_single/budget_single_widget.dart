import '../backend/backend.dart';
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
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          widget.budget.budgetName,
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: CircularPercentIndicator(
                          percent: functions.calcBudgetChart(widget.budget),
                          radius: 112.5,
                          lineWidth: 24,
                          animation: true,
                          progressColor: Color(0xFF1B998B),
                          backgroundColor: Color(0xFFFF0003),
                          center: Text(
                            functions.calcRemBudget(widget.budget).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                          ),
                          startAngle: 0),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Target',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Text(
                            widget.budget.budgetAmount.toString(),
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Spent',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Text(
                            widget.budget.budgetSpent.toString(),
                            style: FlutterFlowTheme.of(context).title1,
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
                          child: SpinKitFadingFour(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      );
                    }
                    List<BudgetCategoriesRecord>
                        columnBudgetCategoriesRecordList = snapshot.data;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                            columnBudgetCategoriesRecordList.length,
                            (columnIndex) {
                          final columnBudgetCategoriesRecord =
                              columnBudgetCategoriesRecordList[columnIndex];
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: Text(
                                    columnBudgetCategoriesRecord.categoryName,
                                    style: FlutterFlowTheme.of(context).title3,
                                  ),
                                ),
                                LinearPercentIndicator(
                                    percent: functions.calcCategoryPercent(
                                        columnBudgetCategoriesRecord),
                                    width: 120,
                                    lineHeight: 18,
                                    animation: true,
                                    progressColor: Color(0xFFFF0003),
                                    backgroundColor: Color(0xFF1B998B),
                                    barRadius: Radius.circular(40)),
                              ],
                            ),
                          );
                        }),
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
