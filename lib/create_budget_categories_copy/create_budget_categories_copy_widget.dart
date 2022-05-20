import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/create_const_category_widget.dart';
import '../components/create_custom_category_widget.dart';
import '../components/edit_budget_amount_widget.dart';
import '../components/edit_category_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateBudgetCategoriesCopyWidget extends StatefulWidget {
  const CreateBudgetCategoriesCopyWidget({
    Key key,
    this.createdBudget,
    this.uncategorized,
    this.dateRange,
  }) : super(key: key);

  final BudgetsRecord createdBudget;
  final BudgetCategoriesRecord uncategorized;
  final DateTimeRange dateRange;

  @override
  _CreateBudgetCategoriesCopyWidgetState createState() =>
      _CreateBudgetCategoriesCopyWidgetState();
}

class _CreateBudgetCategoriesCopyWidgetState
    extends State<CreateBudgetCategoriesCopyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      logFirebaseEvent('createBudgetCategoriesCopy_ON_PAGE_LOAD');
      logFirebaseEvent('createBudgetCategoriesCopy_Backend-Call');

      final budgetsUpdateData = createBudgetsRecordData(
        uncategorizedLink: widget.uncategorized.reference,
      );
      await widget.createdBudget.reference.update(budgetsUpdateData);
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'createBudgetCategoriesCopy'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BudgetCategoriesRecord>>(
      stream: queryBudgetCategoriesRecord(
        queryBuilder: (budgetCategoriesRecord) => budgetCategoriesRecord
            .where('categoryBudget', isEqualTo: widget.createdBudget.reference),
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
            createBudgetCategoriesCopyBudgetCategoriesRecordList =
            snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
            automaticallyImplyLeading: true,
            title: Text(
              'Create Budget Categories',
              style: FlutterFlowTheme.of(context).title3,
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
              child: StreamBuilder<List<BudgetsRecord>>(
                stream: queryBudgetsRecord(
                  queryBuilder: (budgetsRecord) => budgetsRecord
                      .where('budgetOwner', isEqualTo: currentUserReference)
                      .where('budgetID',
                          isEqualTo: widget.createdBudget.budgetID),
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
                  List<BudgetsRecord> columnBudgetsRecordList = snapshot.data;
                  final columnBudgetsRecord = columnBudgetsRecordList.isNotEmpty
                      ? columnBudgetsRecordList.first
                      : null;
                  return SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 100,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          'Remaining (Unallocated):',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        functions.formatBudgetCurrency(
                                            functions.calculateRemBudgetCat(
                                                createBudgetCategoriesCopyBudgetCategoriesRecordList
                                                    .toList(),
                                                columnBudgetsRecord)),
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Source Sans Pro',
                                              color: Color(0xFFFF0003),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 10, 0),
                                        child: Container(
                                          width: 100,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Text(
                                            'Start: ${dateTimeFormat('MMMEd', columnBudgetsRecord.budgetStart)}',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 50,
                                      icon: Icon(
                                        Icons.do_disturb_on_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 24,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent('IconButton_ON_TAP');
                                        // Action_BudgetAmountMinus
                                        logFirebaseEvent(
                                            'IconButton_Action_BudgetAmountMinus');

                                        final budgetsUpdateData = {
                                          'budgetAmount':
                                              FieldValue.increment(-100000),
                                        };
                                        await widget.createdBudget.reference
                                            .update(budgetsUpdateData);
                                      },
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent('Container_ON_TAP');
                                        // Action_EditBudgetAmount
                                        logFirebaseEvent(
                                            'Container_Action_EditBudgetAmount');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: EditBudgetAmountWidget(
                                                budget: columnBudgetsRecord,
                                                categoryTotal: functions
                                                    .sumCategoryAmounts(
                                                        createBudgetCategoriesCopyBudgetCategoriesRecordList
                                                            .toList()),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: 36,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Text(
                                          functions.formatBudgetCurrency(
                                              columnBudgetsRecord.budgetAmount),
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 50,
                                      icon: Icon(
                                        Icons.add_circle_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 24,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent('IconButton_ON_TAP');
                                        // Action_BudgetAmountPlus
                                        logFirebaseEvent(
                                            'IconButton_Action_BudgetAmountPlus');

                                        final budgetsUpdateData = {
                                          'budgetAmount':
                                              FieldValue.increment(100000),
                                        };
                                        await widget.createdBudget.reference
                                            .update(budgetsUpdateData);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Select from default options (Scroll)',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: StreamBuilder<
                                        List<ConstBudgetCategoriesRecord>>(
                                      stream: queryConstBudgetCategoriesRecord(
                                        queryBuilder: (constBudgetCategoriesRecord) =>
                                            constBudgetCategoriesRecord
                                                .where('categoryName',
                                                    whereNotIn:
                                                        createBudgetCategoriesCopyBudgetCategoriesRecordList
                                                            .map((e) =>
                                                                e.categoryName)
                                                            .toList())
                                                .orderBy('categoryName'),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ConstBudgetCategoriesRecord>
                                            gridViewConstBudgetCategoriesRecordList =
                                            snapshot.data;
                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            childAspectRatio: 1,
                                          ),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              gridViewConstBudgetCategoriesRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, gridViewIndex) {
                                            final gridViewConstBudgetCategoriesRecord =
                                                gridViewConstBudgetCategoriesRecordList[
                                                    gridViewIndex];
                                            return Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'Column_ON_TAP');
                                                  // Action_BSCreateConstCategory
                                                  logFirebaseEvent(
                                                      'Column_Action_BSCreateConstCategory');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child:
                                                            CreateConstCategoryWidget(
                                                          constCategory:
                                                              gridViewConstBudgetCategoriesRecord,
                                                          budget:
                                                              columnBudgetsRecord,
                                                          budgetAllocatedRemaining:
                                                              functions.calculateRemBudgetCat(
                                                                  createBudgetCategoriesCopyBudgetCategoriesRecordList
                                                                      .toList(),
                                                                  columnBudgetsRecord),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 20),
                                                      child: Icon(
                                                        Icons.add_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 36,
                                                      ),
                                                    ),
                                                    AutoSizeText(
                                                      gridViewConstBudgetCategoriesRecord
                                                          .categoryName,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Source Sans Pro',
                                                                fontSize: 12,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: Text(
                                        'Or create a custom cateogory',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent('Button_ON_TAP');
                                        // Action_BSCreateCustomCategory
                                        logFirebaseEvent(
                                            'Button_Action_BSCreateCustomCategory');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: CreateCustomCategoryWidget(
                                                budget: columnBudgetsRecord,
                                                budgetRemaining: functions
                                                    .calculateRemBudgetCat(
                                                        createBudgetCategoriesCopyBudgetCategoriesRecordList
                                                            .toList(),
                                                        columnBudgetsRecord),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      text: 'Custom',
                                      icon: Icon(
                                        Icons.add_rounded,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 60,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Source Sans Pro',
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: StreamBuilder<
                                        List<BudgetCategoriesRecord>>(
                                      stream: queryBudgetCategoriesRecord(
                                        queryBuilder:
                                            (budgetCategoriesRecord) =>
                                                budgetCategoriesRecord.where(
                                                    'categoryBudget',
                                                    isEqualTo: widget
                                                        .createdBudget
                                                        .reference),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        List<BudgetCategoriesRecord>
                                            columnBudgetCategoriesRecordList =
                                            snapshot.data;
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                columnBudgetCategoriesRecordList
                                                    .length, (columnIndex) {
                                              final columnBudgetCategoriesRecord =
                                                  columnBudgetCategoriesRecordList[
                                                      columnIndex];
                                              return Visibility(
                                                visible:
                                                    (columnBudgetCategoriesRecord
                                                            .categoryName) !=
                                                        'Uncategorized',
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(16,
                                                                      0, 0, 0),
                                                          child: Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 36,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1, 0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                child:
                                                                    AutoSizeText(
                                                                  columnBudgetCategoriesRecord
                                                                      .categoryName,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 75,
                                                        height: 36,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          functions.formatBudgetCurrency(
                                                              columnBudgetCategoriesRecord
                                                                  .allocatedAmount),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      if ((columnBudgetCategoriesRecord
                                                              .categoryName) !=
                                                          'Uncategorized')
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30,
                                                          borderWidth: 1,
                                                          buttonSize: 60,
                                                          icon: Icon(
                                                            Icons.edit_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'IconButton_ON_TAP');
                                                            // Action_BSEditCateogoryAmt
                                                            logFirebaseEvent(
                                                                'IconButton_Action_BSEditCateogoryAmt');
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
                                                                        columnBudgetsRecord,
                                                                    categoryToEdit:
                                                                        columnBudgetCategoriesRecord,
                                                                    budgetRemaining: functions.calculateRemBudgetCat(
                                                                        createBudgetCategoriesCopyBudgetCategoriesRecordList
                                                                            .toList(),
                                                                        columnBudgetsRecord),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      if ((columnBudgetCategoriesRecord
                                                              .categoryName) !=
                                                          'Uncategorized')
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30,
                                                          borderWidth: 1,
                                                          buttonSize: 60,
                                                          icon: Icon(
                                                            Icons
                                                                .delete_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'IconButton_ON_TAP');
                                                            // Action_DeleteCategory
                                                            logFirebaseEvent(
                                                                'IconButton_Action_DeleteCategory');
                                                            await columnBudgetCategoriesRecord
                                                                .reference
                                                                .delete();
                                                          },
                                                        ),
                                                    ],
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
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 16, 0, 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    StreamBuilder<List<BudgetCategoriesRecord>>(
                                      stream: queryBudgetCategoriesRecord(
                                        queryBuilder: (budgetCategoriesRecord) =>
                                            budgetCategoriesRecord
                                                .where('budgetOwner',
                                                    isEqualTo:
                                                        currentUserReference)
                                                .where('categoryBudget',
                                                    isEqualTo: widget
                                                        .createdBudget
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        List<BudgetCategoriesRecord>
                                            buttonBudgetCategoriesRecordList =
                                            snapshot.data;
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent('Button_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_Alert-Dialog');
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Confirm Reset'),
                                                          content: Text(
                                                              'This will delete all categories'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Confirm'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              // Action_ResetCategories
                                              logFirebaseEvent(
                                                  'Button_Action_ResetCategories');
                                              await actions.deleteCategories(
                                                buttonBudgetCategoriesRecordList
                                                    .toList(),
                                              );
                                            } else {
                                              return;
                                            }
                                          },
                                          text: 'Reset',
                                          options: FFButtonOptions(
                                            width: 130,
                                            height: 60,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Source Sans Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius: 16,
                                          ),
                                        );
                                      },
                                    ),
                                    StreamBuilder<List<BudgetCategoriesRecord>>(
                                      stream: queryBudgetCategoriesRecord(
                                        queryBuilder: (budgetCategoriesRecord) =>
                                            budgetCategoriesRecord
                                                .where('budgetOwner',
                                                    isEqualTo:
                                                        currentUserReference)
                                                .where('categoryBudget',
                                                    isEqualTo: widget
                                                        .createdBudget
                                                        .reference)
                                                .where('categoryName',
                                                    isEqualTo: 'Uncategorized'),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        List<BudgetCategoriesRecord>
                                            buttonBudgetCategoriesRecordList =
                                            snapshot.data;
                                        // Return an empty Container when the document does not exist.
                                        if (snapshot.data.isEmpty) {
                                          return Container();
                                        }
                                        final buttonBudgetCategoriesRecord =
                                            buttonBudgetCategoriesRecordList
                                                    .isNotEmpty
                                                ? buttonBudgetCategoriesRecordList
                                                    .first
                                                : null;
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent('Button_ON_TAP');
                                            // Action_SaveEditBudget
                                            logFirebaseEvent(
                                                'Button_Action_SaveEditBudget');

                                            final budgetCategoriesUpdateData =
                                                createBudgetCategoriesRecordData(
                                              allocatedAmount: functions
                                                  .calculateRemBudgetCat(
                                                      createBudgetCategoriesCopyBudgetCategoriesRecordList
                                                          .toList(),
                                                      columnBudgetsRecord),
                                            );
                                            await buttonBudgetCategoriesRecord
                                                .reference
                                                .update(
                                                    budgetCategoriesUpdateData);
                                            logFirebaseEvent(
                                                'Button_Show-Snack-Bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Saved',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor: Colors.black,
                                              ),
                                            );
                                            logFirebaseEvent(
                                                'Button_Navigate-To');
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    NavBarPage(
                                                        initialPage:
                                                            'BudgetSingleCopy'),
                                              ),
                                            );
                                          },
                                          text: 'Save',
                                          options: FFButtonOptions(
                                            width: 130,
                                            height: 60,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle1
                                                    .override(
                                                      fontFamily:
                                                          'Source Sans Pro',
                                                      color: Colors.white,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius: 16,
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
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
