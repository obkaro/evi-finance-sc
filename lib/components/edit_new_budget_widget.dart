import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_budget_categories/edit_budget_categories_widget.dart';
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

class EditNewBudgetWidget extends StatefulWidget {
  const EditNewBudgetWidget({
    Key key,
    this.budget,
    this.ccategoriesSum,
  }) : super(key: key);

  final BudgetsRecord budget;
  final int ccategoriesSum;

  @override
  _EditNewBudgetWidgetState createState() => _EditNewBudgetWidgetState();
}

class _EditNewBudgetWidgetState extends State<EditNewBudgetWidget> {
  DateTimeRange calendarSelectedDay;
  String dropDownValue;

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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
              child: Text(
                'Edit budget',
                style: FlutterFlowTheme.of(context).subtitle1,
              ),
            ),
            custom_widgets.CurrencyTextField(
              width: MediaQuery.of(context).size.width,
              height: 50,
              amount: widget.budget.budgetAmount,
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
                      fontFamily: 'Source Sans Pro',
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
                            'Select start date',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Source Sans Pro',
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
                        initialDate: widget.budget.budgetStart,
                        onChange: (DateTimeRange newSelectedDate) async {
                          calendarSelectedDay = newSelectedDate;
                          if ((dropDownValue) == 'Monthly') {
                            final budgetsUpdateData = createBudgetsRecordData(
                              budgetStart: calendarSelectedDay?.start,
                              budgetEnd: functions.addDaysToDate(
                                  calendarSelectedDay?.end, 30),
                              budgetDuration: dropDownValue,
                            );
                            await widget.budget.reference
                                .update(budgetsUpdateData);
                          } else {
                            if ((dropDownValue) == 'Weekly') {
                              final budgetsUpdateData = createBudgetsRecordData(
                                budgetStart: calendarSelectedDay?.start,
                                budgetEnd: functions.addDaysToDate(
                                    calendarSelectedDay?.end, 7),
                                budgetDuration: dropDownValue,
                              );
                              await widget.budget.reference
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
                  if ((FFAppState().currencyTextField) >
                      (widget.ccategoriesSum)) {
                    // Action_CreateBudgetStep1

                    final budgetsUpdateData = createBudgetsRecordData(
                      budgetAmount: FFAppState().currencyTextField,
                      budgetDuration: dropDownValue,
                      unallocatedAmount: functions.subInt(
                          FFAppState().currencyTextField,
                          widget.ccategoriesSum),
                    );
                    await widget.budget.reference.update(budgetsUpdateData);
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Proceed to edit budget categories?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, false),
                                  child: Text('No'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, true),
                                  child: Text('Yes'),
                                ),
                              ],
                            );
                          },
                        ) ??
                        false;
                    if (confirmDialogResponse) {
                      Navigator.pop(context);
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditBudgetCategoriesWidget(
                            createdBudget: widget.budget,
                          ),
                        ),
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  } else {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Invalid entry'),
                          content: Text(
                              'Budget amount should be greater than the sum of existing categories within it.'),
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
                },
                text: 'Save',
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
          ],
        ),
      ),
    );
  }
}
