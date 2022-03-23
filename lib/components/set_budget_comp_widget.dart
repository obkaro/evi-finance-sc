import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SetBudgetCompWidget extends StatefulWidget {
  const SetBudgetCompWidget({Key key}) : super(key: key);

  @override
  _SetBudgetCompWidgetState createState() => _SetBudgetCompWidgetState();
}

class _SetBudgetCompWidgetState extends State<SetBudgetCompWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: FutureBuilder<List<BudgetsRecord>>(
        future: queryBudgetsRecordOnce(
          queryBuilder: (budgetsRecord) => budgetsRecord.where('budgetOwner',
              isEqualTo: currentUserReference),
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
          List<BudgetsRecord> columnBudgetsRecordList = snapshot.data;
          return Column(
            mainAxisSize: MainAxisSize.max,
            children:
                List.generate(columnBudgetsRecordList.length, (columnIndex) {
              final columnBudgetsRecord = columnBudgetsRecordList[columnIndex];
              return InkWell(
                onTap: () async {
                  setState(() => FFAppState().selectedBudgetTrans =
                      columnBudgetsRecord.reference);
                  setState(() => FFAppState().transactionBudgetSelected = true);
                  Navigator.pop(context);
                },
                child: ListTile(
                  title: Text(
                    columnBudgetsRecord.budgetName,
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                  subtitle: Text(
                    formatNumber(
                      columnBudgetsRecord.budgetAmount,
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
          );
        },
      ),
    );
  }
}
