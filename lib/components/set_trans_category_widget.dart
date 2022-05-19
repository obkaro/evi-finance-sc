import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SetTransCategoryWidget extends StatefulWidget {
  const SetTransCategoryWidget({
    Key key,
    this.transaction,
    this.recievedBudget,
  }) : super(key: key);

  final TransactionsRecord transaction;
  final DocumentReference recievedBudget;

  @override
  _SetTransCategoryWidgetState createState() => _SetTransCategoryWidgetState();
}

class _SetTransCategoryWidgetState extends State<SetTransCategoryWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 230,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 0.97,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 420,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 16),
                  child: Container(
                    width: 60,
                    height: 6,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select Category',
                    style: FlutterFlowTheme.of(context).subtitle1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: AuthUserStreamWidget(
                child: FutureBuilder<List<BudgetCategoriesRecord>>(
                  future: queryBudgetCategoriesRecordOnce(
                    queryBuilder: (budgetCategoriesRecord) =>
                        budgetCategoriesRecord
                            .where('budgetOwner',
                                isEqualTo: currentUserReference)
                            .where('categoryBudget',
                                isEqualTo: currentUserDocument?.activeBudget)
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
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      );
                    }
                    List<BudgetCategoriesRecord>
                        columnBudgetCategoriesRecordList = snapshot.data;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children:
                          List.generate(columnBudgetCategoriesRecordList.length,
                              (columnIndex) {
                        final columnBudgetCategoriesRecord =
                            columnBudgetCategoriesRecordList[columnIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: FutureBuilder<BudgetCategoriesRecord>(
                            future: BudgetCategoriesRecord.getDocumentOnce(
                                widget.transaction.linkedCategory),
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
                              final containerBudgetCategoriesRecord =
                                  snapshot.data;
                              return InkWell(
                                onTap: () async {
                                  logFirebaseEvent('Container-ON_TAP');
                                  logFirebaseEvent(
                                      'Container-Widget-Animation');
                                  await (animationsMap[
                                              'containerOnActionTriggerAnimation']
                                          .curvedAnimation
                                          .parent as AnimationController)
                                      .forward(from: 0.0);

                                  logFirebaseEvent('Container-Backend-Call');

                                  final transactionsUpdateData =
                                      createTransactionsRecordData(
                                    linkedCategory:
                                        columnBudgetCategoriesRecord.reference,
                                    isCategorized: true,
                                  );
                                  await widget.transaction.reference
                                      .update(transactionsUpdateData);
                                  logFirebaseEvent('Container-Backend-Call');

                                  final budgetCategoriesUpdateData = {
                                    'linkedTransactions': FieldValue.arrayUnion(
                                        [widget.transaction.reference]),
                                  };
                                  await columnBudgetCategoriesRecord.reference
                                      .update(budgetCategoriesUpdateData);
                                  logFirebaseEvent('Container-Navigate-Back');
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          columnBudgetCategoriesRecord
                                              .categoryName,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 16, 0, 0),
                                          child: Text(
                                            functions.formatBudgetCurrency(
                                                columnBudgetCategoriesRecord
                                                    .allocatedAmount),
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ).animated([
                                animationsMap[
                                    'containerOnActionTriggerAnimation']
                              ]);
                            },
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
