import '../allocate_budget/allocate_budget_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateBudgetWidget extends StatefulWidget {
  const CreateBudgetWidget({
    Key? key,
    this.budget,
  }) : super(key: key);

  final BudgetsRecord? budget;

  @override
  _CreateBudgetWidgetState createState() => _CreateBudgetWidgetState();
}

class _CreateBudgetWidgetState extends State<CreateBudgetWidget> {
  DateTimeRange? calendarSelectedDay;
  String? dropDownValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CreateBudget'});
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
            stream: BudgetsRecord.getDocument(widget.budget!.reference),
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
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 4),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 0, 0, 0),
                                                    child: Text(
                                                      'Amount',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom_widgets.CurrencyTextField(
                                              width: double.infinity,
                                              height: 55,
                                              amount:
                                                  widget.budget!.budgetAmount,
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 4),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 0, 0, 0),
                                                    child: Text(
                                                      'Duration',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Form(
                                              key: formKey,
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                options: [
                                                  'Weekly',
                                                  'Monthly',
                                                  'Daily'
                                                ],
                                                onChanged: (val) async {
                                                  setState(() =>
                                                      dropDownValue = val);
                                                  logFirebaseEvent(
                                                      'CREATE_BUDGET_DropDown_rx88a1oa_ON_FORM_');
                                                  if (dropDownValue ==
                                                      'Monthly') {
                                                    final budgetsUpdateData =
                                                        createBudgetsRecordData(
                                                      budgetStart:
                                                          calendarSelectedDay
                                                              ?.start,
                                                      isRecurring: true,
                                                      budgetDuration: 'Monthly',
                                                      duration: 30,
                                                      budgetEnd: functions
                                                          .addDaysToDate(
                                                              calendarSelectedDay
                                                                  ?.end,
                                                              30),
                                                      budgetSpent: 0,
                                                    );
                                                    await widget
                                                        .budget!.reference
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
                                                            'Weekly',
                                                        duration: 7,
                                                        budgetEnd: functions
                                                            .addDaysToDate(
                                                                calendarSelectedDay
                                                                    ?.end,
                                                                7),
                                                        budgetSpent: 0,
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
                                                              'Weekly',
                                                          duration: 1,
                                                          budgetEnd: functions
                                                              .addDaysToDate(
                                                                  calendarSelectedDay
                                                                      ?.end,
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
                                                          budgetDuration:
                                                              'Weekly',
                                                          duration: 7,
                                                          budgetEnd:
                                                              calendarSelectedDay
                                                                  ?.end,
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
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(12, 4, 12, 4),
                                                hidesUnderline: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
                                              initialDate: getCurrentTimestamp,
                                              rowHeight: 48,
                                              onChange: (DateTimeRange?
                                                  newSelectedDate) async {
                                                calendarSelectedDay =
                                                    newSelectedDate;
                                                logFirebaseEvent(
                                                    'CREATE_BUDGET_Calendar_xun9k9js_ON_DATE_');
                                                if (dropDownValue ==
                                                    'Monthly') {
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
                                                                ?.end,
                                                            30),
                                                    budgetSpent: 0,
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
                                                      budgetDuration: 'Weekly',
                                                      duration: 7,
                                                      budgetEnd: functions
                                                          .addDaysToDate(
                                                              calendarSelectedDay
                                                                  ?.end,
                                                              7),
                                                      budgetSpent: 0,
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
                                                            'Weekly',
                                                        duration: 1,
                                                        budgetEnd: functions
                                                            .addDaysToDate(
                                                                calendarSelectedDay
                                                                    ?.end,
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
                                                        budgetDuration:
                                                            'Weekly',
                                                        duration: 7,
                                                        budgetEnd:
                                                            calendarSelectedDay
                                                                ?.end,
                                                        budgetSpent: 0,
                                                      );
                                                      await widget
                                                          .budget!.reference
                                                          .update(
                                                              budgetsUpdateData);
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
                                                        fontSize: 12,
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
                                'CREATE_BUDGET_PAGE_CONTINUE_BTN_ON_TAP');
                            // Action_CreateBud
                            if (formKey.currentState == null ||
                                !formKey.currentState!.validate()) {
                              return;
                            }

                            if (dropDownValue == null) {
                              return;
                            }

                            if (dropDownValue == 'Monthly') {
                              final budgetsUpdateData = createBudgetsRecordData(
                                budgetAmount: FFAppState().currencyTextField,
                                budgetStart: calendarSelectedDay?.start,
                                isRecurring: true,
                                unallocatedAmount: functions.subInt(
                                    FFAppState().currencyTextField, 100000),
                                budgetDuration: 'Monthly',
                                status: 'active',
                                duration: 30,
                                budgetEnd: functions.addDaysToDate(
                                    calendarSelectedDay?.end, 30),
                                budgetOwner: currentUserReference,
                                budgetSpent: 0,
                              );
                              await widget.budget!.reference
                                  .update(budgetsUpdateData);
                            } else {
                              if (dropDownValue == 'Weekly') {
                                final budgetsUpdateData =
                                    createBudgetsRecordData(
                                  budgetAmount: FFAppState().currencyTextField,
                                  budgetStart: calendarSelectedDay?.start,
                                  isRecurring: true,
                                  unallocatedAmount: functions.subInt(
                                      FFAppState().currencyTextField, 100000),
                                  budgetDuration: 'Weekly',
                                  status: 'active',
                                  duration: 7,
                                  budgetEnd: functions.addDaysToDate(
                                      calendarSelectedDay?.end, 7),
                                  budgetOwner: currentUserReference,
                                  budgetSpent: 0,
                                );
                                await widget.budget!.reference
                                    .update(budgetsUpdateData);
                              } else {
                                if (dropDownValue == 'Daily') {
                                  final budgetsUpdateData =
                                      createBudgetsRecordData(
                                    budgetAmount:
                                        FFAppState().currencyTextField,
                                    budgetStart: calendarSelectedDay?.start,
                                    isRecurring: true,
                                    unallocatedAmount: functions.subInt(
                                        FFAppState().currencyTextField, 100000),
                                    budgetDuration: 'Daily',
                                    status: 'active',
                                    duration: 1,
                                    budgetEnd: functions.addDaysToDate(
                                        calendarSelectedDay?.end, 1),
                                    budgetOwner: currentUserReference,
                                    budgetSpent: 0,
                                  );
                                  await widget.budget!.reference
                                      .update(budgetsUpdateData);
                                } else {
                                  return;
                                }
                              }
                            }

                            final usersUpdateData = createUsersRecordData(
                              activeBudget: widget.budget!.reference,
                            );
                            await currentUserReference!.update(usersUpdateData);

                            final categoriesCreateData =
                                createCategoriesRecordData(
                              categoryName: 'Bank Charges',
                              categoryId: random_data.randomString(
                                24,
                                24,
                                true,
                                true,
                                true,
                              ),
                              categoryBudget: widget.budget!.reference,
                              categoryOwner: currentUserReference,
                              categoryAmount: 100000,
                              spentAmount: 0,
                              createdDate: getCurrentTimestamp,
                            );
                            await CategoriesRecord.createDoc(
                                    widget.budget!.reference)
                                .set(categoriesCreateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllocateBudgetWidget(
                                  createdBudget: widget.budget,
                                ),
                              ),
                            );
                          },
                          text: 'Continue',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .subtitle2Family,
                                  color: Colors.white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .subtitle2Family),
                                ),
                            elevation: 2,
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
