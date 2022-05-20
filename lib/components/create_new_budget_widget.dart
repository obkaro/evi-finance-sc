import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../create_budget_categories_copy/create_budget_categories_copy_widget.dart';
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
  BudgetCategoriesRecord uncategorized;
  BudgetsRecord createdBudget;
  DateTimeRange startEndRange;
  bool switchListTileValue1;
  bool switchListTileValue2;

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
                        value: switchListTileValue1 ??= true,
                        onChanged: (newValue) =>
                            setState(() => switchListTileValue1 = newValue),
                        title: Text(
                          'Recurring',
                          style: FlutterFlowTheme.of(context).subtitle2,
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
                        value: switchListTileValue2 ??= true,
                        onChanged: (newValue) =>
                            setState(() => switchListTileValue2 = newValue),
                        title: Text(
                          'Active',
                          style: FlutterFlowTheme.of(context).subtitle2,
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
                    logFirebaseEvent('Button_ON_TAP');
                    // Action_CreateBudgetStep1
                    logFirebaseEvent('Button_Action_CreateBudgetStep1');

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
                      isRecurring: switchListTileValue1,
                    );
                    var budgetsRecordReference = BudgetsRecord.collection.doc();
                    await budgetsRecordReference.set(budgetsCreateData);
                    createdBudget = BudgetsRecord.getDocumentFromData(
                        budgetsCreateData, budgetsRecordReference);
                    logFirebaseEvent('Button_Backend-Call');

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
                    logFirebaseEvent('Button_Custom-Action');
                    startEndRange = await actions.selectDateRange(
                      context,
                      createdBudget,
                    );
                    logFirebaseEvent('Button_Navigate-To');
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateBudgetCategoriesCopyWidget(
                          createdBudget: createdBudget,
                          uncategorized: uncategorized,
                          dateRange: startEndRange,
                        ),
                      ),
                    );

                    setState(() {});
                  },
                  text: 'Set Date Range',
                  icon: Icon(
                    Icons.calendar_today_rounded,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Source Sans Pro',
                          color: Colors.white,
                        ),
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
                    logFirebaseEvent('Button_ON_TAP');
                    logFirebaseEvent('Button_Navigate-Back');
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
