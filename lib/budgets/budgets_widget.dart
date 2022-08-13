import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../budget_single/budget_single_widget.dart';
import '../components/dialog_box_widget.dart';
import '../create_budget/create_budget_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class BudgetsWidget extends StatefulWidget {
  const BudgetsWidget({Key? key}) : super(key: key);

  @override
  _BudgetsWidgetState createState() => _BudgetsWidgetState();
}

class _BudgetsWidgetState extends State<BudgetsWidget> {
  BudgetsRecord? createdBudget2;
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
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: Visibility(
        visible: currentUserDocument!.activeBudget != null,
        child: AuthUserStreamWidget(
          child: StreamBuilder<List<CategoriesRecord>>(
            stream: queryCategoriesRecord(
              parent: currentUserDocument!.activeBudget,
              queryBuilder: (categoriesRecord) => categoriesRecord
                  .where('category_name', isNotEqualTo: 'unallocated'),
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
              List<CategoriesRecord> floatingActionButtonCategoriesRecordList =
                  snapshot.data!;
              // Return an empty Container when the document does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final floatingActionButtonCategoriesRecord =
                  floatingActionButtonCategoriesRecordList.first;
              return FloatingActionButton(
                onPressed: () async {
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
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateBudgetWidget(
                        budget: createdBudget2,
                      ),
                    ),
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
                  padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
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
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 14,
                            color: FlutterFlowTheme.of(context).shadowGray,
                          )
                        ],
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
                              snapshot.data!;
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
                                        child: StreamBuilder<
                                            List<CategoriesRecord>>(
                                          stream: queryCategoriesRecord(
                                            parent:
                                                columnBudgetsRecord.reference,
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
                                            List<CategoriesRecord>
                                                listTileCategoriesRecordList =
                                                snapshot.data!;
                                            return InkWell(
                                              onTap: () async {
                                                final budgetsUpdateData =
                                                    createBudgetsRecordData(
                                                  lastViewed:
                                                      getCurrentTimestamp,
                                                );
                                                await columnBudgetsRecord
                                                    .reference
                                                    .update(budgetsUpdateData);
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        BudgetSingleWidget(
                                                      budget:
                                                          columnBudgetsRecord,
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
                                                    icon: Icons.delete_rounded,
                                                    onTap: () async {
                                                      if (columnBudgetsRecord
                                                              .reference ==
                                                          currentUserDocument!
                                                              .activeBudget) {
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
                                                                      content: Text(
                                                                          'This is your current active budget'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              false),
                                                                          child:
                                                                              Text('Cancel'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              true),
                                                                          child:
                                                                              Text('Delete'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        setState(() => FFAppState()
                                                                .dialogBoxReturn =
                                                            false);
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child:
                                                                  DialogBoxWidget(
                                                                heading:
                                                                    'Delete active budget?',
                                                                body:
                                                                    'You will be required to create a new budget on the active budget page',
                                                                buttonYes:
                                                                    'Delete',
                                                                buttonNo:
                                                                    'Don\'t delete',
                                                                information:
                                                                    false,
                                                              ),
                                                            );
                                                          },
                                                        );
                                                        if (FFAppState()
                                                            .dialogBoxReturn) {
                                                          await actions
                                                              .deleteCategories(
                                                            listTileCategoriesRecordList
                                                                .toList(),
                                                            columnBudgetsRecord,
                                                          );

                                                          final usersUpdateData =
                                                              {
                                                            'activeBudget':
                                                                FieldValue
                                                                    .delete(),
                                                          };
                                                          await currentUserReference!
                                                              .update(
                                                                  usersUpdateData);
                                                          await columnBudgetsRecord
                                                              .reference
                                                              .delete();
                                                        }
                                                      } else {
                                                        await actions
                                                            .deleteCategories(
                                                          listTileCategoriesRecordList
                                                              .toList(),
                                                          columnBudgetsRecord,
                                                        );
                                                        // Action_DeleteBudget
                                                        await columnBudgetsRecord
                                                            .reference
                                                            .delete();
                                                      }
                                                    },
                                                  ),
                                                  IconSlideAction(
                                                    caption: 'Activate',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    icon: Icons.check_rounded,
                                                    onTap: () async {
                                                      final usersUpdateData =
                                                          createUsersRecordData(
                                                        activeBudget:
                                                            columnBudgetsRecord
                                                                .reference,
                                                      );
                                                      await currentUserReference!
                                                          .update(
                                                              usersUpdateData);
                                                    },
                                                  ),
                                                ],
                                                child: ListTile(
                                                  title: Text(
                                                    functions
                                                        .formatTransCurrency(
                                                            columnBudgetsRecord
                                                                .budgetAmount),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          lineHeight: 2,
                                                        ),
                                                  ),
                                                  subtitle: Text(
                                                    '${dateTimeFormat('MMMEd', columnBudgetsRecord.budgetStart)} - ${dateTimeFormat('MMMEd', columnBudgetsRecord.budgetEnd)}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2Family,
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
                  padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 16),
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
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText2Family,
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
