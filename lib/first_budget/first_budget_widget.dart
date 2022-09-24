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
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

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
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'FirstBudget'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                    flex: 5,
                    child: Padding(
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
                            key: formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: FlutterFlowDropDown(
                                options: ['Weekly', 'Monthly'],
                                onChanged: (val) =>
                                    setState(() => dropDownValue = val),
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
                                            rowHeight: 48,
                                            onChange: (DateTimeRange?
                                                newSelectedDate) async {
                                              calendarSelectedDay =
                                                  newSelectedDate;
                                              if (dropDownValue == 'Monthly') {
                                                final budgetsUpdateData =
                                                    createBudgetsRecordData(
                                                  budgetAmount: FFAppState()
                                                      .currencyTextField,
                                                  budgetStart:
                                                      calendarSelectedDay
                                                          ?.start,
                                                  isRecurring: true,
                                                  unallocatedAmount:
                                                      functions.subInt(
                                                          FFAppState()
                                                              .currencyTextField,
                                                          20000),
                                                  budgetDuration: 'Monthly',
                                                  status: 'active',
                                                  duration: 30,
                                                  budgetEnd:
                                                      functions.addDaysToDate(
                                                          calendarSelectedDay
                                                              ?.end,
                                                          30),
                                                  budgetSpent: 0,
                                                );
                                                await widget.budget!.reference
                                                    .update(budgetsUpdateData);
                                              } else {
                                                final budgetsUpdateData =
                                                    createBudgetsRecordData(
                                                  budgetAmount: FFAppState()
                                                      .currencyTextField,
                                                  budgetStart:
                                                      calendarSelectedDay
                                                          ?.start,
                                                  isRecurring: true,
                                                  unallocatedAmount:
                                                      functions.subInt(
                                                          FFAppState()
                                                              .currencyTextField,
                                                          20000),
                                                  budgetDuration: 'Weekly',
                                                  status: 'active',
                                                  duration: 7,
                                                  budgetEnd:
                                                      functions.addDaysToDate(
                                                          calendarSelectedDay
                                                              ?.end,
                                                          7),
                                                  budgetSpent: 0,
                                                );
                                                await widget.budget!.reference
                                                    .update(budgetsUpdateData);
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
                                  '${dateTimeFormat('MMMEd', columnBudgetsRecord.budgetStart)} - ${dateTimeFormat('MMMEd', columnBudgetsRecord.budgetEnd)}',
                                  style: FlutterFlowTheme.of(context).subtitle2,
                                ),
                              ],
                            ),
                        ],
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
                            if (formKey.currentState == null ||
                                !formKey.currentState!.validate()) {
                              return;
                            }

                            if (dropDownValue == null) {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
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

                            if (dropDownValue == 'Monthly') {
                              final budgetsUpdateData = createBudgetsRecordData(
                                budgetAmount: FFAppState().currencyTextField,
                                budgetStart: calendarSelectedDay?.start,
                                isRecurring: true,
                                unallocatedAmount: functions.subInt(
                                    FFAppState().currencyTextField, 20000),
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
                              final budgetsUpdateData = createBudgetsRecordData(
                                budgetAmount: FFAppState().currencyTextField,
                                budgetStart: calendarSelectedDay?.start,
                                isRecurring: true,
                                unallocatedAmount: functions.subInt(
                                    FFAppState().currencyTextField, 20000),
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
