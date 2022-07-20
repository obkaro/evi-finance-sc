import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../create_budget_categories/create_budget_categories_widget.dart';
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

class CreateNewBudgetWidget extends StatefulWidget {
  const CreateNewBudgetWidget({
    Key? key,
    this.budget,
  }) : super(key: key);

  final BudgetsRecord? budget;

  @override
  _CreateNewBudgetWidgetState createState() => _CreateNewBudgetWidgetState();
}

class _CreateNewBudgetWidgetState extends State<CreateNewBudgetWidget> {
  DateTimeRange? calendarSelectedDay;
  String? dropDownValue;

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
            blurRadius: 14,
            color: FlutterFlowTheme.of(context).customColor1,
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
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 16),
                  child: Container(
                    width: 60,
                    height: 6,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Text(
                    'Create a new budget',
                    style: FlutterFlowTheme.of(context).subtitle1,
                  ),
                ),
              ],
            ),
            custom_widgets.CurrencyTextField(
              width: MediaQuery.of(context).size.width,
              height: 50,
              labelText: 'Amount',
              hintText: 'Enter amount',
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
              child: FlutterFlowDropDown(
                initialOption: dropDownValue ??= 'Monthly',
                options: ['Weekly', 'Monthly'],
                onChanged: (val) => setState(() => dropDownValue = val),
                width: double.infinity,
                height: 55,
                textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                hintText: 'Please select...',
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 2,
                borderColor: Colors.transparent,
                borderWidth: 0,
                borderRadius: 12,
                margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                hidesUnderline: true,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 14,
                      color: FlutterFlowTheme.of(context).customColor1,
                    )
                  ],
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
                            'Budget start date',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
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
                        onChange: (DateTimeRange? newSelectedDate) async {
                          calendarSelectedDay = newSelectedDate;
                          if ((dropDownValue) == 'Monthly') {
                            final budgetsUpdateData = createBudgetsRecordData(
                              budgetStart: calendarSelectedDay?.start,
                              budgetEnd: functions.addDaysToDate(
                                  calendarSelectedDay?.end, 30),
                              budgetDuration: dropDownValue,
                            );
                            await widget.budget!.reference
                                .update(budgetsUpdateData);
                          } else {
                            if ((dropDownValue) == 'Weekly') {
                              final budgetsUpdateData = createBudgetsRecordData(
                                budgetStart: calendarSelectedDay?.start,
                                budgetEnd: functions.addDaysToDate(
                                    calendarSelectedDay?.end, 7),
                                budgetDuration: dropDownValue,
                              );
                              await widget.budget!.reference
                                  .update(budgetsUpdateData);
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('No time period'),
                                    content: Text(
                                        'Please select a budget time period in the dropdown above'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Okay'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }

                          setState(() {});
                        },
                        titleStyle: FlutterFlowTheme.of(context).bodyText1,
                        dayOfWeekStyle: FlutterFlowTheme.of(context).bodyText2,
                        dateStyle: FlutterFlowTheme.of(context).bodyText2,
                        selectedDateStyle: FlutterFlowTheme.of(context)
                            .bodyText1
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
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
                  // Action_CreateBud

                  final budgetsUpdateData = createBudgetsRecordData(
                    budgetOwner: currentUserReference,
                    budgetAmount: FFAppState().currencyTextField,
                    isActive: true,
                    budgetDuration: dropDownValue,
                    unallocatedAmount: FFAppState().currencyTextField,
                  );
                  await widget.budget!.reference.update(budgetsUpdateData);

                  final usersUpdateData = createUsersRecordData(
                    activeBudget: widget.budget!.reference,
                  );
                  await currentUserReference!.update(usersUpdateData);

                  final categoriesCreateData = createCategoriesRecordData(
                    categoryName: 'Unallocated',
                    categoryBudget: widget.budget!.reference,
                    categoryAmount: FFAppState().currencyTextField,
                  );
                  await CategoriesRecord.createDoc(widget.budget!.reference)
                      .set(categoriesCreateData);
                  Navigator.pop(context);
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateBudgetCategoriesWidget(
                        createdBudget: widget.budget,
                      ),
                    ),
                  );
                },
                text: 'Save',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).subtitle2Family,
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
      ),
    );
  }
}
