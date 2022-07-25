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
    Key? key,
    this.budget,
    this.categoryToEdit,
  }) : super(key: key);

  final BudgetsRecord? budget;
  final CategoriesRecord? categoryToEdit;

  @override
  _EditCategoryWidgetState createState() => _EditCategoryWidgetState();
}

class _EditCategoryWidgetState extends State<EditCategoryWidget> {
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController =
        TextEditingController(text: widget.categoryToEdit!.categoryName);
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
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
                  Text(
                    '(Unallocated: ${functions.formatBudgetCurrency(widget.budget!.unallocatedAmount)})',
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).subtitle2Family,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                  ),
                ],
              ),
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
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: custom_widgets.CurrencyTextField(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  amount: widget.categoryToEdit!.categoryAmount,
                  labelText: 'Amount',
                  hintText: 'Enter amount',
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: FFButtonWidget(
                  onPressed: () async {
                    if ((functions.checkEditCatTotal(
                            widget.budget!.unallocatedAmount,
                            FFAppState().currencyTextField,
                            widget.categoryToEdit!.categoryAmount)) >=
                        0) {
                      if ((FFAppState().currencyTextField!) >
                          (widget.categoryToEdit!.categoryAmount!)) {
                        final budgetsUpdateData = {
                          'unallocatedAmount': FieldValue.increment(
                              -(functions.subInt(FFAppState().currencyTextField,
                                  widget.categoryToEdit!.categoryAmount))),
                        };
                        await widget.budget!.reference
                            .update(budgetsUpdateData);
                      } else {
                        final budgetsUpdateData = {
                          'unallocatedAmount': FieldValue.increment(
                              functions.subInt(
                                  widget.categoryToEdit!.categoryAmount,
                                  FFAppState().currencyTextField)),
                        };
                        await widget.budget!.reference
                            .update(budgetsUpdateData);
                      }

                      final categoriesUpdateData = createCategoriesRecordData(
                        categoryAmount: FFAppState().currencyTextField,
                        categoryName: textController!.text,
                      );
                      await widget.categoryToEdit!.reference
                          .update(categoriesUpdateData);
                      Navigator.pop(context);
                    } else {
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
              FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'Cancel',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60,
                  color: Color(0x00D2D2D2),
                  textStyle: FlutterFlowTheme.of(context).subtitle2,
                  elevation: 0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
