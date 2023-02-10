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
import 'package:provider/provider.dart';
import 'edit_category_model.dart';
export 'edit_category_model.dart';

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
  late EditCategoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditCategoryModel());

    _model.textController =
        TextEditingController(text: widget.categoryToEdit!.categoryName);
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 14,
              color: FlutterFlowTheme.of(context).shadowGray,
            )
          ],
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Left to allocate: ',
                          style: FlutterFlowTheme.of(context).subtitle2,
                        ),
                        Text(
                          '${functions.formatBudgetCurrency(widget.budget!.unallocatedAmount)}',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                  child: TextFormField(
                    controller: _model.textController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Enter Amount',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
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
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                    keyboardType: TextInputType.name,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: custom_widgets.CurrencyTextField(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    amount: widget.categoryToEdit!.categoryAmount,
                    labelText: 'Amount',
                    hintText: 'Enter amount',
                    bgcolor: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: FlutterFlowTheme.of(context).fadedDivider,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
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
                      ),
                      Container(
                        width: 20,
                        height: 60,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (functions.checkEditCatTotal(
                                    widget.budget!.unallocatedAmount,
                                    FFAppState().currencyTextField,
                                    widget.categoryToEdit!.categoryAmount) >=
                                0) {
                              if (FFAppState().currencyTextField >
                                  widget.categoryToEdit!.categoryAmount!) {
                                final budgetsUpdateData1 = {
                                  'unallocatedAmount': FieldValue.increment(
                                      -(functions.subInt(
                                          FFAppState().currencyTextField,
                                          widget.categoryToEdit!
                                              .categoryAmount))),
                                };
                                await widget.budget!.reference
                                    .update(budgetsUpdateData1);
                              } else {
                                final budgetsUpdateData2 = {
                                  'unallocatedAmount': FieldValue.increment(
                                      functions.subInt(
                                          widget.categoryToEdit!.categoryAmount,
                                          FFAppState().currencyTextField)),
                                };
                                await widget.budget!.reference
                                    .update(budgetsUpdateData2);
                              }

                              final categoriesUpdateData =
                                  createCategoriesRecordData(
                                categoryAmount: FFAppState().currencyTextField,
                                categoryName: _model.textController.text,
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
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .subtitle2Family,
                                  color: Colors.white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .subtitle2Family),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
