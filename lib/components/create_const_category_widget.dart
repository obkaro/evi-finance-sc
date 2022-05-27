import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateConstCategoryWidget extends StatefulWidget {
  const CreateConstCategoryWidget({
    Key key,
    this.constCategory,
    this.budget,
    this.uncategorized,
  }) : super(key: key);

  final ConstBudgetCategoriesRecord constCategory;
  final BudgetsRecord budget;
  final BudgetCategoriesRecord uncategorized;

  @override
  _CreateConstCategoryWidgetState createState() =>
      _CreateConstCategoryWidgetState();
}

class _CreateConstCategoryWidgetState extends State<CreateConstCategoryWidget> {
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
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Text(
                            widget.constCategory.categoryName,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).subtitle1,
                          ),
                        ),
                        Text(
                          '(Unallocated: ${functions.formatBudgetCurrency(widget.uncategorized.allocatedAmount)})',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Source Sans Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'CREATE_CONST_CATEGORY_COMP_SAVE_BUTTON_ON_TAP');
                    if ((FFAppState().currencyTextField) <=
                        (widget.uncategorized.allocatedAmount)) {
                      logFirebaseEvent('Button_Backend-Call');

                      final budgetCategoriesUpdateData = {
                        'allocatedAmount': FieldValue.increment(
                            -(FFAppState().currencyTextField)),
                      };
                      await widget.uncategorized.reference
                          .update(budgetCategoriesUpdateData);
                      logFirebaseEvent('Button_Backend-Call');

                      final budgetCategoriesCreateData =
                          createBudgetCategoriesRecordData(
                        categoryName: widget.constCategory.categoryName,
                        allocatedAmount: FFAppState().currencyTextField,
                        budgetOwner: currentUserReference,
                        categoryBudget: widget.budget.reference,
                      );
                      await BudgetCategoriesRecord.collection
                          .doc()
                          .set(budgetCategoriesCreateData);
                      logFirebaseEvent('Button_Navigate-Back');
                      Navigator.pop(context);
                    } else {
                      logFirebaseEvent('Button_Alert-Dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Budget Amount Exceeded'),
                            content: Text(
                                'Please enter a value lower than the target budget, or increase the target budget value'),
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
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 16,
                  ),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent(
                      'CREATE_CONST_CATEGORY_COMP_CANCEL_BUTTON_ON_TAP');
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
            ],
          ),
        ),
      ),
    );
  }
}
