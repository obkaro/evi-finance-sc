import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SetTransCategoryCopyWidget extends StatefulWidget {
  const SetTransCategoryCopyWidget({
    Key key,
    this.transaction,
    this.recievedBudget,
  }) : super(key: key);

  final TransactionsRecord transaction;
  final DocumentReference recievedBudget;

  @override
  _SetTransCategoryCopyWidgetState createState() =>
      _SetTransCategoryCopyWidgetState();
}

class _SetTransCategoryCopyWidgetState
    extends State<SetTransCategoryCopyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: FutureBuilder<List<BudgetCategoriesRecord>>(
          future: queryBudgetCategoriesRecordOnce(
            queryBuilder: (budgetCategoriesRecord) => budgetCategoriesRecord
                .where('categoryBudget', isEqualTo: widget.recievedBudget),
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
            List<BudgetCategoriesRecord> columnBudgetCategoriesRecordList =
                snapshot.data;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(columnBudgetCategoriesRecordList.length,
                    (columnIndex) {
                  final columnBudgetCategoriesRecord =
                      columnBudgetCategoriesRecordList[columnIndex];
                  return InkWell(
                    onTap: () async {
                      final transactionsUpdateData =
                          createTransactionsRecordData(
                        linkedCategory: columnBudgetCategoriesRecord.reference,
                        isCategorized: true,
                      );
                      await widget.transaction.reference
                          .update(transactionsUpdateData);

                      final budgetCategoriesUpdateData = {
                        'linkedTransactions': FieldValue.arrayUnion(
                            [widget.transaction.reference]),
                      };
                      await columnBudgetCategoriesRecord.reference
                          .update(budgetCategoriesUpdateData);
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NavBarPage(initialPage: 'Transactions'),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Transaction saved',
                            style: TextStyle(),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: Color(0x00000000),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        columnBudgetCategoriesRecord.categoryName,
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      subtitle: Text(
                        formatNumber(
                          columnBudgetCategoriesRecord.allocatedAmount,
                          formatType: FormatType.custom,
                          currency: 'N',
                          format: '',
                          locale: '',
                        ),
                        style: FlutterFlowTheme.of(context).subtitle2,
                      ),
                      trailing: Icon(
                        Icons.check_circle_rounded,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 32,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                    ),
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}
