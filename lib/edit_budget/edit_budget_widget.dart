import '../allocate_budget/allocate_budget_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/dialog_box_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EditBudgetWidget extends StatefulWidget {
  const EditBudgetWidget({
    Key? key,
    this.budgetRef,
  }) : super(key: key);

  final DocumentReference? budgetRef;

  @override
  _EditBudgetWidgetState createState() => _EditBudgetWidgetState();
}

class _EditBudgetWidgetState extends State<EditBudgetWidget> {
  DateTimeRange? calendarSelectedDay;
  String? dropDownValue;
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'EditBudget'});
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
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
            stream: BudgetsRecord.getDocument(widget.budgetRef!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 42,
                    height: 42,
                    child: SpinKitChasingDots(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 42,
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
                                          TextFormField(
                                            controller: textController ??=
                                                TextEditingController(
                                              text: columnBudgetsRecord
                                                  .budgetAmount
                                                  ?.toString(),
                                            ),
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              'textController',
                                              Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Amount',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFFF0000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFFF0000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(12, 12, 12, 12),
                                              suffixIcon: textController!
                                                      .text.isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        textController?.clear();
                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            Color(0xFF757575),
                                                        size: 16,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                                  lineHeight: 2.8,
                                                ),
                                            maxLines: null,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              MaskTextInputFormatter(
                                                  mask: '₦ ###,###,###.##')
                                            ],
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
                                          FlutterFlowDropDown<String>(
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
                                              logFirebaseEvent(
                                                  'EDIT_BUDGET_DropDown_esyzqg1i_ON_FORM_WI');
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
                                                await columnBudgetsRecord
                                                    .reference
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
                                                  await columnBudgetsRecord
                                                      .reference
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
                                                    await columnBudgetsRecord
                                                        .reference
                                                        .update(
                                                            budgetsUpdateData);
                                                  } else {
                                                    return;
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
                                              initialDate: columnBudgetsRecord
                                                  .budgetStart,
                                              rowHeight: 48,
                                              onChange: (DateTimeRange?
                                                  newSelectedDate) async {
                                                calendarSelectedDay =
                                                    newSelectedDate;
                                                logFirebaseEvent(
                                                    'EDIT_BUDGET_Calendar_oih23j9r_ON_DATE_SE');
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
                                                  await columnBudgetsRecord
                                                      .reference
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
                                                    await columnBudgetsRecord
                                                        .reference
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
                                                      await columnBudgetsRecord
                                                          .reference
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
                            logFirebaseEvent(
                                'EDIT_BUDGET_EDIT_CATEGORIES_BTN_ON_TAP');
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
                          icon: Icon(
                            Icons.edit_rounded,
                            size: 12,
                          ),
                          options: FFButtonOptions(
                            height: 36,
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
                              color: Colors.transparent,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          showLoadingIndicator: false,
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
                                  width: 42,
                                  height: 42,
                                  child: SpinKitChasingDots(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 42,
                                  ),
                                ),
                              );
                            }
                            List<CategoriesRecord> buttonCategoriesRecordList =
                                snapshot.data!;
                            return FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'EDIT_BUDGET_PAGE_SAVE_BTN_ON_TAP');
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
                                    await columnBudgetsRecord.reference
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
                                      await columnBudgetsRecord.reference
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
                                        await columnBudgetsRecord.reference
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
