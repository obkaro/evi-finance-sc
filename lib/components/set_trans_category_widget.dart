import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SetTransCategoryWidget extends StatefulWidget {
  const SetTransCategoryWidget({
    Key key,
    this.transaction,
    this.recievedBudget,
  }) : super(key: key);

  final TransactionsRecord transaction;
  final DocumentReference recievedBudget;

  @override
  _SetTransCategoryWidgetState createState() => _SetTransCategoryWidgetState();
}

class _SetTransCategoryWidgetState extends State<SetTransCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
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
                child: SpinKitFadingFour(
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
                    final transactionsUpdateData = createTransactionsRecordData(
                      linkedCategory: columnBudgetCategoriesRecord.reference,
                    );
                    await widget.transaction.reference
                        .update(transactionsUpdateData);
                    Navigator.pop(context);

                    final budgetCategoriesUpdateData = {
                      'spentAmount': FieldValue.increment(
                          widget.transaction.transactionAmount),
                      'linkedTransactions':
                          FieldValue.arrayUnion([widget.transaction.reference]),
                    };
                    await columnBudgetCategoriesRecord.reference
                        .update(budgetCategoriesUpdateData);

                    final budgetsUpdateData = {
                      'budgetSpent': FieldValue.increment(
                          widget.transaction.transactionAmount),
                    };
                    await widget.recievedBudget.update(budgetsUpdateData);
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
                      Icons.check_rounded,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 20,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
