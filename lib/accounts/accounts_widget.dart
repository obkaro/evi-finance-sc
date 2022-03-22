import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountsWidget extends StatefulWidget {
  const AccountsWidget({Key key}) : super(key: key);

  @override
  _AccountsWidgetState createState() => _AccountsWidgetState();
}

class _AccountsWidgetState extends State<AccountsWidget> {
  AccountsRecord newacctB;
  ApiCallResponse acctInfoResponse;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'My Accounts',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          newacctB = await actions.flutterMono();
          acctInfoResponse = await GetAccountInfoCall.call(
            authID: newacctB.authID,
          );

          final accountsUpdateData = createAccountsRecordData(
            accountName: getJsonField(
              (acctInfoResponse?.jsonBody ?? ''),
              r'''$.account.name''',
            ).toString(),
            accountBalance: getJsonField(
              (acctInfoResponse?.jsonBody ?? ''),
              r'''$.account.balance''',
            ),
            dataStatus: getJsonField(
              (acctInfoResponse?.jsonBody ?? ''),
              r'''$.meta.data_status''',
            ).toString(),
            institutionName: getJsonField(
              (acctInfoResponse?.jsonBody ?? ''),
              r'''$.account.institution.name''',
            ).toString(),
            accountType: getJsonField(
              (acctInfoResponse?.jsonBody ?? ''),
              r'''$.account.type''',
            ).toString(),
            bankCode: getJsonField(
              (acctInfoResponse?.jsonBody ?? ''),
              r'''$.account.institution.bankCode''',
            ).toString(),
            institutionType: getJsonField(
              (acctInfoResponse?.jsonBody ?? ''),
              r'''$.account.institution.type''',
            ).toString(),
            authMethod: getJsonField(
              (acctInfoResponse?.jsonBody ?? ''),
              r'''$.meta.auth_method''',
            ).toString(),
            bvn: getJsonField(
              (acctInfoResponse?.jsonBody ?? ''),
              r'''$.account.bvn''',
            ).toString(),
            currency: getJsonField(
              (acctInfoResponse?.jsonBody ?? ''),
              r'''$.account.currency''',
            ).toString(),
            accountNumber: getJsonField(
              (acctInfoResponse?.jsonBody ?? ''),
              r'''$.account.accountNumber''',
            ).toString(),
          );
          await newacctB.reference.update(accountsUpdateData);

          setState(() {});
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        icon: Icon(
          Icons.add,
        ),
        elevation: 3,
        label: Text(
          'Link New Account',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: StreamBuilder<List<AccountsRecord>>(
                          stream: queryAccountsRecord(
                            queryBuilder: (accountsRecord) =>
                                accountsRecord.where('accountOwner',
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            List<AccountsRecord> listViewAccountsRecordList =
                                snapshot.data;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewAccountsRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewAccountsRecord =
                                    listViewAccountsRecordList[listViewIndex];
                                return Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              listViewAccountsRecord
                                                  .accountName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                listViewAccountsRecord
                                                    .institutionName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              formatNumber(
                                                listViewAccountsRecord
                                                    .accountBalance,
                                                formatType: FormatType.custom,
                                                currency: '₦',
                                                format: '',
                                                locale: '',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                listViewAccountsRecord
                                                    .dataStatus,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
