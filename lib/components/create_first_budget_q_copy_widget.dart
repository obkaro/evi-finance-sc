import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../connect_first_account/connect_first_account_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateFirstBudgetQCopyWidget extends StatefulWidget {
  const CreateFirstBudgetQCopyWidget({
    Key? key,
    this.account,
  }) : super(key: key);

  final AccountsRecord? account;

  @override
  _CreateFirstBudgetQCopyWidgetState createState() =>
      _CreateFirstBudgetQCopyWidgetState();
}

class _CreateFirstBudgetQCopyWidgetState
    extends State<CreateFirstBudgetQCopyWidget> {
  ApiCallResponse? accountRespons;
  ApiCallResponse? accountResponse;
  ApiCallResponse? dataSyncResponse;
  ApiCallResponse? reauthCode;
  ApiCallResponse? transactionJsonResponse;
  ApiCallResponse? transactionJsonRespons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      child: StreamBuilder<List<TransactionsRecord>>(
        stream: queryTransactionsRecord(
          queryBuilder: (transactionsRecord) => transactionsRecord
              .where('account', isEqualTo: widget.account!.reference),
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
          List<TransactionsRecord> containerTransactionsRecordList =
              snapshot.data!;
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 14,
                  color: FlutterFlowTheme.of(context).customColor1,
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
                            'Account Data Refresh',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.refresh_rounded,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 0),
                                  child: Text(
                                    'Due to connection protocols from ${widget.account!.institutionName}, you need to authenticate account data and transactions refresh.',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                              text: 'Don\'t Refresh',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 30,
                                color: Color(0x00D2D2D2),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle2Family,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
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
                          Container(
                            width: 20,
                            decoration: BoxDecoration(),
                          ),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                Navigator.pop(context);
                                // Action_dataSyncCall
                                dataSyncResponse = await DataSyncMonoCall.call(
                                  authID: widget.account!.authID,
                                );
                                _shouldSetState = true;
                                setState(() =>
                                    FFAppState().dataSyncCode = getJsonField(
                                      (dataSyncResponse!?.jsonBody ?? ''),
                                      r'''$.code''',
                                    ).toString());
                                if ((FFAppState().dataSyncCode) ==
                                    'REAUTHORISATION_REQUIRED') {
                                  // Action_ReauthCall
                                  reauthCode = await ReauthMonoCall.call(
                                    authID: widget.account!.authID,
                                  );
                                  _shouldSetState = true;
                                  // Action_ReauthAcct
                                  await actions.flutterMonoReauth(
                                    context,
                                    getJsonField(
                                      (reauthCode?.jsonBody ?? ''),
                                      r'''$.token''',
                                    ).toString(),
                                  );
                                  accountResponse =
                                      await GetAccountInfoCall.call(
                                    authID: widget.account!.authID,
                                  );
                                  _shouldSetState = true;
                                  transactionJsonResponse =
                                      await GetTransactionsCall.call(
                                    authID: widget.account!.authID,
                                  );
                                  _shouldSetState = true;
                                  // Action_writeTransactions
                                  await actions.writeTransactions(
                                    (transactionJsonResponse!?.jsonBody ?? ''),
                                    widget.account,
                                    containerTransactionsRecordList.toList(),
                                  );

                                  final accountsUpdateData =
                                      createAccountsRecordData(
                                    dataStatus: getJsonField(
                                      (accountResponse?.jsonBody ?? ''),
                                      r'''$.meta.data_status''',
                                    ).toString(),
                                    accountBalance: getJsonField(
                                      (accountResponse?.jsonBody ?? ''),
                                      r'''$.account.balance''',
                                    ),
                                  );
                                  await widget.account!.reference
                                      .update(accountsUpdateData);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Synchronization Successful',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family,
                                              color: Color(0xFFD1D1D1),
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Colors.black,
                                    ),
                                  );
                                } else {
                                  if ((FFAppState().dataSyncCode) ==
                                      'SYNC_SUCCESSFUL') {
                                    accountRespons =
                                        await GetAccountInfoCall.call(
                                      authID: widget.account!.authID,
                                    );
                                    _shouldSetState = true;

                                    final accountsUpdateData =
                                        createAccountsRecordData(
                                      dataStatus: getJsonField(
                                        (accountRespons?.jsonBody ?? ''),
                                        r'''$.meta.data_status''',
                                      ).toString(),
                                      accountBalance: getJsonField(
                                        (accountRespons?.jsonBody ?? ''),
                                        r'''$.account.balance''',
                                      ),
                                      lastSync: getCurrentTimestamp,
                                    );
                                    await widget.account!.reference
                                        .update(accountsUpdateData);
                                    transactionJsonRespons =
                                        await GetTransactionsCall.call(
                                      authID: widget.account!.authID,
                                    );
                                    _shouldSetState = true;
                                    // Action_writeTransactions
                                    await actions.writeTransactions(
                                      (transactionJsonRespons!?.jsonBody ?? ''),
                                      widget.account,
                                      containerTransactionsRecordList.toList(),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Synchronization Successful',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family,
                                                color: Color(0xFFC1C1C1),
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Colors.black,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Synchronization Error: Please try again later',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family,
                                                color: Color(0xFFE7E7E7),
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Colors.black,
                                      ),
                                    );
                                  }

                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                if (_shouldSetState) setState(() {});
                              },
                              text: 'Continue',
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
          );
        },
      ),
    );
  }
}
