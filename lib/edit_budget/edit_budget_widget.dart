import '../allocate_budget/allocate_budget_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/dialog_box_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EditBudgetWidget extends StatefulWidget {
  const EditBudgetWidget({
    Key? key,
    this.budget,
  }) : super(key: key);

  final BudgetsRecord? budget;

  @override
  _EditBudgetWidgetState createState() => _EditBudgetWidgetState();
}

class _EditBudgetWidgetState extends State<EditBudgetWidget> {
  DateTimeRange? calendarSelectedDay;
  String? dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'EditBudget'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).secondaryPrimary),
        automaticallyImplyLeading: true,
        title: Text(
          'Budget Setup',
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: StreamBuilder<BudgetsRecord>(
            stream: BudgetsRecord.getDocument(widget.budget!.reference),
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
              final columnBudgetsRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 4),
                                                child: Text(
                                                  'Amount',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          custom_widgets.CurrencyTextField(
                                            width: double.infinity,
                                            height: 55,
                                            amount: widget.budget!.budgetAmount,
                                            labelText: 'Amount',
                                            hintText: 'Enter amount',
                                            bgcolor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 4),
                                                child: Text(
                                                  'Duration',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          FlutterFlowDropDown(
                                            initialOption: dropDownValue ??=
                                                columnBudgetsRecord
                                                    .budgetDuration,
                                            options: [
                                              'Weekly',
                                              'Monthly',
                                              'Daily'
                                            ],
                                            onChanged: (val) async {
                                              setState(
                                                  () => dropDownValue = val);
                                              if (dropDownValue == 'Monthly') {
                                                final budgetsUpdateData =
                                                    createBudgetsRecordData(
                                                  budgetStart:
                                                      calendarSelectedDay
                                                          ?.start,
                                                  isRecurring: true,
                                                  budgetDuration: 'Monthly',
                                                  duration: 30,
                                                  budgetEnd:
                                                      functions.addDaysToDate(
                                                          calendarSelectedDay
                                                              ?.start,
                                                          30),
                                                  budgetSpent: 0,
                                                );
                                                await widget.budget!.reference
                                                    .update(budgetsUpdateData);
                                              } else {
                                                if (dropDownValue == 'Weekly') {
                                                  final budgetsUpdateData =
                                                      createBudgetsRecordData(
                                                    budgetStart:
                                                        calendarSelectedDay
                                                            ?.start,
                                                    isRecurring: true,
                                                    budgetDuration: 'Weekly',
                                                    duration: 7,
                                                    budgetEnd:
                                                        functions.addDaysToDate(
                                                            calendarSelectedDay
                                                                ?.start,
                                                            7),
                                                    budgetSpent: 0,
                                                  );
                                                  await widget.budget!.reference
                                                      .update(
                                                          budgetsUpdateData);
                                                } else {
                                                  if (dropDownValue ==
                                                      'Daily') {
                                                    final budgetsUpdateData =
                                                        createBudgetsRecordData(
                                                      budgetStart:
                                                          calendarSelectedDay
                                                              ?.start,
                                                      isRecurring: true,
                                                      budgetDuration: 'Weekly',
                                                      duration: 1,
                                                      budgetEnd: functions
                                                          .addDaysToDate(
                                                              calendarSelectedDay
                                                                  ?.start,
                                                              1),
                                                      budgetSpent: 0,
                                                    );
                                                    await widget
                                                        .budget!.reference
                                                        .update(
                                                            budgetsUpdateData);
                                                  } else {
                                                    final budgetsUpdateData =
                                                        createBudgetsRecordData(
                                                      budgetStart:
                                                          calendarSelectedDay
                                                              ?.start,
                                                      isRecurring: true,
                                                      budgetDuration: 'Weekly',
                                                      duration: 7,
                                                      budgetEnd:
                                                          calendarSelectedDay
                                                              ?.start,
                                                      budgetSpent: 0,
                                                    );
                                                    await widget
                                                        .budget!.reference
                                                        .update(
                                                            budgetsUpdateData);
                                                  }
                                                }
                                              }
                                            },
                                            width: double.infinity,
                                            height: 55,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1,
                                            hintText: 'Please select...',
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0,
                                            borderRadius: 12,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 4, 12, 4),
                                            hidesUnderline: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(32),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 10, 16, 16),
                                            child: FlutterFlowCalendar(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              weekFormat: false,
                                              weekStartsMonday: false,
                                              initialDate:
                                                  widget.budget!.budgetStart,
                                              rowHeight: 48,
                                              onChange: (DateTimeRange?
                                                  newSelectedDate) async {
                                                calendarSelectedDay =
                                                    newSelectedDate;
                                                if (dropDownValue ==
                                                    'Monthly') {
                                                  final budgetsUpdateData =
                                                      createBudgetsRecordData(
                                                    budgetStart:
                                                        calendarSelectedDay
                                                            ?.start,
                                                    isRecurring: true,
                                                    budgetDuration:
                                                        dropDownValue,
                                                    duration: 30,
                                                    budgetEnd:
                                                        functions.addDaysToDate(
                                                            calendarSelectedDay
                                                                ?.start,
                                                            30),
                                                  );
                                                  await widget.budget!.reference
                                                      .update(
                                                          budgetsUpdateData);
                                                } else {
                                                  if (dropDownValue ==
                                                      'Weekly') {
                                                    final budgetsUpdateData =
                                                        createBudgetsRecordData(
                                                      budgetStart:
                                                          calendarSelectedDay
                                                              ?.start,
                                                      isRecurring: true,
                                                      budgetDuration:
                                                          dropDownValue,
                                                      duration: 7,
                                                      budgetEnd: functions
                                                          .addDaysToDate(
                                                              calendarSelectedDay
                                                                  ?.start,
                                                              7),
                                                    );
                                                    await widget
                                                        .budget!.reference
                                                        .update(
                                                            budgetsUpdateData);
                                                  } else {
                                                    if (dropDownValue ==
                                                        'Daily') {
                                                      final budgetsUpdateData =
                                                          createBudgetsRecordData(
                                                        budgetStart:
                                                            calendarSelectedDay
                                                                ?.start,
                                                        isRecurring: true,
                                                        budgetDuration:
                                                            dropDownValue,
                                                        duration: 30,
                                                        budgetEnd: functions
                                                            .addDaysToDate(
                                                                calendarSelectedDay
                                                                    ?.start,
                                                                1),
                                                      );
                                                      await widget
                                                          .budget!.reference
                                                          .update(
                                                              budgetsUpdateData);
                                                    } else {
                                                      return;
                                                    }
                                                  }
                                                }

                                                setState(() {});
                                              },
                                              titleStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family),
                                                      ),
                                              dayOfWeekStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2Family),
                                                      ),
                                              dateStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2Family,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2Family),
                                                      ),
                                              selectedDateStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color: Colors.white,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                              inactiveDateStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .fadedDivider,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2Family),
                                                      ),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (columnBudgetsRecord.budgetStart != null)
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${dateTimeFormat(
                                      'MMMEd',
                                      columnBudgetsRecord.budgetStart,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )} - ${dateTimeFormat(
                                      'MMMEd',
                                      columnBudgetsRecord.budgetEnd,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )}',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllocateBudgetWidget(
                                  createdBudget: columnBudgetsRecord,
                                ),
                              ),
                            );
                          },
                          text: 'Edit Categories',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                            elevation: 0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                        child: StreamBuilder<List<CategoriesRecord>>(
                          stream: queryCategoriesRecord(
                            parent: columnBudgetsRecord.reference,
                            queryBuilder: (categoriesRecord) =>
                                categoriesRecord.where('category_name',
                                    isNotEqualTo: 'Unallocated'),
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
                            List<CategoriesRecord> buttonCategoriesRecordList =
                                snapshot.data!;
                            return FFButtonWidget(
                              onPressed: () async {
                                if (FFAppState().currencyTextField >=
                                    functions.sumCategoryAmounts(
                                        buttonCategoriesRecordList.toList())) {
                                  if (dropDownValue == 'Monthly') {
                                    // Action_CreateBudgetStep1

                                    final budgetsUpdateData =
                                        createBudgetsRecordData(
                                      budgetAmount:
                                          FFAppState().currencyTextField,
                                      budgetDuration: dropDownValue,
                                      unallocatedAmount: functions.subInt(
                                          FFAppState().currencyTextField,
                                          functions.sumCategoryAmounts(
                                              buttonCategoriesRecordList
                                                  .toList())),
                                      budgetStart: calendarSelectedDay?.start,
                                      duration: 30,
                                      budgetEnd: functions.addDaysToDate(
                                          calendarSelectedDay?.start, 30),
                                    );
                                    await widget.budget!.reference
                                        .update(budgetsUpdateData);
                                  } else {
                                    if (dropDownValue == 'Weekly') {
                                      // Action_CreateBudgetStep1

                                      final budgetsUpdateData =
                                          createBudgetsRecordData(
                                        budgetAmount:
                                            FFAppState().currencyTextField,
                                        budgetDuration: dropDownValue,
                                        unallocatedAmount: functions.subInt(
                                            FFAppState().currencyTextField,
                                            functions.sumCategoryAmounts(
                                                buttonCategoriesRecordList
                                                    .toList())),
                                        budgetStart: calendarSelectedDay?.start,
                                        duration: 7,
                                        budgetEnd: functions.addDaysToDate(
                                            calendarSelectedDay?.start, 7),
                                      );
                                      await widget.budget!.reference
                                          .update(budgetsUpdateData);
                                    } else {
                                      if (dropDownValue == 'Daily') {
                                        // Action_CreateBudgetStep1

                                        final budgetsUpdateData =
                                            createBudgetsRecordData(
                                          budgetAmount:
                                              FFAppState().currencyTextField,
                                          budgetDuration: dropDownValue,
                                          unallocatedAmount: functions.subInt(
                                              FFAppState().currencyTextField,
                                              functions.sumCategoryAmounts(
                                                  buttonCategoriesRecordList
                                                      .toList())),
                                          budgetStart:
                                              calendarSelectedDay?.start,
                                          duration: 1,
                                          budgetEnd: functions.addDaysToDate(
                                              calendarSelectedDay?.start, 1),
                                        );
                                        await widget.budget!.reference
                                            .update(budgetsUpdateData);
                                      } else {
                                        return;
                                      }
                                    }
                                  }

                                  Navigator.pop(context);
                                } else {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: DialogBoxWidget(
                                          heading: 'Invalid entry',
                                          body:
                                              'Budget amount should be greater than the sum of existing categories within it.',
                                          buttonYes: 'Got it',
                                          buttonNo: 'c',
                                          information: true,
                                          yesAction: () async {},
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                }
                              },
                              text: 'Save',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 60,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle2Family,
                                      color: Colors.white,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2Family),
                                    ),
                                elevation: 2,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
