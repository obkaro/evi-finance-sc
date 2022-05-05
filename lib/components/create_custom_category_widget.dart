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

class CreateCustomCategoryWidget extends StatefulWidget {
  const CreateCustomCategoryWidget({
    Key key,
    this.budget,
    this.budgetRemaining,
  }) : super(key: key);

  final BudgetsRecord budget;
  final int budgetRemaining;

  @override
  _CreateCustomCategoryWidgetState createState() =>
      _CreateCustomCategoryWidgetState();
}

class _CreateCustomCategoryWidgetState
    extends State<CreateCustomCategoryWidget> {
  TextEditingController textController;

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
        height: 325,
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
                      labelText: 'Category Name',
                      hintText: 'Enter Category Name',
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
                    labelText: 'Amount',
                    hintText: 'Enter amount',
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('Button-ON_TAP');
                      if ((functions.budgetRemMinusAmt(
                              FFAppState().currencyTextField,
                              widget.budgetRemaining)) >=
                          0) {
                        logFirebaseEvent('Button-Backend-Call');

                        final budgetCategoriesCreateData =
                            createBudgetCategoriesRecordData(
                          categoryName: textController.text,
                          allocatedAmount: FFAppState().currencyTextField,
                          budgetOwner: currentUserReference,
                          categoryBudget: widget.budget.reference,
                        );
                        await BudgetCategoriesRecord.collection
                            .doc()
                            .set(budgetCategoriesCreateData);
                        logFirebaseEvent('Button-Navigate-Back');
                        Navigator.pop(context);
                      } else {
                        logFirebaseEvent('Button-Alert-Dialog');
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
                FFButtonWidget(
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
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
