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

class EditBudgetAmountWidget extends StatefulWidget {
  const EditBudgetAmountWidget({
    Key? key,
    this.budget,
    this.categoryTotal,
  }) : super(key: key);

  final DocumentReference? budget;
  final int? categoryTotal;

  @override
  _EditBudgetAmountWidgetState createState() => _EditBudgetAmountWidgetState();
}

class _EditBudgetAmountWidgetState extends State<EditBudgetAmountWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      child: StreamBuilder<BudgetsRecord>(
        stream: BudgetsRecord.getDocument(widget.budget!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: SpinKitRing(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 50,
                ),
              ),
            );
          }
          final containerBudgetsRecord = snapshot.data!;
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 14,
                  color: FlutterFlowTheme.of(context).shadowGray,
                  offset: Offset(0, -3),
                )
              ],
              borderRadius: BorderRadius.circular(32),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: Text(
                            'Edit Budget Amount',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: custom_widgets.CurrencyTextField(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        amount: containerBudgetsRecord.budgetAmount,
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
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText2Family,
                                      fontSize: 14,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2Family),
                                    ),
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (FFAppState().currencyTextField >=
                                    widget.categoryTotal!) {
                                  final budgetsUpdateData =
                                      createBudgetsRecordData(
                                    budgetAmount:
                                        FFAppState().currencyTextField,
                                    unallocatedAmount: functions.subInt(
                                        FFAppState().currencyTextField,
                                        widget.categoryTotal),
                                  );
                                  await containerBudgetsRecord.reference
                                      .update(budgetsUpdateData);
                                  Navigator.pop(context);
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Invalid Entry'),
                                        content: Text(
                                            'Budget amount needs to be greater than the total amount of already created categories. '),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle2Family,
                                      color: Colors.white,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2Family),
                                    ),
                                elevation: 2,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
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
          );
        },
      ),
    );
  }
}
