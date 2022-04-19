import '../account_single/account_single_widget.dart';
import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
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
  ApiCallResponse transactionsResponse;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Accounts'});
  }

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
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          logFirebaseEvent('FloatingActionButton-ON_TAP');
          logFirebaseEvent('FloatingActionButton-Custom-Action');
          newacctB = await actions.flutterMono(
            context,
          );
          logFirebaseEvent('FloatingActionButton-Backend-Call');
          acctInfoResponse = await GetAccountInfoCall.call(
            authID: newacctB.authID,
          );
          logFirebaseEvent('FloatingActionButton-Backend-Call');

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
          logFirebaseEvent('FloatingActionButton-Backend-Call');
          transactionsResponse = await GetTransactionsCall.call(
            authID: newacctB.authID,
          );
          logFirebaseEvent('FloatingActionButton-Custom-Action');
          await actions.writeNewAcctTransactions(
            (transactionsResponse?.jsonBody ?? ''),
            newacctB,
          );

          setState(() {});
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        elevation: 3,
        label: Text(
          'Link New Account',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Roboto',
                color: Colors.white,
              ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: StreamBuilder<List<AccountsRecord>>(
                    stream: queryAccountsRecord(
                      queryBuilder: (accountsRecord) => accountsRecord.where(
                          'accountOwner',
                          isEqualTo: currentUserReference),
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
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Container(
                              width: 100,
                              height: 120,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent('Row-ON_TAP');
                                    logFirebaseEvent('Row-Navigate-To');
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AccountSingleWidget(
                                          account: listViewAccountsRecord,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                        child: Stack(
                                          alignment: AlignmentDirectional(0, 0),
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEEEEEE),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          300),
                                                ),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                              ),
                                            ),
                                            FutureBuilder<
                                                List<
                                                    ConstInstitutionLogosRecord>>(
                                              future:
                                                  queryConstInstitutionLogosRecordOnce(
                                                queryBuilder:
                                                    (constInstitutionLogosRecord) =>
                                                        constInstitutionLogosRecord.where(
                                                            'institutionCode',
                                                            isEqualTo:
                                                                listViewAccountsRecord
                                                                    .bankCode),
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ConstInstitutionLogosRecord>
                                                    imageConstInstitutionLogosRecordList =
                                                    snapshot.data;
                                                // Return an empty Container when the document does not exist.
                                                if (snapshot.data.isEmpty) {
                                                  return Container();
                                                }
                                                final imageConstInstitutionLogosRecord =
                                                    imageConstInstitutionLogosRecordList
                                                            .isNotEmpty
                                                        ? imageConstInstitutionLogosRecordList
                                                            .first
                                                        : null;
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Image.network(
                                                    imageConstInstitutionLogosRecord
                                                        .institutionLogo,
                                                    width: 45,
                                                    height: 45,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 10),
                                                child: Text(
                                                  listViewAccountsRecord
                                                      .accountName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    functions.formatTransCurrency(
                                                        listViewAccountsRecord
                                                            .accountBalance),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
          ),
        ),
      ),
    );
  }
}
