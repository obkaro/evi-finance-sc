import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AssignTransactionWidget extends StatefulWidget {
  const AssignTransactionWidget({
    Key? key,
    this.transaction,
  }) : super(key: key);

  final TransactionsRecord? transaction;

  @override
  _AssignTransactionWidgetState createState() =>
      _AssignTransactionWidgetState();
}

class _AssignTransactionWidgetState extends State<AssignTransactionWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 4000,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    labelColor: FlutterFlowTheme.of(context).primaryText,
                    unselectedLabelColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    labelPadding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    labelStyle: FlutterFlowTheme.of(context).bodyText1,
                    indicatorColor: FlutterFlowTheme.of(context).primaryColor,
                    tabs: [
                      Tab(
                        text: 'Categories',
                        iconMargin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      ),
                      Tab(
                        text: 'Subscriptions',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        AuthUserStreamWidget(
                          child: StreamBuilder<List<CategoriesRecord>>(
                            stream: queryCategoriesRecord(
                              parent: currentUserDocument!.activeBudget,
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
                              List<CategoriesRecord>
                                  containerCategoriesRecordList =
                                  snapshot.data!;
                              return Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 16),
                                      child: Builder(
                                        builder: (context) {
                                          final inheritedCategories =
                                              containerCategoriesRecordList
                                                  .toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                inheritedCategories.length,
                                            itemBuilder: (context,
                                                inheritedCategoriesIndex) {
                                              final inheritedCategoriesItem =
                                                  inheritedCategories[
                                                      inheritedCategoriesIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 10, 16, 10),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        8),
                                                            child: Text(
                                                              inheritedCategoriesItem
                                                                  .categoryName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ),
                                                          StreamBuilder<
                                                              List<
                                                                  TransactionsRecord>>(
                                                            stream:
                                                                queryTransactionsRecord(
                                                              queryBuilder: (transactionsRecord) =>
                                                                  transactionsRecord.where(
                                                                      'transactionCategory',
                                                                      isEqualTo:
                                                                          inheritedCategoriesItem
                                                                              .reference),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        SpinKitRing(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 50,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<TransactionsRecord>
                                                                  textTransactionsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return Text(
                                                                functions.subtractCurrencyOfCopy(
                                                                    inheritedCategoriesItem
                                                                        .categoryAmount,
                                                                    functions.sumTransactionAmounts(
                                                                        textTransactionsRecordList
                                                                            .toList())),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            if (widget
                                                                    .transaction!
                                                                    .transactionCategory !=
                                                                inheritedCategoriesItem
                                                                    .reference)
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                borderWidth: 1,
                                                                buttonSize: 60,
                                                                icon: Icon(
                                                                  Icons
                                                                      .radio_button_off_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 30,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  // if (animationsMap[
                                                                  //         'containerOnActionTriggerAnimation'] ==
                                                                  //     null) {
                                                                  //   return;
                                                                  // }
                                                                  // await (animationsMap['containerOnActionTriggerAnimation']!
                                                                  //             .curvedAnimation
                                                                  //             .parent
                                                                  //         as AnimationController)
                                                                  //     .forward(
                                                                  //         from:
                                                                  //             0.0);

                                                                  final transactionsUpdateData =
                                                                      createTransactionsRecordData(
                                                                    transactionCategory:
                                                                        inheritedCategoriesItem
                                                                            .reference,
                                                                    transactionBudget:
                                                                        inheritedCategoriesItem
                                                                            .categoryBudget,
                                                                  );
                                                                  await widget
                                                                      .transaction!
                                                                      .reference
                                                                      .update(
                                                                          transactionsUpdateData);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              ),
                                                            if (widget
                                                                    .transaction!
                                                                    .transactionCategory ==
                                                                inheritedCategoriesItem
                                                                    .reference)
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                borderWidth: 1,
                                                                buttonSize: 60,
                                                                icon: Icon(
                                                                  Icons
                                                                      .radio_button_checked_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 30,
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      'IconButton pressed ...');
                                                                },
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 16),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 4, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.add_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 24,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 0, 0),
                                                      child: AutoSizeText(
                                                        'New subscription',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  fontSize: 12,
                                                                ),
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
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        StreamBuilder<List<SubscriptionsRecord>>(
                          stream: querySubscriptionsRecord(
                            queryBuilder: (subscriptionsRecord) =>
                                subscriptionsRecord.where('owner',
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            List<SubscriptionsRecord>
                                containerSubscriptionsRecordList =
                                snapshot.data!;
                            return Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 16),
                                    child: Builder(
                                      builder: (context) {
                                        final inheritedSubs =
                                            containerSubscriptionsRecordList
                                                .toList();
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: inheritedSubs.length,
                                          itemBuilder:
                                              (context, inheritedSubsIndex) {
                                            final inheritedSubsItem =
                                                inheritedSubs[
                                                    inheritedSubsIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 8, 16, 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 12, 0),
                                                    child: Container(
                                                      width: 45,
                                                      height: 45,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        inheritedSubsItem.icon!,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          inheritedSubsItem
                                                              .name!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          if (inheritedSubsItem
                                                                  .transactions!
                                                                  .toList()
                                                                  .contains(widget
                                                                      .transaction!
                                                                      .reference) ==
                                                              false)
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 30,
                                                              borderWidth: 1,
                                                              buttonSize: 60,
                                                              icon: Icon(
                                                                Icons
                                                                    .radio_button_off_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 30,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                // if (animationsMap[
                                                                //         'containerOnActionTriggerAnimation'] ==
                                                                //     null) {
                                                                //   return;
                                                                // }
                                                                // await (animationsMap['containerOnActionTriggerAnimation']!
                                                                //             .curvedAnimation
                                                                //             .parent
                                                                //         as AnimationController)
                                                                //     .forward(
                                                                //         from:
                                                                //             0.0);

                                                                final transactionsUpdateData =
                                                                    createTransactionsRecordData(
                                                                  transactionCategory:
                                                                      inheritedSubsItem
                                                                          .category,
                                                                  transactionBudget:
                                                                      currentUserDocument!
                                                                          .activeBudget,
                                                                );
                                                                await widget
                                                                    .transaction!
                                                                    .reference
                                                                    .update(
                                                                        transactionsUpdateData);

                                                                final subscriptionsUpdateData =
                                                                    {
                                                                  ...createSubscriptionsRecordData(
                                                                    lastChargeDate: widget
                                                                        .transaction!
                                                                        .trasactionDate,
                                                                    lastCharge:
                                                                        createMoneyStruct(
                                                                      amount: widget
                                                                          .transaction!
                                                                          .transactionAmount,
                                                                      clearUnsetFields:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                  'transactions':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    widget
                                                                        .transaction!
                                                                        .reference
                                                                  ]),
                                                                  'narrations':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    widget
                                                                        .transaction!
                                                                        .transactionNarration
                                                                  ]),
                                                                };
                                                                await inheritedSubsItem
                                                                    .reference
                                                                    .update(
                                                                        subscriptionsUpdateData);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          if (inheritedSubsItem
                                                              .transactions!
                                                              .toList()
                                                              .contains(widget
                                                                  .transaction!
                                                                  .reference))
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 30,
                                                              borderWidth: 1,
                                                              buttonSize: 60,
                                                              icon: Icon(
                                                                Icons
                                                                    .radio_button_checked_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 30,
                                                              ),
                                                              onPressed: () {
                                                                print(
                                                                    'IconButton pressed ...');
                                                              },
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 12, 12, 12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 4, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.add_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 24,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 0, 0, 0),
                                                    child: AutoSizeText(
                                                      'New subscription',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontSize: 12,
                                                              ),
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
                                ],
                              ),
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
        ],
      ),
    );
  }
}
