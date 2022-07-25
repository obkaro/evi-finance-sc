import '../backend/backend.dart';
import '../budgets/budgets_widget.dart';
import '../edit_budget/edit_budget_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class BudgetOptionsWidget extends StatefulWidget {
  const BudgetOptionsWidget({
    Key? key,
    this.budget,
    this.categoriesSum,
  }) : super(key: key);

  final DocumentReference? budget;
  final int? categoriesSum;

  @override
  _BudgetOptionsWidgetState createState() => _BudgetOptionsWidgetState();
}

class _BudgetOptionsWidgetState extends State<BudgetOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
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
                final listTileBudgetsRecord = snapshot.data!;
                return InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditBudgetWidget(
                          budget: listTileBudgetsRecord,
                          categoriesSum: widget.categoriesSum,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      'Edit Budget',
                      style: FlutterFlowTheme.of(context).subtitle1,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BudgetsWidget(),
                  ),
                );
              },
              onLongPress: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BudgetsWidget(),
                  ),
                );
              },
              child: ListTile(
                title: Text(
                  'View All Budgets',
                  style: FlutterFlowTheme.of(context).subtitle1,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
                contentPadding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
