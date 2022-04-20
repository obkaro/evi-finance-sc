import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../budget_single/budget_single_widget.dart';
import '../create_budget_copy/create_budget_copy_widget.dart';
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'My Budgets',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          logFirebaseEvent('FloatingActionButton-ON_TAP');
          // Action_NewBudget
          logFirebaseEvent('FloatingActionButton-Action_NewBudget');
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateBudgetCopyWidget(),
            ),
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
          child: StreamBuilder<List<BudgetsRecord>>(
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
                          color: FlutterFlowTheme.of(context).primaryBackground,
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
                                listTileBudgetsBudgetCategoriesRecordList =
                                snapshot.data;
                            return InkWell(
                              onTap: () async {
                                logFirebaseEvent('ListTile_Budgets-ON_TAP');
                                // Action_BudgetSingle
                                logFirebaseEvent(
                                    'ListTile_Budgets-Action_BudgetSingle');
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BudgetSingleWidget(
                                      budget: columnBudgetsRecord,
                                      uncategorizedAmount:
                                          functions.calculateRemBudgetCat(
                                              listTileBudgetsBudgetCategoriesRecordList
                                                  .toList(),
                                              columnBudgetsRecord),
                                    ),
                                  ),
                                );
                              },
                              child: Slidable(
                                actionPane: const SlidableScrollActionPane(),
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
                                          fontFamily: 'Roboto',
                                          lineHeight: 2,
                                        ),
                                  ),
                                  subtitle: Text(
                                    functions.formatBudgetCurrency(
                                        columnBudgetsRecord.budgetAmount),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Roboto',
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
        ),
      ),
    );
  }
}
