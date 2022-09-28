import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/dialog_box_widget.dart';
import '../create_budget/create_budget_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../single_budget/single_budget_widget.dart';
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
  BudgetsRecord? newBudg;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Budgets'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).secondaryPrimary),
        automaticallyImplyLeading: true,
        title: Text(
          'Budget Archives',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: FlutterFlowTheme.of(context).title3Family,
                color: FlutterFlowTheme.of(context).secondaryPrimary,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).title3Family),
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).secondaryPrimary,
            size: 30,
          ),
          onPressed: () async {
            final budgetsCreateData = createBudgetsRecordData(
              budgetDateCreated: getCurrentTimestamp,
              budgetID: random_data.randomString(
                32,
                32,
                true,
                true,
                true,
              ),
            );
            var budgetsRecordReference = BudgetsRecord.collection.doc();
            await budgetsRecordReference.set(budgetsCreateData);
            newBudg = BudgetsRecord.getDocumentFromData(
                budgetsCreateData, budgetsRecordReference);
            await Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CreateBudgetWidget(
                  budget: newBudg,
                ),
              ),
            );

            setState(() {});
          },
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
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        SingleBudgetWidget(
                                                      budgetRef:
                                                          columnBudgetsRecord
                                                              .reference,
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
                                                                yesAction:
                                                                    () async {},
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));

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
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
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
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2Family),
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
                            style: FlutterFlowTheme.of(context)
                                .bodyText2
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText2Family,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText2Family),
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
