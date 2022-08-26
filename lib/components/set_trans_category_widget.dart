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
    Key? key,
    this.transaction,
    this.recievedBudget,
  }) : super(key: key);

  final TransactionsRecord? transaction;
  final DocumentReference? recievedBudget;

  @override
  _SetTransCategoryWidgetState createState() => _SetTransCategoryWidgetState();
}

class _SetTransCategoryWidgetState extends State<SetTransCategoryWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 230,
      hideBeforeAnimating: false,
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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 420,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 14,
            color: FlutterFlowTheme.of(context).shadowGray,
          )
        ],
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
                    width: 45,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: AuthUserStreamWidget(
                child: FutureBuilder<List<CategoriesRecord>>(
                  future: queryCategoriesRecordOnce(
                    parent: currentUserDocument!.activeBudget,
                    queryBuilder: (categoriesRecord) => categoriesRecord
                        .where('category_name', isNotEqualTo: 'Unallocated'),
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
                    List<CategoriesRecord> columnCategoriesRecordList =
                        snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(columnCategoriesRecordList.length,
                          (columnIndex) {
                        final columnCategoriesRecord =
                            columnCategoriesRecordList[columnIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: StreamBuilder<List<TransactionsRecord>>(
                            stream: queryTransactionsRecord(
                              queryBuilder: (transactionsRecord) =>
                                  transactionsRecord.where(
                                      'transactionCategory',
                                      isEqualTo:
                                          columnCategoriesRecord.reference),
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
                              return InkWell(
                                onTap: () async {
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation'] ==
                                      null) {
                                    return;
                                  }
                                  await (animationsMap[
                                              'containerOnActionTriggerAnimation']!
                                          .curvedAnimation
                                          .parent as AnimationController)
                                      .forward(from: 0.0);

                                  final transactionsUpdateData =
                                      createTransactionsRecordData(
                                    transactionCategory:
                                        columnCategoriesRecord.reference,
                                    transactionBudget:
                                        columnCategoriesRecord.categoryBudget,
                                  );
                                  await widget.transaction!.reference
                                      .update(transactionsUpdateData);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: double.infinity,
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
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          columnCategoriesRecord.categoryName!,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 0),
                                          child: Text(
                                            functions.subtractCurrencyOfCopy(
                                                columnCategoriesRecord
                                                    .categoryAmount,
                                                functions.sumTransactionAmounts(
                                                    containerTransactionsRecordList
                                                        .toList())),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1Family,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ).animated([
                                animationsMap[
                                    'containerOnActionTriggerAnimation']!
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
