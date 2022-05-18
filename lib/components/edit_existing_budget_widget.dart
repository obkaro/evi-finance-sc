import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_budget_categories/edit_budget_categories_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EditExistingBudgetWidget extends StatefulWidget {
  const EditExistingBudgetWidget({
    Key key,
    this.budget,
    this.categoriesSum,
    this.uncategorized,
    this.dateRangeEx,
  }) : super(key: key);

  final BudgetsRecord budget;
  final int categoriesSum;
  final BudgetCategoriesRecord uncategorized;
  final DateTimeRange dateRangeEx;

  @override
  _EditExistingBudgetWidgetState createState() =>
      _EditExistingBudgetWidgetState();
}

class _EditExistingBudgetWidgetState extends State<EditExistingBudgetWidget> {
  bool switchListTileValue1;
  bool switchListTileValue2;
  DateTimeRange startEndRange;

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
                  amount: widget.budget.budgetAmount,
                  labelText: 'Amount',
                  hintText: 'Enter amount',
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SwitchListTile(
                        value: switchListTileValue1 ??=
                            widget.budget.isRecurring,
                        onChanged: (newValue) =>
                            setState(() => switchListTileValue1 = newValue),
                        title: Text(
                          'Active',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Source Sans Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primaryColor,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SwitchListTile(
                        value: switchListTileValue2 ??=
                            widget.budget.isRecurring,
                        onChanged: (newValue) =>
                            setState(() => switchListTileValue2 = newValue),
                        title: Text(
                          'Recurring',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Source Sans Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primaryColor,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('Button-ON_TAP');
                    if ((FFAppState().currencyTextField) >
                        (widget.categoriesSum)) {
                      logFirebaseEvent('Button-Custom-Action');
                      startEndRange = await actions.selectDateRange(
                        context,
                        widget.budget,
                      );
                      // Action_CreateBudgetStep1
                      logFirebaseEvent('Button-Action_CreateBudgetStep1');

                      final budgetsUpdateData = createBudgetsRecordData(
                        budgetAmount: FFAppState().currencyTextField,
                        isRecurring: switchListTileValue2,
                        isActive: switchListTileValue2,
                      );
                      await widget.budget.reference.update(budgetsUpdateData);
                      logFirebaseEvent('Button-Show-Snack-Bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Date changes saved',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Source Sans Pro',
                                      color: Colors.white,
                                    ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: Color(0xFF010101),
                        ),
                      );
                    } else {
                      logFirebaseEvent('Button-Alert-Dialog');
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

                    setState(() {});
                  },
                  text: 'Select Date Range',
                  icon: Icon(
                    Icons.calendar_today_rounded,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Source Sans Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                    borderSide: BorderSide(
                      color: Color(0x00595959),
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('Button-ON_TAP');
                    if ((FFAppState().currencyTextField) >
                        (widget.categoriesSum)) {
                      // Action_CreateBudgetStep1
                      logFirebaseEvent('Button-Action_CreateBudgetStep1');

                      final budgetsUpdateData = createBudgetsRecordData(
                        budgetAmount: FFAppState().currencyTextField,
                        isRecurring: switchListTileValue2,
                        isActive: switchListTileValue2,
                      );
                      await widget.budget.reference.update(budgetsUpdateData);
                      logFirebaseEvent('Button-Navigate-To');
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.scale,
                          alignment: Alignment.bottomCenter,
                          duration: Duration(milliseconds: 400),
                          reverseDuration: Duration(milliseconds: 400),
                          child: EditBudgetCategoriesWidget(
                            createdBudget: widget.budget,
                            uncategorized: widget.uncategorized,
                          ),
                        ),
                      );
                    } else {
                      logFirebaseEvent('Button-Alert-Dialog');
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
                  text: 'Edit Categories',
                  icon: Icon(
                    Icons.edit_rounded,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Source Sans Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                    borderSide: BorderSide(
                      color: Color(0x00595959),
                      width: 1,
                    ),
                    borderRadius: 12,
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
                  text: 'Done',
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
      ),
    );
  }
}
