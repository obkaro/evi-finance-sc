import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SetTransCategoryCopyWidget extends StatefulWidget {
  const SetTransCategoryCopyWidget({
    Key key,
    this.transaction,
    this.recievedBudget,
  }) : super(key: key);

  final TransactionsRecord transaction;
  final DocumentReference recievedBudget;

  @override
  _SetTransCategoryCopyWidgetState createState() =>
      _SetTransCategoryCopyWidgetState();
}

class _SetTransCategoryCopyWidgetState extends State<SetTransCategoryCopyWidget>
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
      height: 300,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 420,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Select Category',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
              child: FutureBuilder<List<BudgetCategoriesRecord>>(
                future: queryBudgetCategoriesRecordOnce(
                  queryBuilder: (budgetCategoriesRecord) =>
                      budgetCategoriesRecord
                          .where('budgetOwner', isEqualTo: currentUserReference)
                          .where('categoryBudget',
                              isEqualTo: widget.recievedBudget),
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
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children:
                          List.generate(columnBudgetCategoriesRecordList.length,
                              (columnIndex) {
                        final columnBudgetCategoriesRecord =
                            columnBudgetCategoriesRecordList[columnIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: InkWell(
                            onTap: () async {
                              await (animationsMap[
                                          'containerOnActionTriggerAnimation']
                                      .curvedAnimation
                                      .parent as AnimationController)
                                  .forward(from: 0.0);

                              final transactionsUpdateData =
                                  createTransactionsRecordData(
                                linkedCategory:
                                    columnBudgetCategoriesRecord.reference,
                                isCategorized: true,
                              );
                              await widget.transaction.reference
                                  .update(transactionsUpdateData);

                              final budgetCategoriesUpdateData = {
                                'linkedTransactions': FieldValue.arrayUnion(
                                    [widget.transaction.reference]),
                              };
                              await columnBudgetCategoriesRecord.reference
                                  .update(budgetCategoriesUpdateData);
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavBarPage(initialPage: 'Transactions'),
                                ),
                                (r) => false,
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 120,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      columnBudgetCategoriesRecord.categoryName,
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 16, 0, 0),
                                      child: Text(
                                        functions.formatTransCurrency(
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
                            animationsMap['containerOnActionTriggerAnimation']
                          ]),
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
