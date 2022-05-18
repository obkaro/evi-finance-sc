import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../create_budget_categories_copy/create_budget_categories_copy_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
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

class CreateNewBudgetCopyWidget extends StatefulWidget {
  const CreateNewBudgetCopyWidget({Key key}) : super(key: key);

  @override
  _CreateNewBudgetCopyWidgetState createState() =>
      _CreateNewBudgetCopyWidgetState();
}

class _CreateNewBudgetCopyWidgetState extends State<CreateNewBudgetCopyWidget> {
  DateTimeRange calendarSelectedDay;
  BudgetCategoriesRecord uncategorized;
  BudgetsRecord createdBudget;

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Color(0x3B1D2429),
            offset: Offset(0, -3),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: custom_widgets.CurrencyTextField(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  labelText: 'Amount',
                  hintText: 'Enter amount',
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(18, 16, 18, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Budget start date (repeats monthly)',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Source Sans Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: FlutterFlowCalendar(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          weekFormat: false,
                          weekStartsMonday: false,
                          onChange: (DateTimeRange newSelectedDate) async {
                            calendarSelectedDay = newSelectedDate;
                            logFirebaseEvent('Calendar-ON_DATE_SELECTED');
                            logFirebaseEvent('Calendar-Backend-Call');

                            final budgetsUpdateData = createBudgetsRecordData(
                              budgetStart: calendarSelectedDay.start,
                              budgetEnd: functions.addDaysToDate(
                                  calendarSelectedDay.start, 30),
                            );
                            await currentUserDocument?.activeBudget
                                .update(budgetsUpdateData);
                            setState(() {});
                          },
                          titleStyle: FlutterFlowTheme.of(context).bodyText1,
                          dayOfWeekStyle:
                              FlutterFlowTheme.of(context).bodyText2,
                          dateStyle: FlutterFlowTheme.of(context).bodyText2,
                          selectedDateStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Source Sans Pro',
                                    color: Colors.white,
                                  ),
                          inactiveDateStyle: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('Button-ON_TAP');
                    // Action_CreateBudgetStep1
                    logFirebaseEvent('Button-Action_CreateBudgetStep1');

                    final budgetsCreateData = createBudgetsRecordData(
                      budgetOwner: currentUserReference,
                      budgetAmount: FFAppState().currencyTextField,
                      budgetDateCreated: getCurrentTimestamp,
                      budgetID: random_data.randomString(
                        24,
                        24,
                        true,
                        true,
                        true,
                      ),
                      budgetStart: calendarSelectedDay.start,
                      budgetEnd: functions.addDaysToDate(
                          calendarSelectedDay.start, 30),
                    );
                    var budgetsRecordReference = BudgetsRecord.collection.doc();
                    await budgetsRecordReference.set(budgetsCreateData);
                    createdBudget = BudgetsRecord.getDocumentFromData(
                        budgetsCreateData, budgetsRecordReference);
                    logFirebaseEvent('Button-Backend-Call');

                    final budgetCategoriesCreateData =
                        createBudgetCategoriesRecordData(
                      categoryName: 'Uncategorized',
                      categoryBudget: createdBudget.reference,
                      budgetOwner: currentUserReference,
                    );
                    var budgetCategoriesRecordReference =
                        BudgetCategoriesRecord.collection.doc();
                    await budgetCategoriesRecordReference
                        .set(budgetCategoriesCreateData);
                    uncategorized = BudgetCategoriesRecord.getDocumentFromData(
                        budgetCategoriesCreateData,
                        budgetCategoriesRecordReference);
                    logFirebaseEvent('Button-Backend-Call');

                    final usersUpdateData = createUsersRecordData(
                      activeBudget: createdBudget.reference,
                    );
                    await currentUserReference.update(usersUpdateData);
                    logFirebaseEvent('Button-Navigate-To');
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateBudgetCategoriesCopyWidget(
                          createdBudget: createdBudget,
                          uncategorized: uncategorized,
                        ),
                      ),
                    );

                    setState(() {});
                  },
                  text: 'Set Categories',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Source Sans Pro',
                          color: Colors.white,
                        ),
                    elevation: 0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 16,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('Button-ON_TAP');
                    logFirebaseEvent('Button-Navigate-Back');
                    Navigator.pop(context);
                  },
                  text: 'Cancel',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).subtitle2,
                    elevation: 0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
