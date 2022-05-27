import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../budget_single/budget_single_widget.dart';
import '../components/create_new_budget_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
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
  BudgetsRecord createdBudget2;
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
        automaticallyImplyLeading: true,
        title: Text(
          'Budget History',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Spline Sans',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                useGoogleFonts: false,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: Visibility(
        visible: (currentUserDocument?.activeBudget != null),
        child: AuthUserStreamWidget(
          child: StreamBuilder<List<BudgetCategoriesRecord>>(
            stream: queryBudgetCategoriesRecord(
              queryBuilder: (budgetCategoriesRecord) => budgetCategoriesRecord
                  .where('categoryBudget',
                      isEqualTo: currentUserDocument?.activeBudget)
                  .where('categoryName', isNotEqualTo: 'Uncategorized'),
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
                  snapshot.data;
              return FloatingActionButton(
                onPressed: () async {
                  logFirebaseEvent(
                      'BUDGETS_PAGE_FloatingActionButton_4zfjaef1_ON_TAP');
                  logFirebaseEvent('FloatingActionButton_Backend-Call');

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
                  var budgetsRecordReference = BudgetsRecord.collection.doc();
                  await budgetsRecordReference.set(budgetsCreateData);
                  createdBudget2 = BudgetsRecord.getDocumentFromData(
                      budgetsCreateData, budgetsRecordReference);
                  logFirebaseEvent('FloatingActionButton_Bottom-Sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: CreateNewBudgetWidget(
                          budget: createdBudget2,
                        ),
                      );
                    },
                  );

                  setState(() {});
                },
                backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                elevation: 8,
                child: Icon(
                  Icons.add_rounded,
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
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: StreamBuilder<List<BudgetsRecord>>(
                        stream: queryBudgetsRecord(
                          queryBuilder: (budgetsRecord) => budgetsRecord.where(
                              'budgetOwner',
                              isEqualTo: currentUserReference),
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
                          List<BudgetsRecord> columnBudgetsRecordList =
                              snapshot.data;
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(columnBudgetsRecordList.length,
                                      (columnIndex) {
                                final columnBudgetsRecord =
                                    columnBudgetsRecordList[columnIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 0,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          child: StreamBuilder<
                                              List<BudgetCategoriesRecord>>(
                                            stream: queryBudgetCategoriesRecord(
                                              queryBuilder: (budgetCategoriesRecord) =>
                                                  budgetCategoriesRecord
                                                      .where('categoryBudget',
                                                          isEqualTo:
                                                              columnBudgetsRecord
                                                                  .reference)
                                                      .where('categoryName',
                                                          isNotEqualTo:
                                                              'Uncategorized'),
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
                                              List<BudgetCategoriesRecord>
                                                  listTileBudgetCategoriesRecordList =
                                                  snapshot.data;
                                              return InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'BUDGETS_PAGE_ListTile_ON_TAP');
                                                  logFirebaseEvent(
                                                      'ListTile_Backend-Call');

                                                  final budgetsUpdateData =
                                                      createBudgetsRecordData(
                                                    lastViewed:
                                                        getCurrentTimestamp,
                                                  );
                                                  await columnBudgetsRecord
                                                      .reference
                                                      .update(
                                                          budgetsUpdateData);
                                                  // Action_BudgetSingle
                                                  logFirebaseEvent(
                                                      'ListTile_Action_BudgetSingle');
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          BudgetSingleWidget(
                                                        budget:
                                                            columnBudgetsRecord,
                                                        uncategorizedAmount: functions
                                                            .calculateRemBudgetCat(
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
                                                      color: Color(0xFFC72323),
                                                      icon:
                                                          Icons.delete_rounded,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'BUDGETS_PAGE_SlidableActionWidget_38dvfl97_ON_TAP');
                                                        if ((columnBudgetsRecord
                                                                .reference) ==
                                                            (currentUserDocument
                                                                ?.activeBudget)) {
                                                          logFirebaseEvent(
                                                              'SlidableActionWidget_Alert-Dialog');
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Are you sure?'),
                                                                        content:
                                                                            Text('This is your current active budget'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('Cancel'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('Delete'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            logFirebaseEvent(
                                                                'SlidableActionWidget_Backend-Call');

                                                            final usersUpdateData =
                                                                {
                                                              'activeBudget':
                                                                  FieldValue
                                                                      .delete(),
                                                            };
                                                            await currentUserReference
                                                                .update(
                                                                    usersUpdateData);
                                                          }
                                                        }
                                                        // Action_DeleteBudget
                                                        logFirebaseEvent(
                                                            'SlidableActionWidget_Action_DeleteBudget');
                                                        await columnBudgetsRecord
                                                            .reference
                                                            .delete();
                                                      },
                                                    ),
                                                    IconSlideAction(
                                                      caption: 'Activate',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      icon: Icons.check_rounded,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'BUDGETS_PAGE_SlidableActionWidget_xms3pwoz_ON_TAP');
                                                        logFirebaseEvent(
                                                            'SlidableActionWidget_Backend-Call');

                                                        final usersUpdateData =
                                                            createUsersRecordData(
                                                          activeBudget:
                                                              columnBudgetsRecord
                                                                  .reference,
                                                        );
                                                        await currentUserReference
                                                            .update(
                                                                usersUpdateData);
                                                      },
                                                    ),
                                                  ],
                                                  child: ListTile(
                                                    title: Text(
                                                      '${dateTimeFormat('MMMEd', columnBudgetsRecord.budgetStart)} - ${dateTimeFormat('MMMEd', columnBudgetsRecord.budgetEnd)}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Source Sans Pro',
                                                                lineHeight: 2,
                                                              ),
                                                    ),
                                                    subtitle: Text(
                                                      functions
                                                          .formatBudgetCurrency(
                                                              columnBudgetsRecord
                                                                  .budgetAmount),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Source Sans Pro',
                                                                lineHeight: 2,
                                                              ),
                                                    ),
                                                    trailing: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Color(0xFF303030),
                                                      size: 20,
                                                    ),
                                                    dense: false,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 10, 20, 10),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'This is where your budgets live. \nSwipe left on a single budget for more options.',
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
      ),
    );
  }
}
