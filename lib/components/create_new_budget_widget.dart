import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../create_budget_categories/create_budget_categories_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewBudgetWidget extends StatefulWidget {
  const CreateNewBudgetWidget({
    Key key,
    this.budget,
    this.budgetRemaining,
  }) : super(key: key);

  final BudgetsRecord budget;
  final int budgetRemaining;

  @override
  _CreateNewBudgetWidgetState createState() => _CreateNewBudgetWidgetState();
}

class _CreateNewBudgetWidgetState extends State<CreateNewBudgetWidget> {
  bool switchListTileValue;
  BudgetCategoriesRecord uncategorized;
  BudgetsRecord createdBudget;
  DateTimeRange startEndRange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 48),
      child: Container(
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
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
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
                          value: switchListTileValue ??= true,
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
                        isRecurring: switchListTileValue,
                      );
                      var budgetsRecordReference =
                          BudgetsRecord.collection.doc();
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
                      uncategorized =
                          BudgetCategoriesRecord.getDocumentFromData(
                              budgetCategoriesCreateData,
                              budgetCategoriesRecordReference);
                      logFirebaseEvent('Button-Custom-Action');
                      startEndRange = await actions.selectDateRange(
                        context,
                        createdBudget,
                      );
                      logFirebaseEvent('Button-Navigate-To');
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateBudgetCategoriesWidget(
                            createdBudget: createdBudget,
                            uncategorized: uncategorized,
                            dateRange: startEndRange,
                          ),
                        ),
                      );

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
