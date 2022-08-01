import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../connect_first_account/connect_first_account_widget.dart';
import '../first_budget/first_budget_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateFirstBudgetQWidget extends StatefulWidget {
  const CreateFirstBudgetQWidget({Key? key}) : super(key: key);

  @override
  _CreateFirstBudgetQWidgetState createState() =>
      _CreateFirstBudgetQWidgetState();
}

class _CreateFirstBudgetQWidgetState extends State<CreateFirstBudgetQWidget> {
  BudgetsRecord? createdBudget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your First Budget',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.table_view_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 72,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: 0,
                          runSpacing: 0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                              child: Text(
                                'Next, let\'s create your first budget. Monthly and weekly budgets will automatically repeat when the budget time period elapses.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ConnectFirstAccountWidget(),
                              ),
                            );
                          },
                          text: 'Skip (I\'ll do this later)',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 30,
                            color: Color(0x00D2D2D2),
                            textStyle: FlutterFlowTheme.of(context).bodyText2,
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
                        decoration: BoxDecoration(),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            final budgetsCreateData = createBudgetsRecordData(
                              budgetID: random_data.randomString(
                                24,
                                24,
                                true,
                                true,
                                true,
                              ),
                              budgetDateCreated: getCurrentTimestamp,
                              status: 'no_parent',
                            );
                            var budgetsRecordReference =
                                BudgetsRecord.collection.doc();
                            await budgetsRecordReference.set(budgetsCreateData);
                            createdBudget = BudgetsRecord.getDocumentFromData(
                                budgetsCreateData, budgetsRecordReference);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FirstBudgetWidget(
                                  budget: createdBudget,
                                ),
                              ),
                            );

                            setState(() {});
                          },
                          text: 'Continue',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle2Family,
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
