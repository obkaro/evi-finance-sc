import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/create_first_budget_q_copy_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../transaction_single/transaction_single_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSingleWidget extends StatefulWidget {
  const AccountSingleWidget({
    Key? key,
    this.account,
  }) : super(key: key);

  final AccountsRecord? account;

  @override
  _AccountSingleWidgetState createState() => _AccountSingleWidgetState();
}

class _AccountSingleWidgetState extends State<AccountSingleWidget> {
  ApiCallResponse? accountRespons;
  ApiCallResponse? accountResponse;
  ApiCallResponse? dataSyncResponse;
  ApiCallResponse? reauthCode;
  ApiCallResponse? transactionJsonResponse;
  ApiCallResponse? transactionJsonRespons;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.account!.reauthRequired == true) {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: CreateFirstBudgetQCopyWidget(
                account: widget.account,
              ),
            );
          },
        );
      } else {
        return;
      }
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AccountSingle'});
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      child: FutureBuilder<List<CategoriesRecord>>(
        future: queryCategoriesRecordOnce(
          parent: currentUserDocument!.activeBudget,
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
          List<CategoriesRecord> accountSingleCategoriesRecordList =
              snapshot.data!;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              iconTheme: IconThemeData(
                  color: FlutterFlowTheme.of(context).primaryText),
              automaticallyImplyLeading: true,
              actions: [],
              centerTitle: false,
              elevation: 0,
            ),
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                            child: StreamBuilder<AccountsRecord>(
                              stream: AccountsRecord.getDocument(
                                  widget.account!.reference),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitRing(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                final columnAccountsRecord = snapshot.data!;
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: Container(
                                          width: 160,
                                          height: 160,
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 1, 0, 0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              300),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                  ),
                                                ),
                                              ),
                                              FutureBuilder<
                                                  List<
                                                      ConstInstitutionLogosRecord>>(
                                                future:
                                                    queryConstInstitutionLogosRecordOnce(
                                                  queryBuilder: (constInstitutionLogosRecord) =>
                                                      constInstitutionLogosRecord
                                                          .where(
                                                              'institutionCode',
                                                              isEqualTo: widget
                                                                  .account!
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 50,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<ConstInstitutionLogosRecord>
                                                      imageConstInstitutionLogosRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the document does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final imageConstInstitutionLogosRecord =
                                                      imageConstInstitutionLogosRecordList
                                                          .first;
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          imageConstInstitutionLogosRecord
                                                              .institutionLogo!,
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                },
                                              ),
                                              if (widget.account!
                                                      .reauthRequired ==
                                                  true)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1, -1),
                                                  child: Icon(
                                                    Icons.warning_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 32,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              columnAccountsRecord.accountName!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 4),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Account Balance',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  functions.formatTransCurrency(
                                                      columnAccountsRecord
                                                          .accountBalance),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 4),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Institution',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  columnAccountsRecord
                                                      .institutionName!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 4),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Account Number',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  columnAccountsRecord
                                                      .accountNumber!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 4),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Account Details',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  columnAccountsRecord
                                                      .accountType!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 8, 0),
                                                      child: StreamBuilder<
                                                          List<
                                                              TransactionsRecord>>(
                                                        stream:
                                                            queryTransactionsRecord(
                                                          queryBuilder: (transactionsRecord) =>
                                                              transactionsRecord.where(
                                                                  'account',
                                                                  isEqualTo: widget
                                                                      .account!
                                                                      .reference),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    SpinKitRing(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 50,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<TransactionsRecord>
                                                              buttonTransactionsRecordList =
                                                              snapshot.data!;
                                                          return FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              var confirmDialogResponse =
                                                                  await showDialog<
                                                                          bool>(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Unlink and Delete Account'),
                                                                            content:
                                                                                Text('This will delete all account associated account data and cannot be undone'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                child: Text('Cancel'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                child: Text('Confirm'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ) ??
                                                                      false;
                                                              if (confirmDialogResponse) {
                                                                await actions
                                                                    .deleteTransactions(
                                                                  buttonTransactionsRecordList
                                                                      .toList(),
                                                                );
                                                                await UnlinkMonoCall
                                                                    .call(
                                                                  authID: widget
                                                                      .account!
                                                                      .authID,
                                                                );
                                                                await widget
                                                                    .account!
                                                                    .reference
                                                                    .delete();
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        NavBarPage(
                                                                            initialPage:
                                                                                'Settings'),
                                                                  ),
                                                                );
                                                              } else {
                                                                return;
                                                              }
                                                            },
                                                            text: 'Unlink',
                                                            icon: Icon(
                                                              Icons.delete,
                                                              size: 15,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 130,
                                                              height: 60,
                                                              color: Color(
                                                                  0xFFFF0003),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).subtitle2Family,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              elevation: 2,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    width: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 0, 0, 0),
                                                      child: StreamBuilder<
                                                          List<
                                                              TransactionsRecord>>(
                                                        stream:
                                                            queryTransactionsRecord(
                                                          queryBuilder: (transactionsRecord) =>
                                                              transactionsRecord.where(
                                                                  'account',
                                                                  isEqualTo: widget
                                                                      .account!
                                                                      .reference),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    SpinKitRing(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 50,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<TransactionsRecord>
                                                              buttonTransactionsRecordList =
                                                              snapshot.data!;
                                                          return FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              var _shouldSetState =
                                                                  false;
                                                              // Action_dataSyncCall
                                                              dataSyncResponse =
                                                                  await DataSyncMonoCall
                                                                      .call(
                                                                authID: widget
                                                                    .account!
                                                                    .authID,
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              setState(() =>
                                                                  FFAppState()
                                                                          .dataSyncCode =
                                                                      getJsonField(
                                                                    (dataSyncResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.code''',
                                                                  ).toString());
                                                              if (FFAppState()
                                                                      .dataSyncCode ==
                                                                  'REAUTHORISATION_REQUIRED') {
                                                                // Action_ReauthCall
                                                                reauthCode =
                                                                    await ReauthMonoCall
                                                                        .call(
                                                                  authID: widget
                                                                      .account!
                                                                      .authID,
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                // Action_ReauthAcct
                                                                await actions
                                                                    .flutterMonoReauth(
                                                                  context,
                                                                  getJsonField(
                                                                    (reauthCode
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.token''',
                                                                  ).toString(),
                                                                );
                                                                accountResponse =
                                                                    await GetAccountInfoCall
                                                                        .call(
                                                                  authID: widget
                                                                      .account!
                                                                      .authID,
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                transactionJsonResponse =
                                                                    await GetTransactionsCall
                                                                        .call(
                                                                  authID: widget
                                                                      .account!
                                                                      .authID,
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                // Action_writeTransactions
                                                                await actions
                                                                    .writeTransactions(
                                                                  (transactionJsonResponse
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  widget
                                                                      .account,
                                                                  buttonTransactionsRecordList
                                                                      .toList(),
                                                                );

                                                                final accountsUpdateData =
                                                                    createAccountsRecordData(
                                                                  dataStatus:
                                                                      getJsonField(
                                                                    (accountResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.meta.data_status''',
                                                                  ).toString(),
                                                                  accountBalance:
                                                                      getJsonField(
                                                                    (accountResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.account.balance''',
                                                                  ),
                                                                );
                                                                await widget
                                                                    .account!
                                                                    .reference
                                                                    .update(
                                                                        accountsUpdateData);
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Synchronization Successful',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyText1Family,
                                                                            color:
                                                                                Color(0xFFD1D1D1),
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black,
                                                                  ),
                                                                );
                                                              } else {
                                                                if (FFAppState()
                                                                        .dataSyncCode ==
                                                                    'SYNC_SUCCESSFUL') {
                                                                  accountRespons =
                                                                      await GetAccountInfoCall
                                                                          .call(
                                                                    authID: widget
                                                                        .account!
                                                                        .authID,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;

                                                                  final accountsUpdateData =
                                                                      createAccountsRecordData(
                                                                    dataStatus:
                                                                        getJsonField(
                                                                      (accountRespons
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.meta.data_status''',
                                                                    ).toString(),
                                                                    accountBalance:
                                                                        getJsonField(
                                                                      (accountRespons
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.account.balance''',
                                                                    ),
                                                                    lastSync:
                                                                        getCurrentTimestamp,
                                                                  );
                                                                  await widget
                                                                      .account!
                                                                      .reference
                                                                      .update(
                                                                          accountsUpdateData);
                                                                  transactionJsonRespons =
                                                                      await GetTransactionsCall
                                                                          .call(
                                                                    authID: widget
                                                                        .account!
                                                                        .authID,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  // Action_writeTransactions
                                                                  await actions
                                                                      .writeTransactions(
                                                                    (transactionJsonRespons
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    widget
                                                                        .account,
                                                                    buttonTransactionsRecordList
                                                                        .toList(),
                                                                  );
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Synchronization Successful',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                              color: Color(0xFFC1C1C1),
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          Colors
                                                                              .black,
                                                                    ),
                                                                  );
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Synchronization Error: Please try again later',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                              color: Color(0xFFE7E7E7),
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          Colors
                                                                              .black,
                                                                    ),
                                                                  );
                                                                }

                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (_shouldSetState)
                                                                setState(() {});
                                                            },
                                                            text: 'Refresh',
                                                            icon: Icon(
                                                              Icons
                                                                  .refresh_rounded,
                                                              size: 15,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 130,
                                                              height: 60,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).subtitle2Family,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              elevation: 2,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(),
                                                    child: StreamBuilder<
                                                        List<
                                                            TransactionsRecord>>(
                                                      stream:
                                                          queryTransactionsRecord(
                                                        queryBuilder: (transactionsRecord) =>
                                                            transactionsRecord.where(
                                                                'account',
                                                                isEqualTo: widget
                                                                    .account!
                                                                    .reference),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  SpinKitRing(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<TransactionsRecord>
                                                            buttonTransactionsRecordList =
                                                            snapshot.data!;
                                                        return FFButtonWidget(
                                                          onPressed: () async {
                                                            await actions
                                                                .deleteTransactions(
                                                              buttonTransactionsRecordList
                                                                  .toList(),
                                                            );
                                                          },
                                                          text:
                                                              'Clear Transactions',
                                                          icon: Icon(
                                                            Icons.clear_rounded,
                                                            size: 15,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 130,
                                                            height: 60,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .neutralGray,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .subtitle2Family,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Transactions',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: StreamBuilder<List<TransactionsRecord>>(
                          stream: queryTransactionsRecord(
                            queryBuilder: (transactionsRecord) =>
                                transactionsRecord
                                    .where('transactionOwner',
                                        isEqualTo: currentUserReference)
                                    .where('account',
                                        isEqualTo: widget.account!.reference)
                                    .orderBy('trasactionDate',
                                        descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitRing(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            List<TransactionsRecord>
                                columnTransactionsRecordList = snapshot.data!;
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                    columnTransactionsRecordList.length,
                                    (columnIndex) {
                                  final columnTransactionsRecord =
                                      columnTransactionsRecordList[columnIndex];
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 8, 20, 8),
                                          child: InkWell(
                                            onTap: () async {
                                              // Action_navToTransactionSingle
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TransactionSingleWidget(
                                                    transaction:
                                                        columnTransactionsRecord,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 10),
                                                child: InkWell(
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            TransactionSingleWidget(
                                                          transaction:
                                                              columnTransactionsRecord,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          width: 100,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              if (columnTransactionsRecord
                                                                      .transactionCategory !=
                                                                  null)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          8),
                                                                  child: StreamBuilder<
                                                                      CategoriesRecord>(
                                                                    stream: CategoriesRecord.getDocument(
                                                                        columnTransactionsRecord
                                                                            .transactionCategory!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50,
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                SpinKitRing(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 50,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final textCategoriesRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return AutoSizeText(
                                                                        textCategoriesRecord
                                                                            .categoryName!
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              25,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              if (columnTransactionsRecord
                                                                      .transactionCategory ==
                                                                  null)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          8),
                                                                  child:
                                                                      AutoSizeText(
                                                                    'Uncategorized',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          color:
                                                                              Color(0xFFFF0003),
                                                                          fontStyle:
                                                                              FontStyle.italic,
                                                                        ),
                                                                  ),
                                                                ),
                                                              Text(
                                                                '${dateTimeFormat('Hm', columnTransactionsRecord.trasactionDate)} | ${dateTimeFormat('MMMEd', columnTransactionsRecord.trasactionDate)}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          width: 100,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              AutoSizeText(
                                                                functions
                                                                    .formatTransCurrency(
                                                                        columnTransactionsRecord
                                                                            .transactionAmount)
                                                                    .maybeHandleOverflow(
                                                                      maxChars:
                                                                          15,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                              Stack(
                                                                children: [
                                                                  if (columnTransactionsRecord
                                                                          .transactionType ==
                                                                      'debit')
                                                                    AutoSizeText(
                                                                      columnTransactionsRecord
                                                                          .transactionType!
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            15,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText2
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyText2Family,
                                                                            color:
                                                                                Color(0xFFFF0003),
                                                                          ),
                                                                    ),
                                                                  if (columnTransactionsRecord
                                                                          .transactionType ==
                                                                      'credit')
                                                                    AutoSizeText(
                                                                      columnTransactionsRecord
                                                                          .transactionType!
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            15,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText2
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyText2Family,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                          ),
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
                                          ),
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                  );
                                }),
                              ),
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
        },
      ),
    );
  }
}
