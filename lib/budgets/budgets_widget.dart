import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../budget_single/budget_single_widget.dart';
import '../components/create_new_budget_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class BudgetsWidget extends StatefulWidget {
  const BudgetsWidget({Key key}) : super(key: key);

  @override
  _BudgetsWidgetState createState() => _BudgetsWidgetState();
}

class _BudgetsWidgetState extends State<BudgetsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Budgets'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          logFirebaseEvent('FloatingActionButton-ON_TAP');
          // Action_NewBudget
          logFirebaseEvent('FloatingActionButton-Action_NewBudget');
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: CreateNewBudgetWidget(),
              );
            },
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: Container(
                  width: double.infinity,
                  height: 72,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: Icon(
                          Icons.pie_chart_rounded,
                          color: Color(0xFFF4F4F4),
                          size: 24,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 20, 0),
                        child: Text(
                          'Budgets',
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Spline Sans',
                                color: Color(0xFFF4F4F4),
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              StreamBuilder<List<BudgetsRecord>>(
                stream: queryBudgetsRecord(
                  queryBuilder: (budgetsRecord) => budgetsRecord
                      .where('budgetOwner', isEqualTo: currentUserReference),
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
                  List<BudgetsRecord> columnBudgetsRecordList = snapshot.data;
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(columnBudgetsRecordList.length,
                          (columnIndex) {
                        final columnBudgetsRecord =
                            columnBudgetsRecordList[columnIndex];
                        return Material(
                          color: Colors.transparent,
                          elevation: 1,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: StreamBuilder<List<BudgetCategoriesRecord>>(
                              stream: queryBudgetCategoriesRecord(
                                queryBuilder: (budgetCategoriesRecord) =>
                                    budgetCategoriesRecord
                                        .where('categoryBudget',
                                            isEqualTo:
                                                columnBudgetsRecord.reference)
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
                                    listTileBudgetCategoriesRecordList =
                                    snapshot.data;
                                return InkWell(
                                  onTap: () async {
                                    logFirebaseEvent('ListTile-ON_TAP');
                                    // Action_BudgetSingle
                                    logFirebaseEvent(
                                        'ListTile-Action_BudgetSingle');
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BudgetSingleWidget(
                                          budget: columnBudgetsRecord,
                                          uncategorizedAmount:
                                              functions.calculateRemBudgetCat(
                                                  listTileBudgetCategoriesRecordList
                                                      .toList(),
                                                  columnBudgetsRecord),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Slidable(
                                    actionPane:
                                        const SlidableScrollActionPane(),
                                    secondaryActions: [
                                      IconSlideAction(
                                        caption: 'Delete',
                                        color: Color(0xFFFF0003),
                                        icon: Icons.delete_rounded,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SlidableActionWidget-ON_TAP');
                                          // Action_DeleteBudget
                                          logFirebaseEvent(
                                              'SlidableActionWidget-Action_DeleteBudget');
                                          await columnBudgetsRecord.reference
                                              .delete();
                                        },
                                      ),
                                    ],
                                    child: ListTile(
                                      title: Text(
                                        '${dateTimeFormat('MMMEd', columnBudgetsRecord.budgetStart)} - ${dateTimeFormat('MMMEd', columnBudgetsRecord.budgetEnd)}',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Source Sans Pro',
                                              lineHeight: 2,
                                            ),
                                      ),
                                      subtitle: Text(
                                        functions.formatBudgetCurrency(
                                            columnBudgetsRecord.budgetAmount),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Source Sans Pro',
                                              lineHeight: 2,
                                            ),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 20,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      dense: false,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 16, 20, 16),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'This is where your budgets live. Tap on the  + icon to create a new budget.',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Source Sans Pro',
                                    lineHeight: 1.4,
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
    );
  }
}
