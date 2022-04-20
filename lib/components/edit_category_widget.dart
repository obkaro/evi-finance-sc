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

class EditCategoryWidget extends StatefulWidget {
  const EditCategoryWidget({
    Key key,
    this.budget,
    this.categoryToEdit,
    this.budgetRemaining,
  }) : super(key: key);

  final BudgetsRecord budget;
  final BudgetCategoriesRecord categoryToEdit;
  final int budgetRemaining;

  @override
  _EditCategoryWidgetState createState() => _EditCategoryWidgetState();
}

class _EditCategoryWidgetState extends State<EditCategoryWidget> {
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController =
        TextEditingController(text: widget.categoryToEdit.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
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
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
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
                    hintText: 'Enter Amount',
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
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).subtitle1,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: custom_widgets.CurrencyTextField(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  amount: widget.categoryToEdit.allocatedAmount,
                  labelText: 'Amount',
                  hintText: 'Enter amount',
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('Button-ON_TAP');
                    if ((functions.checkEditCatTotal(
                            widget.budgetRemaining,
                            FFAppState().currencyTextField,
                            widget.categoryToEdit.allocatedAmount)) >=
                        0) {
                      logFirebaseEvent('Button-Backend-Call');

                      final budgetCategoriesUpdateData =
                          createBudgetCategoriesRecordData(
                        allocatedAmount: FFAppState().currencyTextField,
                        categoryName: textController.text,
                      );
                      await widget.categoryToEdit.reference
                          .update(budgetCategoriesUpdateData);
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
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Roboto',
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
                  borderRadius: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
