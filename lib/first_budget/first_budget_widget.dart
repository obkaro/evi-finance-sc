import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../new_budget_categories/new_budget_categories_widget.dart';
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Your first budget',
          style: FlutterFlowTheme.of(context).title3,
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
                            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'What type of budget would you like to create?',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: FlutterFlowDropDown(
                              initialOption: dropDownValue ??= 'Monthly Budget',
                              options: ['Weekly Budget', 'Monthly Budget'],
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
                                  ),
                              hintText: 'Please select...',
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2,
                              borderColor: Colors.transparent,
                              borderWidth: 0,
                              borderRadius: 12,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              hidesUnderline: true,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'How much do you plan to spend within your budget period?',
                                  style: FlutterFlowTheme.of(context).bodyText2,
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
                                            4, 4, 4, 4),
                                        child: Text(
                                          'When does this budget start?',
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
                                              calendarSelectedDay =
                                                  newSelectedDate;
                                              if (dropDownValue ==
                                                  'Monthly Budget') {
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
                                                              ?.start,
                                                          30),
                                                  budgetOwner:
                                                      currentUserReference,
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
                                                              ?.start,
                                                          7),
                                                  budgetOwner:
                                                      currentUserReference,
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
                                                              .secondaryColor,
                                                      fontWeight:
                                                          FontWeight.w300,
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                        child: FFButtonWidget(
                          onPressed: () async {
                            // Action_CreateBud

                            final budgetsUpdateData = createBudgetsRecordData(
                              budgetOwner: currentUserReference,
                              budgetAmount: FFAppState().currencyTextField,
                              budgetDuration: dropDownValue,
                              unallocatedAmount: functions.subInt(
                                  FFAppState().currencyTextField, 50000),
                              status: 'active',
                            );
                            await widget.budget!.reference
                                .update(budgetsUpdateData);

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
                              categoryAmount: 50000,
                            );
                            await CategoriesRecord.createDoc(
                                    widget.budget!.reference)
                                .set(categoriesCreateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewBudgetCategoriesWidget(
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
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle2Family,
                                      color: Colors.white,
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
