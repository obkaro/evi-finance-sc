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
  }) : super(key: key);

  final BudgetsRecord budget;
  final int categoriesSum;
  final BudgetCategoriesRecord uncategorized;

  @override
  _EditExistingBudgetWidgetState createState() =>
      _EditExistingBudgetWidgetState();
}

class _EditExistingBudgetWidgetState extends State<EditExistingBudgetWidget> {
  bool switchListTileValue;
  TextEditingController textController;
  DateTimeRange startEndRange;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 24),
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Color(0x3B1D2429),
              offset: Offset(0, -3),
            )
          ],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                  child: TextFormField(
                    controller: textController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Budget Name',
                      hintText: 'Enter Budget Name',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
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
                          value: switchListTileValue ??=
                              widget.budget.isRecurring,
                          onChanged: (newValue) =>
                              setState(() => switchListTileValue = newValue),
                          title: Text(
                            'Auto Repeat',
                            style: FlutterFlowTheme.of(context).subtitle1,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('Button-ON_TAP');
                      if ((FFAppState().currencyTextField) >
                          (widget.categoriesSum)) {
                        // Action_CreateBudgetStep1
                        logFirebaseEvent('Button-Action_CreateBudgetStep1');

                        final budgetsUpdateData = createBudgetsRecordData(
                          budgetAmount: FFAppState().currencyTextField,
                          isRecurring: switchListTileValue,
                        );
                        await widget.budget.reference.update(budgetsUpdateData);
                        logFirebaseEvent('Button-Navigate-Back');
                        Navigator.pop(context);
                        logFirebaseEvent('Button-Custom-Action');
                        startEndRange = await actions.selectDateRange(
                          context,
                          widget.budget,
                        );
                        logFirebaseEvent('Button-Navigate-To');
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditBudgetCategoriesWidget(
                              createdBudget: widget.budget,
                              uncategorized: widget.uncategorized,
                              dateRange: startEndRange,
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

                      setState(() {});
                    },
                    text: 'Next',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Source Sans Pro',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('Button-ON_TAP');
                      logFirebaseEvent('Button-Navigate-Back');
                      Navigator.pop(context);
                    },
                    text: 'Cancel',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF57636C),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
