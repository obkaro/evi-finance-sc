import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_recurring_payment_widget.dart';
import '../components/create_custom_category_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
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
            height: 480,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
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
                    labelStyle: FlutterFlowTheme.of(context).subtitle1,
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
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 320,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
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
                                                      .fromSTEB(20, 10, 20, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1,
                                                              ),
                                                            ),
                                                            StreamBuilder<
                                                                List<
                                                                    TransactionsRecord>>(
                                                              stream:
                                                                  queryTransactionsRecord(
                                                                queryBuilder: (transactionsRecord) => transactionsRecord.where(
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
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          SpinKitRing(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            50,
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
                                                                      inheritedCategoriesItem
                                                                          .spentAmount),
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
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30,
                                                                  borderWidth:
                                                                      1,
                                                                  buttonSize:
                                                                      60,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .radio_button_off_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 30,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    final transactionsUpdateData =
                                                                        createTransactionsRecordData(
                                                                      transactionCategory:
                                                                          inheritedCategoriesItem
                                                                              .reference,
                                                                      transactionBudget:
                                                                          inheritedCategoriesItem
                                                                              .categoryBudget,
                                                                      categoryDetails:
                                                                          createCategoryDetailsStruct(
                                                                        name: inheritedCategoriesItem
                                                                            .categoryName,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
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
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30,
                                                                  borderWidth:
                                                                      1,
                                                                  buttonSize:
                                                                      60,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .radio_button_checked_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    size: 30,
                                                                  ),
                                                                  onPressed:
                                                                      () {
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
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 16, 20, 0),
                                      child: StreamBuilder<BudgetsRecord>(
                                        stream: BudgetsRecord.getDocument(
                                            currentUserDocument!.activeBudget!),
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
                                          final buttonBudgetsRecord =
                                              snapshot.data!;
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child:
                                                        CreateCustomCategoryWidget(
                                                      budget:
                                                          buttonBudgetsRecord,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            text: 'New Category',
                                            icon: Icon(
                                              Icons.add_rounded,
                                              size: 15,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 60,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2Family,
                                                        color: Colors.white,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family),
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                          );
                                        },
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
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 320,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
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
                                                    .fromSTEB(20, 8, 20, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 12, 0),
                                                      child: Hero(
                                                        tag: inheritedSubsItem
                                                            .icon!,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                inheritedSubsItem
                                                                    .icon!,
                                                            width: 48,
                                                            height: 48,
                                                            fit: BoxFit
                                                                .scaleDown,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            inheritedSubsItem
                                                                .name!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle1,
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
                                                                borderRadius:
                                                                    30,
                                                                borderWidth: 1,
                                                                buttonSize: 60,
                                                                icon: Icon(
                                                                  Icons
                                                                      .radio_button_off_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 30,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  if (widget
                                                                          .transaction!
                                                                          .recurringRef !=
                                                                      null) {
                                                                    await actions
                                                                        .normalizeTransSub(
                                                                      widget
                                                                          .transaction!,
                                                                    );

                                                                    final transactionsUpdateData =
                                                                        createTransactionsRecordData(
                                                                      transactionCategory:
                                                                          inheritedSubsItem
                                                                              .category,
                                                                      transactionBudget:
                                                                          currentUserDocument!
                                                                              .activeBudget,
                                                                      recurringRef:
                                                                          inheritedSubsItem
                                                                              .reference,
                                                                      categoryDetails:
                                                                          createCategoryDetailsStruct(
                                                                        name: inheritedSubsItem
                                                                            .categoryDetails
                                                                            .name,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      subscriptionDetails:
                                                                          createSubscriptionDetailsStruct(
                                                                        name: inheritedSubsItem
                                                                            .name,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    );
                                                                    await widget
                                                                        .transaction!
                                                                        .reference
                                                                        .update(
                                                                            transactionsUpdateData);
                                                                    if (inheritedSubsItem
                                                                            .lastChargeDate !=
                                                                        null) {
                                                                      if (widget
                                                                              .transaction!
                                                                              .trasactionDate! >
                                                                          inheritedSubsItem
                                                                              .lastChargeDate!) {
                                                                        final subscriptionsUpdateData =
                                                                            {
                                                                          ...createSubscriptionsRecordData(
                                                                            lastChargeDate:
                                                                                widget.transaction!.trasactionDate,
                                                                            lastCharge:
                                                                                createMoneyStruct(
                                                                              amount: widget.transaction!.transactionAmount,
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                            expChargeDate:
                                                                                functions.addDaysToDate(widget.transaction!.trasactionDate, functions.setNewExpectedSubDate(inheritedSubsItem)),
                                                                          ),
                                                                          'transactions':
                                                                              FieldValue.arrayUnion([
                                                                            widget.transaction!.reference
                                                                          ]),
                                                                          'narrations':
                                                                              FieldValue.arrayUnion([
                                                                            widget.transaction!.transactionNarration
                                                                          ]),
                                                                        };
                                                                        await inheritedSubsItem
                                                                            .reference
                                                                            .update(subscriptionsUpdateData);
                                                                      } else {
                                                                        final subscriptionsUpdateData =
                                                                            {
                                                                          'transactions':
                                                                              FieldValue.arrayUnion([
                                                                            widget.transaction!.reference
                                                                          ]),
                                                                          'narrations':
                                                                              FieldValue.arrayUnion([
                                                                            widget.transaction!.transactionNarration
                                                                          ]),
                                                                        };
                                                                        await inheritedSubsItem
                                                                            .reference
                                                                            .update(subscriptionsUpdateData);
                                                                      }
                                                                    } else {
                                                                      final subscriptionsUpdateData =
                                                                          {
                                                                        ...createSubscriptionsRecordData(
                                                                          lastChargeDate: widget
                                                                              .transaction!
                                                                              .trasactionDate,
                                                                          lastCharge:
                                                                              createMoneyStruct(
                                                                            amount:
                                                                                widget.transaction!.transactionAmount,
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                          expChargeDate: functions.addDaysToDate(
                                                                              widget.transaction!.trasactionDate,
                                                                              functions.setNewExpectedSubDate(inheritedSubsItem)),
                                                                        ),
                                                                        'transactions':
                                                                            FieldValue.arrayUnion([
                                                                          widget
                                                                              .transaction!
                                                                              .reference
                                                                        ]),
                                                                        'narrations':
                                                                            FieldValue.arrayUnion([
                                                                          widget
                                                                              .transaction!
                                                                              .transactionNarration
                                                                        ]),
                                                                      };
                                                                      await inheritedSubsItem
                                                                          .reference
                                                                          .update(
                                                                              subscriptionsUpdateData);
                                                                    }
                                                                  } else {
                                                                    final transactionsUpdateData =
                                                                        createTransactionsRecordData(
                                                                      transactionCategory:
                                                                          inheritedSubsItem
                                                                              .category,
                                                                      transactionBudget:
                                                                          currentUserDocument!
                                                                              .activeBudget,
                                                                      recurringRef:
                                                                          inheritedSubsItem
                                                                              .reference,
                                                                      categoryDetails:
                                                                          createCategoryDetailsStruct(
                                                                        name: inheritedSubsItem
                                                                            .categoryDetails
                                                                            .name,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      subscriptionDetails:
                                                                          createSubscriptionDetailsStruct(
                                                                        name: inheritedSubsItem
                                                                            .name,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    );
                                                                    await widget
                                                                        .transaction!
                                                                        .reference
                                                                        .update(
                                                                            transactionsUpdateData);
                                                                    if (inheritedSubsItem
                                                                            .lastChargeDate !=
                                                                        null) {
                                                                      if (widget
                                                                              .transaction!
                                                                              .trasactionDate! >
                                                                          inheritedSubsItem
                                                                              .lastChargeDate!) {
                                                                        final subscriptionsUpdateData =
                                                                            {
                                                                          ...createSubscriptionsRecordData(
                                                                            lastChargeDate:
                                                                                widget.transaction!.trasactionDate,
                                                                            lastCharge:
                                                                                createMoneyStruct(
                                                                              amount: widget.transaction!.transactionAmount,
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                            expChargeDate:
                                                                                functions.addDaysToDate(widget.transaction!.trasactionDate, functions.setNewExpectedSubDate(inheritedSubsItem)),
                                                                          ),
                                                                          'transactions':
                                                                              FieldValue.arrayUnion([
                                                                            widget.transaction!.reference
                                                                          ]),
                                                                          'narrations':
                                                                              FieldValue.arrayUnion([
                                                                            widget.transaction!.transactionNarration
                                                                          ]),
                                                                        };
                                                                        await inheritedSubsItem
                                                                            .reference
                                                                            .update(subscriptionsUpdateData);
                                                                      } else {
                                                                        final subscriptionsUpdateData =
                                                                            {
                                                                          'transactions':
                                                                              FieldValue.arrayUnion([
                                                                            widget.transaction!.reference
                                                                          ]),
                                                                          'narrations':
                                                                              FieldValue.arrayUnion([
                                                                            widget.transaction!.transactionNarration
                                                                          ]),
                                                                        };
                                                                        await inheritedSubsItem
                                                                            .reference
                                                                            .update(subscriptionsUpdateData);
                                                                      }
                                                                    } else {
                                                                      final subscriptionsUpdateData =
                                                                          {
                                                                        ...createSubscriptionsRecordData(
                                                                          lastChargeDate: widget
                                                                              .transaction!
                                                                              .trasactionDate,
                                                                          lastCharge:
                                                                              createMoneyStruct(
                                                                            amount:
                                                                                widget.transaction!.transactionAmount,
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                          expChargeDate: functions.addDaysToDate(
                                                                              widget.transaction!.trasactionDate,
                                                                              functions.setNewExpectedSubDate(inheritedSubsItem)),
                                                                        ),
                                                                        'transactions':
                                                                            FieldValue.arrayUnion([
                                                                          widget
                                                                              .transaction!
                                                                              .reference
                                                                        ]),
                                                                        'narrations':
                                                                            FieldValue.arrayUnion([
                                                                          widget
                                                                              .transaction!
                                                                              .transactionNarration
                                                                        ]),
                                                                      };
                                                                      await inheritedSubsItem
                                                                          .reference
                                                                          .update(
                                                                              subscriptionsUpdateData);
                                                                    }
                                                                  }

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
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 16, 20, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child:
                                                  AddRecurringPaymentWidget(),
                                            );
                                          },
                                        );
                                      },
                                      text: 'New Subscription',
                                      icon: Icon(
                                        Icons.add_rounded,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 60,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2Family,
                                              color: Colors.white,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2Family),
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
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
