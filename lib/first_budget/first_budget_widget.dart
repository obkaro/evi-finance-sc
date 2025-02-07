import '../allocate_budget/allocate_budget_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/create_first_budget_widget.dart';
import '../components/dialog_box_widget.dart';
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
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'first_budget_model.dart';
export 'first_budget_model.dart';

class FirstBudgetWidget extends StatefulWidget {
  const FirstBudgetWidget({
    Key? key,
    this.budget,
  }) : super(key: key);

  final BudgetsRecord? budget;

  @override
  _FirstBudgetWidgetState createState() => _FirstBudgetWidgetState();
}

class _FirstBudgetWidgetState extends State<FirstBudgetWidget> {
  late FirstBudgetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FirstBudgetModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'FirstBudget'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: CreateFirstBudgetWidget(),
          );
        },
      ).then((value) => setState(() {}));
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
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
        automaticallyImplyLeading: false,
        title: Text(
          'Your first budget',
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
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: StreamBuilder<BudgetsRecord>(
            stream: BudgetsRecord.getDocument(widget.budget!.reference),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 36,
                    height: 36,
                    child: SpinKitThreeBounce(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 36,
                    ),
                  ),
                );
              }
              final columnBudgetsRecord = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Text(
                                    'How do you plan to track your money?',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: FlutterFlowDropDown<String>(
                                options: ['Weekly', 'Monthly'],
                                onChanged: (val) async {
                                  setState(() => _model.dropDownValue = val);
                                  if (_model.dropDownValue == 'Monthly') {
                                    final budgetsUpdateData1 =
                                        createBudgetsRecordData(
                                      budgetStart:
                                          _model.calendarSelectedDay?.start,
                                      isRecurring: true,
                                      budgetDuration: _model.dropDownValue,
                                      duration: 30,
                                      budgetEnd: functions.addDaysToDate(
                                          _model.calendarSelectedDay?.start,
                                          30),
                                    );
                                    await widget.budget!.reference
                                        .update(budgetsUpdateData1);
                                  } else {
                                    if (_model.dropDownValue == 'Weekly') {
                                      final budgetsUpdateData2 =
                                          createBudgetsRecordData(
                                        budgetStart:
                                            _model.calendarSelectedDay?.start,
                                        isRecurring: true,
                                        budgetDuration: _model.dropDownValue,
                                        duration: 7,
                                        budgetEnd: functions.addDaysToDate(
                                            _model.calendarSelectedDay?.start,
                                            7),
                                      );
                                      await widget.budget!.reference
                                          .update(budgetsUpdateData2);
                                    } else {
                                      if (_model.dropDownValue == 'Daily') {
                                        final budgetsUpdateData3 =
                                            createBudgetsRecordData(
                                          budgetStart:
                                              _model.calendarSelectedDay?.start,
                                          isRecurring: true,
                                          budgetDuration: _model.dropDownValue,
                                          duration: 30,
                                          budgetEnd: functions.addDaysToDate(
                                              _model.calendarSelectedDay?.start,
                                              1),
                                        );
                                        await widget.budget!.reference
                                            .update(budgetsUpdateData3);
                                      } else {
                                        return;
                                      }
                                    }
                                  }
                                },
                                width: double.infinity,
                                height: 55,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                                hintText: 'Please select...',
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2,
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                borderRadius: 12,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Wrap(
                                    spacing: 0,
                                    runSpacing: 0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 0, 0),
                                        child: Text(
                                          'How much do you plan to spend within your budget period?',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: custom_widgets.CurrencyTextField(
                              width: MediaQuery.of(context).size.width,
                              height: 55,
                              amount: 0,
                              labelText: 'Amount',
                              hintText: 'Enter amount',
                              bgcolor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 4, 0, 4),
                                        child: Text(
                                          'When would you like your budget to begin?',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        ),
                                      ),
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            weekFormat: false,
                                            weekStartsMonday: false,
                                            initialDate: getCurrentTimestamp,
                                            rowHeight: 40,
                                            onChange: (DateTimeRange?
                                                newSelectedDate) async {
                                              _model.calendarSelectedDay =
                                                  newSelectedDate;
                                              if (_model.dropDownValue ==
                                                  'Monthly') {
                                                final budgetsUpdateData1 =
                                                    createBudgetsRecordData(
                                                  budgetStart: _model
                                                      .calendarSelectedDay
                                                      ?.start,
                                                  isRecurring: true,
                                                  budgetDuration:
                                                      _model.dropDownValue,
                                                  duration: 30,
                                                  budgetEnd:
                                                      functions.addDaysToDate(
                                                          _model
                                                              .calendarSelectedDay
                                                              ?.start,
                                                          30),
                                                );
                                                await widget.budget!.reference
                                                    .update(budgetsUpdateData1);
                                              } else {
                                                if (_model.dropDownValue ==
                                                    'Weekly') {
                                                  final budgetsUpdateData2 =
                                                      createBudgetsRecordData(
                                                    budgetStart: _model
                                                        .calendarSelectedDay
                                                        ?.start,
                                                    isRecurring: true,
                                                    budgetDuration:
                                                        _model.dropDownValue,
                                                    duration: 7,
                                                    budgetEnd:
                                                        functions.addDaysToDate(
                                                            _model
                                                                .calendarSelectedDay
                                                                ?.start,
                                                            7),
                                                  );
                                                  await widget.budget!.reference
                                                      .update(
                                                          budgetsUpdateData2);
                                                } else {
                                                  if (_model.dropDownValue ==
                                                      'Daily') {
                                                    final budgetsUpdateData3 =
                                                        createBudgetsRecordData(
                                                      budgetStart: _model
                                                          .calendarSelectedDay
                                                          ?.start,
                                                      isRecurring: true,
                                                      budgetDuration:
                                                          _model.dropDownValue,
                                                      duration: 30,
                                                      budgetEnd: functions
                                                          .addDaysToDate(
                                                              _model
                                                                  .calendarSelectedDay
                                                                  ?.start,
                                                              1),
                                                    );
                                                    await widget
                                                        .budget!.reference
                                                        .update(
                                                            budgetsUpdateData3);
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
                                            locale: FFLocalizations.of(context)
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
                                  style: FlutterFlowTheme.of(context).subtitle2,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.dropDownValue == null) {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: DialogBoxWidget(
                                        heading: 'No period set',
                                        body:
                                            'Please select a budget period from the dropdown',
                                        buttonYes: 'Okay',
                                        buttonNo: 'No',
                                        information: true,
                                        yesAction: () async {},
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));

                                return;
                              }
                              if (FFAppState().currencyTextField > 0) {
                                if (_model.dropDownValue != null &&
                                    _model.dropDownValue != '') {
                                  if (_model.dropDownValue == 'Monthly') {
                                    final budgetsUpdateData1 =
                                        createBudgetsRecordData(
                                      budgetAmount:
                                          FFAppState().currencyTextField,
                                      budgetStart:
                                          _model.calendarSelectedDay?.start,
                                      isRecurring: true,
                                      unallocatedAmount: functions.subInt(
                                          FFAppState().currencyTextField,
                                          100000),
                                      budgetDuration: 'Monthly',
                                      status: 'active',
                                      duration: 30,
                                      budgetEnd: functions.addDaysToDate(
                                          _model.calendarSelectedDay?.start,
                                          30),
                                      budgetOwner: currentUserReference,
                                      budgetSpent: 0,
                                    );
                                    await widget.budget!.reference
                                        .update(budgetsUpdateData1);
                                  } else {
                                    if (_model.dropDownValue == 'Weekly') {
                                      final budgetsUpdateData2 =
                                          createBudgetsRecordData(
                                        budgetAmount:
                                            FFAppState().currencyTextField,
                                        budgetStart:
                                            _model.calendarSelectedDay?.start,
                                        isRecurring: true,
                                        unallocatedAmount: functions.subInt(
                                            FFAppState().currencyTextField,
                                            100000),
                                        budgetDuration: 'Monthly',
                                        status: 'active',
                                        duration: 7,
                                        budgetEnd: functions.addDaysToDate(
                                            _model.calendarSelectedDay?.start,
                                            7),
                                        budgetOwner: currentUserReference,
                                        budgetSpent: 0,
                                      );
                                      await widget.budget!.reference
                                          .update(budgetsUpdateData2);
                                    } else {
                                      if (_model.dropDownValue == 'Daily') {
                                        final budgetsUpdateData3 =
                                            createBudgetsRecordData(
                                          budgetAmount:
                                              FFAppState().currencyTextField,
                                          budgetStart:
                                              _model.calendarSelectedDay?.start,
                                          isRecurring: true,
                                          unallocatedAmount: functions.subInt(
                                              FFAppState().currencyTextField,
                                              100000),
                                          budgetDuration: 'Monthly',
                                          status: 'active',
                                          duration: 1,
                                          budgetEnd: functions.addDaysToDate(
                                              _model.calendarSelectedDay?.start,
                                              1),
                                          budgetOwner: currentUserReference,
                                          budgetSpent: 0,
                                        );
                                        await widget.budget!.reference
                                            .update(budgetsUpdateData3);
                                      } else {
                                        return;
                                      }
                                    }
                                  }
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
                                          heading: 'Budget Duration',
                                          body:
                                              'Please select a budget duration from the dropdown',
                                          buttonYes: 'Got it',
                                          buttonNo: 'n',
                                          information: true,
                                          yesAction: () async {},
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                }
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
                                        heading: 'Invalid Amount',
                                        body:
                                            'Your budget amount should be greater than zero',
                                        buttonYes: 'Got it',
                                        buttonNo: 'n',
                                        information: true,
                                        yesAction: () async {},
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              }

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

                              final usersUpdateData = createUsersRecordData(
                                activeBudget: columnBudgetsRecord.reference,
                              );
                              await currentUserReference!
                                  .update(usersUpdateData);
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllocateBudgetWidget(
                                    createdBudget: columnBudgetsRecord,
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
                                  .subtitle1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .subtitle1Family,
                                    color: Colors.white,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .subtitle1Family),
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
