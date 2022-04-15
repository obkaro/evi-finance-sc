import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectAccountWidget extends StatefulWidget {
  const SelectAccountWidget({
    Key key,
    this.accountsList,
    this.transaction,
  }) : super(key: key);

  final AccountsRecord accountsList;
  final TransactionsRecord transaction;

  @override
  _SelectAccountWidgetState createState() => _SelectAccountWidgetState();
}

class _SelectAccountWidgetState extends State<SelectAccountWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 320,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: FutureBuilder<List<AccountsRecord>>(
          future: queryAccountsRecordOnce(
            queryBuilder: (accountsRecord) => accountsRecord
                .where('accountName',
                    isEqualTo: widget.accountsList.accountName)
                .where('accountOwner', isEqualTo: currentUserReference),
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
            List<AccountsRecord> columnAccountsRecordList = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(columnAccountsRecordList.length,
                    (columnIndex) {
                  final columnAccountsRecord =
                      columnAccountsRecordList[columnIndex];
                  return InkWell(
                    onTap: () async {
                      final transactionsUpdateData =
                          createTransactionsRecordData(
                        account: columnAccountsRecord.reference,
                      );
                      await widget.transaction.reference
                          .update(transactionsUpdateData);

                      final usersUpdateData = createUsersRecordData(
                        defaultAccount: columnAccountsRecord.reference,
                      );
                      await currentUserReference.update(usersUpdateData);
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      title: Text(
                        columnAccountsRecord.accountName,
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      subtitle: Text(
                        formatNumber(
                          columnAccountsRecord.accountBalance,
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
