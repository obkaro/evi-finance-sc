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
                    '(Unallocated: ${functions.formatBudgetCurrency(widget.budgetRemaining)})',
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Source Sans Pro',
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
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                child: StreamBuilder<List<BudgetCategoriesRecord>>(
                  stream: queryBudgetCategoriesRecord(
                    queryBuilder: (budgetCategoriesRecord) =>
                        budgetCategoriesRecord
                            .where('categoryBudget',
                                isEqualTo: widget.budget.reference)
                            .where('categoryName', isEqualTo: 'Uncategorized'),
                    singleRecord: true,
                  ),
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
                    List<BudgetCategoriesRecord>
                        buttonBudgetCategoriesRecordList = snapshot.data;
                    final buttonBudgetCategoriesRecord =
                        buttonBudgetCategoriesRecordList.isNotEmpty
                            ? buttonBudgetCategoriesRecordList.first
                            : null;
                    return FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('Button_ON_TAP');
                        if ((functions.budgetRemMinusAmt(
                                FFAppState().currencyTextField,
                                widget.budgetRemaining)) >=
                            0) {
                          logFirebaseEvent('Button_Backend-Call');

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
                          logFirebaseEvent('Button_Backend-Call');

                          final budgetCategoriesUpdateData =
                              createBudgetCategoriesRecordData(
                            allocatedAmount: functions.budgetRemMinusAmt(
                                FFAppState().currencyTextField,
                                widget.budgetRemaining),
                          );
                          await buttonBudgetCategoriesRecord.reference
                              .update(budgetCategoriesUpdateData);
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
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Source Sans Pro',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 16,
                      ),
                    );
                  },
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('Button_ON_TAP');
                  logFirebaseEvent('Button_Navigate-Back');
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
