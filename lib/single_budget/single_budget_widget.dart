import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../category_single/category_single_widget.dart';
import '../components/circular_indicator_big_widget.dart';
import '../components/create_custom_category_widget.dart';
import '../components/edit_category_widget.dart';
import '../components/empty_list_widget.dart';
import '../components/loading_catlist_widget.dart';
import '../components/loading_empty_widget.dart';
import '../components/progress_bar_widget.dart';
import '../create_budget/create_budget_widget.dart';
import '../edit_budget/edit_budget_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SingleBudgetWidget extends StatefulWidget {
  const SingleBudgetWidget({
    Key? key,
    this.budgetRef,
  }) : super(key: key);

  final DocumentReference? budgetRef;

  @override
  _SingleBudgetWidgetState createState() => _SingleBudgetWidgetState();
}

class _SingleBudgetWidgetState extends State<SingleBudgetWidget> {
  BudgetsRecord? createdBudget2;
  BudgetsRecord? createdBudget;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SingleBudget'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).secondaryPrimary),
        automaticallyImplyLeading: true,
        title: Text(
          'Budget Overview',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: FlutterFlowTheme.of(context).title3Family,
                color: FlutterFlowTheme.of(context).secondaryPrimary,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).title3Family),
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.edit_rounded,
              color: FlutterFlowTheme.of(context).secondaryPrimary,
              size: 20,
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditBudgetWidget(
                    budgetRef: widget.budgetRef,
                  ),
                ),
              );
            },
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: StreamBuilder<BudgetsRecord>(
            stream: BudgetsRecord.getDocument(widget.budgetRef!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: Center(
                    child: LoadingEmptyWidget(),
                  ),
                );
              }
              final containerBudgetsRecord = snapshot.data!;
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (currentUserDocument!.activeBudget != null)
                        AuthUserStreamWidget(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 0, 16),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditBudgetWidget(
                                                            budgetRef: widget
                                                                .budgetRef,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20,
                                                                    20, 20, 20),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          20,
                                                                          0,
                                                                          20),
                                                                  child:
                                                                      CircularIndicatorBigWidget(
                                                                    totalAmount:
                                                                        containerBudgetsRecord
                                                                            .budgetAmount,
                                                                    spentAmount:
                                                                        containerBudgetsRecord
                                                                            .budgetSpent,
                                                                    centerText: functions.subtractCurrency(
                                                                        containerBudgetsRecord
                                                                            .budgetAmount,
                                                                        containerBudgetsRecord
                                                                            .budgetSpent),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          16),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    '${dateTimeFormat(
                                                                      'MMMEd',
                                                                      containerBudgetsRecord
                                                                          .budgetStart,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )} - ${dateTimeFormat(
                                                                      'MMMEd',
                                                                      containerBudgetsRecord
                                                                          .budgetEnd,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Spent',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText2,
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        functions
                                                                            .formatTransCurrency(containerBudgetsRecord.budgetSpent),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle1
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).subtitle1Family,
                                                                            fontSize:
                                                                                20,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle1Family),
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'Limit',
                                                                              style: FlutterFlowTheme.of(context).bodyText2,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.formatTransCurrency(containerBudgetsRecord.budgetAmount),
                                                                            '0',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).subtitle1,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 8),
                                              child: StreamBuilder<
                                                  List<CategoriesRecord>>(
                                                stream: queryCategoriesRecord(
                                                  parent: widget.budgetRef,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child:
                                                          LoadingCatlistWidget(),
                                                    );
                                                  }
                                                  List<CategoriesRecord>
                                                      listViewCategoriesRecordList =
                                                      snapshot.data!;
                                                  if (listViewCategoriesRecordList
                                                      .isEmpty) {
                                                    return EmptyListWidget(
                                                      text:
                                                          'No categories defined yet...',
                                                      icon: Icon(
                                                        Icons.list_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 64,
                                                      ),
                                                    );
                                                  }
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewCategoriesRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewCategoriesRecord =
                                                          listViewCategoriesRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 16),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            // Action_ViewSingleCategory
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        CategorySingleWidget(
                                                                  category:
                                                                      listViewCategoriesRecord,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          onLongPress:
                                                              () async {
                                                            HapticFeedback
                                                                .lightImpact();
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      EditCategoryWidget(
                                                                    budget:
                                                                        containerBudgetsRecord,
                                                                    categoryToEdit:
                                                                        listViewCategoriesRecord,
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          child: Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          8,
                                                                          20,
                                                                          8),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            0,
                                                                            2,
                                                                            8),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          listViewCategoriesRecord
                                                                              .categoryName!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).subtitle1,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            functions.formatBudgetCurrency(listViewCategoriesRecord.categoryAmount),
                                                                            textAlign:
                                                                                TextAlign.end,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText1,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            8),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              ProgressBarWidget(
                                                                            totalAmount:
                                                                                listViewCategoriesRecord.categoryAmount,
                                                                            spentAmount:
                                                                                listViewCategoriesRecord.spentAmount,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            0,
                                                                            2,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          functions.subtractCurrencyOf(
                                                                              listViewCategoriesRecord.categoryAmount,
                                                                              listViewCategoriesRecord.spentAmount),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (containerBudgetsRecord
                                            .unallocatedAmount! >
                                        0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 0, 16),
                                        child: InkWell(
                                          onTap: () async {
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
                                                        containerBudgetsRecord,
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 32,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 8, 0),
                                                  child: Icon(
                                                    Icons.warning_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 24,
                                                  ),
                                                ),
                                                Text(
                                                  'Unallocated: ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                                ),
                                                Text(
                                                  functions.formatBudgetCurrency(
                                                      containerBudgetsRecord
                                                          .unallocatedAmount),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
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
                            ],
                          ),
                        ),
                      if (currentUserDocument!.activeBudget == null)
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                          child: AuthUserStreamWidget(
                            child: InkWell(
                              onTap: () async {
                                final budgetsCreateData =
                                    createBudgetsRecordData(
                                  budgetDateCreated: getCurrentTimestamp,
                                  budgetID: random_data.randomString(
                                    24,
                                    24,
                                    true,
                                    true,
                                    true,
                                  ),
                                  status: 'unattached',
                                );
                                var budgetsRecordReference =
                                    BudgetsRecord.collection.doc();
                                await budgetsRecordReference
                                    .set(budgetsCreateData);
                                createdBudget =
                                    BudgetsRecord.getDocumentFromData(
                                        budgetsCreateData,
                                        budgetsRecordReference);
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CreateBudgetWidget(
                                      budget: createdBudget,
                                    ),
                                  ),
                                );

                                setState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Tap to create a budget',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        borderWidth: 1,
                                        buttonSize: 60,
                                        icon: Icon(
                                          Icons.add_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 48,
                                        ),
                                        onPressed: () async {
                                          final budgetsCreateData =
                                              createBudgetsRecordData(
                                            budgetDateCreated:
                                                getCurrentTimestamp,
                                            budgetID: random_data.randomString(
                                              24,
                                              24,
                                              true,
                                              true,
                                              true,
                                            ),
                                            status: 'unattached',
                                          );
                                          var budgetsRecordReference =
                                              BudgetsRecord.collection.doc();
                                          await budgetsRecordReference
                                              .set(budgetsCreateData);
                                          createdBudget2 =
                                              BudgetsRecord.getDocumentFromData(
                                                  budgetsCreateData,
                                                  budgetsRecordReference);
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CreateBudgetWidget(
                                                budget: createdBudget2,
                                              ),
                                            ),
                                          );

                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
