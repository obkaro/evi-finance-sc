import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/create_const_category_widget.dart';
import '../components/create_custom_category_widget.dart';
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

class EditBudgetCategoriesWidget extends StatefulWidget {
  const EditBudgetCategoriesWidget({
    Key key,
    this.createdBudget,
    this.uncategorized,
  }) : super(key: key);

  final BudgetsRecord createdBudget;
  final BudgetCategoriesRecord uncategorized;

  @override
  _EditBudgetCategoriesWidgetState createState() =>
      _EditBudgetCategoriesWidgetState();
}

class _EditBudgetCategoriesWidgetState
    extends State<EditBudgetCategoriesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final budgetCategoriesUpdateData = createBudgetCategoriesRecordData(
        allocatedAmount: 0,
      );
      await widget.uncategorized.reference.update(budgetCategoriesUpdateData);
    });
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
            editBudgetCategoriesBudgetCategoriesRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NavBarPage(initialPage: 'Budgets'),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Text(
                    'Select Categories',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: 22,
                        ),
                  ),
                ),
              ],
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: StreamBuilder<List<BudgetsRecord>>(
                stream: queryBudgetsRecord(
                  queryBuilder: (budgetsRecord) => budgetsRecord
                      .where('budgetOwner', isEqualTo: currentUserReference)
                      .where('budgetName',
                          isEqualTo: widget.createdBudget.budgetName)
                      .where('budgetDescription',
                          isEqualTo: widget.createdBudget.budgetDescription)
                      .where('budgetDateCreated',
                          isEqualTo: widget.createdBudget.budgetDateCreated),
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
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  alignment: AlignmentDirectional(1, 1),
                                  child: Text(
                                    'Remaining (Uncategorized):',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                alignment: AlignmentDirectional(0, 1),
                                child: Text(
                                  functions.calcRemCatCurrency(
                                      editBudgetCategoriesBudgetCategoriesRecordList
                                          .toList(),
                                      columnBudgetsRecord),
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Roboto',
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      widget.createdBudget.budgetName,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 24,
                                ),
                                onPressed: () async {
                                  final budgetsUpdateData = {
                                    'budgetAmount': FieldValue.increment(-1000),
                                  };
                                  await widget.createdBudget.reference
                                      .update(budgetsUpdateData);
                                },
                              ),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Text(
                                  functions.formatBudgetCurrency(
                                      columnBudgetsRecord.budgetAmount),
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 50,
                                icon: Icon(
                                  Icons.add_circle_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 24,
                                ),
                                onPressed: () async {
                                  final budgetsUpdateData = {
                                    'budgetAmount': FieldValue.increment(1000),
                                  };
                                  await widget.createdBudget.reference
                                      .update(budgetsUpdateData);
                                },
                              ),
                            ],
                          ),
                          Divider(),
                        ],
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Select from options',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
                                      .secondaryBackground,
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
                                                      editBudgetCategoriesBudgetCategoriesRecordList
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
                                        itemBuilder: (context, gridViewIndex) {
                                          final gridViewConstBudgetCategoriesRecord =
                                              gridViewConstBudgetCategoriesRecordList[
                                                  gridViewIndex];
                                          return Material(
                                            color: Colors.transparent,
                                            elevation: 0.5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  width: 0.1,
                                                ),
                                              ),
                                              child: InkWell(
                                                onTap: () async {
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
                                                          budget: widget
                                                              .createdBudget,
                                                          budgetAllocatedRemaining:
                                                              functions.calculateRemBudgetCat(
                                                                  editBudgetCategoriesBudgetCategoriesRecordList
                                                                      .toList(),
                                                                  widget
                                                                      .createdBudget),
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
                                                                    'Roboto',
                                                                fontSize: 12,
                                                              ),
                                                    ),
                                                  ],
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
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 0),
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
                                            child: CreateCustomCategoryWidget(
                                              budget: widget.createdBudget,
                                              budgetRemaining: functions
                                                  .calculateRemBudgetCat(
                                                      editBudgetCategoriesBudgetCategoriesRecordList
                                                          .toList(),
                                                      widget.createdBudget),
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
                                      height: 50,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child:
                                  StreamBuilder<List<BudgetCategoriesRecord>>(
                                stream: queryBudgetCategoriesRecord(
                                  queryBuilder: (budgetCategoriesRecord) =>
                                      budgetCategoriesRecord.where(
                                          'categoryBudget',
                                          isEqualTo:
                                              widget.createdBudget.reference),
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
                                          visible: (columnBudgetCategoriesRecord
                                                  .categoryName) !=
                                              'Uncategorized',
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 36,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    10, 0),
                                                        child: AutoSizeText(
                                                          columnBudgetCategoriesRecord
                                                              .categoryName,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 75,
                                                  height: 36,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    functions.formatBudgetCurrency(
                                                        columnBudgetCategoriesRecord
                                                            .allocatedAmount),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                                if ((columnBudgetCategoriesRecord
                                                        .categoryName) !=
                                                    'Uncategorized')
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 60,
                                                    icon: Icon(
                                                      Icons.edit_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24,
                                                    ),
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child:
                                                                EditCategoryWidget(
                                                              budget: widget
                                                                  .createdBudget,
                                                              categoryToEdit:
                                                                  columnBudgetCategoriesRecord,
                                                              budgetRemaining: functions
                                                                  .calculateRemBudgetCat(
                                                                      editBudgetCategoriesBudgetCategoriesRecordList
                                                                          .toList(),
                                                                      widget
                                                                          .createdBudget),
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
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 60,
                                                    icon: Icon(
                                                      Icons.delete_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24,
                                                    ),
                                                    onPressed: () async {
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
                                                                        'This cannot be undone'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'Cancel'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
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
                                                        await columnBudgetCategoriesRecord
                                                            .reference
                                                            .delete();
                                                      } else {
                                                        return;
                                                      }
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
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
                                                      .createdBudget.reference)
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
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                                Text('Confirm'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
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
                                          height: 50,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: Color(0xFF5D5B5B),
                                                  ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
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
                                                      .createdBudget.reference)
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
                                          final budgetCategoriesUpdateData =
                                              createBudgetCategoriesRecordData(
                                            allocatedAmount:
                                                functions.calculateRemBudgetCat(
                                                    editBudgetCategoriesBudgetCategoriesRecordList
                                                        .toList(),
                                                    widget.createdBudget),
                                          );
                                          await buttonBudgetCategoriesRecord
                                              .reference
                                              .update(
                                                  budgetCategoriesUpdateData);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Saved',
                                                style: TextStyle(
                                                  color: Color(0xFFDBDBDB),
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor: Colors.black,
                                            ),
                                          );
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => NavBarPage(
                                                  initialPage: 'Budgets'),
                                            ),
                                          );
                                        },
                                        text: 'Save',
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 50,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: Colors.white,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
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
