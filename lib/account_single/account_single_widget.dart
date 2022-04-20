import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
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
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSingleWidget extends StatefulWidget {
  const AccountSingleWidget({
    Key key,
    this.account,
  }) : super(key: key);

  final AccountsRecord account;

  @override
  _AccountSingleWidgetState createState() => _AccountSingleWidgetState();
}

class _AccountSingleWidgetState extends State<AccountSingleWidget> {
  ApiCallResponse accountRespons;
  ApiCallResponse accountResponse;
  ApiCallResponse dataSyncResponse;
  ApiCallResponse reauthCode;
  ApiCallResponse transactionJsonResponse;
  ApiCallResponse transactionJsonRespons;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AccountSingle'});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BudgetCategoriesRecord>>(
      future: queryBudgetCategoriesRecordOnce(
        queryBuilder: (budgetCategoriesRecord) => budgetCategoriesRecord
            .where('budgetOwner', isEqualTo: currentUserReference),
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
        List<BudgetCategoriesRecord> accountSingleBudgetCategoriesRecordList =
            snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              'Account',
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
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Container(
                                    width: 160,
                                    height: 160,
                                    child: Stack(
                                      alignment: AlignmentDirectional(0, 0),
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                              borderRadius:
                                                  BorderRadius.circular(300),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                          ),
                                        ),
                                        FutureBuilder<
                                            List<ConstInstitutionLogosRecord>>(
                                          future:
                                              queryConstInstitutionLogosRecordOnce(
                                            queryBuilder:
                                                (constInstitutionLogosRecord) =>
                                                    constInstitutionLogosRecord
                                                        .where(
                                                            'institutionCode',
                                                            isEqualTo: widget
                                                                .account
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
                                                    color: FlutterFlowTheme.of(
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
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    imageConstInstitutionLogosRecord
                                                        .institutionLogo,
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.account.accountName,
                                        style:
                                            FlutterFlowTheme.of(context).title3,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Account Balance',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                widget.account.accountBalance),
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Institution',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            widget.account.institutionName,
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Account Number',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            widget.account.accountNumber,
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Account Details',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            widget.account.accountType,
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 100,
                                              height: 50,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 8, 0),
                                                child: StreamBuilder<
                                                    List<TransactionsRecord>>(
                                                  stream:
                                                      queryTransactionsRecord(
                                                    queryBuilder:
                                                        (transactionsRecord) =>
                                                            transactionsRecord.where(
                                                                'account',
                                                                isEqualTo: widget
                                                                    .account
                                                                    .reference),
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
                                                    List<TransactionsRecord>
                                                        buttonTransactionsRecordList =
                                                        snapshot.data;
                                                    return FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'Button-ON_TAP');
                                                        logFirebaseEvent(
                                                            'Button-Alert-Dialog');
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Unlink and Delete Account'),
                                                                      content: Text(
                                                                          'This will delete all account associated account data and cannot be undone'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              false),
                                                                          child:
                                                                              Text('Cancel'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              true),
                                                                          child:
                                                                              Text('Confirm'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          logFirebaseEvent(
                                                              'Button-Custom-Action');
                                                          await actions
                                                              .deleteTransactions(
                                                            buttonTransactionsRecordList
                                                                .toList(),
                                                          );
                                                          logFirebaseEvent(
                                                              'Button-Backend-Call');
                                                          await UnlinkMonoCall
                                                              .call(
                                                            authID: widget
                                                                .account.authID,
                                                          );
                                                          logFirebaseEvent(
                                                              'Button-Backend-Call');
                                                          await widget
                                                              .account.reference
                                                              .delete();
                                                          logFirebaseEvent(
                                                              'Button-Navigate-To');
                                                          await Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  NavBarPage(
                                                                      initialPage:
                                                                          'Profile'),
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
                                                      options: FFButtonOptions(
                                                        width: 130,
                                                        height: 50,
                                                        color:
                                                            Color(0xFFFF0003),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius: 12,
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
                                              height: 50,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 0),
                                                child: StreamBuilder<
                                                    List<TransactionsRecord>>(
                                                  stream:
                                                      queryTransactionsRecord(
                                                    queryBuilder:
                                                        (transactionsRecord) =>
                                                            transactionsRecord.where(
                                                                'account',
                                                                isEqualTo: widget
                                                                    .account
                                                                    .reference),
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
                                                    List<TransactionsRecord>
                                                        buttonTransactionsRecordList =
                                                        snapshot.data;
                                                    return FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'Button-ON_TAP');
                                                        var _shouldSetState =
                                                            false;
                                                        // Action_dataSyncCall
                                                        logFirebaseEvent(
                                                            'Button-Action_dataSyncCall');
                                                        dataSyncResponse =
                                                            await DataSyncMonoCall
                                                                .call(
                                                          authID: widget
                                                              .account.authID,
                                                        );
                                                        _shouldSetState = true;
                                                        logFirebaseEvent(
                                                            'Button-Update-Local-State');
                                                        setState(() =>
                                                            FFAppState()
                                                                    .dataSyncCode =
                                                                getJsonField(
                                                              (dataSyncResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.code''',
                                                            ).toString());
                                                        logFirebaseEvent(
                                                            'Button-Update-Local-State');
                                                        setState(() =>
                                                            FFAppState()
                                                                    .hasNewData =
                                                                getJsonField(
                                                              (dataSyncResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.hasNewData''',
                                                            ));
                                                        if ((FFAppState()
                                                                .dataSyncCode) ==
                                                            'REAUTHORISATION_REQUIRED') {
                                                          // Action_ReauthCall
                                                          logFirebaseEvent(
                                                              'Button-Action_ReauthCall');
                                                          reauthCode =
                                                              await ReauthMonoCall
                                                                  .call(
                                                            authID: widget
                                                                .account.authID,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          // Action_ReauthAcct
                                                          logFirebaseEvent(
                                                              'Button-Action_ReauthAcct');
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
                                                          logFirebaseEvent(
                                                              'Button-Backend-Call');
                                                          accountResponse =
                                                              await GetAccountInfoCall
                                                                  .call(
                                                            authID: widget
                                                                .account.authID,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          logFirebaseEvent(
                                                              'Button-Backend-Call');
                                                          transactionJsonResponse =
                                                              await GetTransactionsCall
                                                                  .call(
                                                            authID: widget
                                                                .account.authID,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          // Action_clearTransactions
                                                          logFirebaseEvent(
                                                              'Button-Action_clearTransactions');
                                                          await actions
                                                              .deleteTransactions(
                                                            buttonTransactionsRecordList
                                                                .toList(),
                                                          );
                                                          // Action_writeTransactions
                                                          logFirebaseEvent(
                                                              'Button-Action_writeTransactions');
                                                          await actions
                                                              .writeTransactions(
                                                            (transactionJsonResponse
                                                                    ?.jsonBody ??
                                                                ''),
                                                            widget.account,
                                                            buttonTransactionsRecordList
                                                                .toList(),
                                                          );
                                                          logFirebaseEvent(
                                                              'Button-Backend-Call');

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
                                                              .account.reference
                                                              .update(
                                                                  accountsUpdateData);
                                                          logFirebaseEvent(
                                                              'Button-Show-Snack-Bar');
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Synchronization Successful',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  Colors.black,
                                                            ),
                                                          );
                                                        } else {
                                                          if ((FFAppState()
                                                                  .dataSyncCode) ==
                                                              'SYNC_SUCCESSFUL') {
                                                            logFirebaseEvent(
                                                                'Button-Backend-Call');
                                                            accountRespons =
                                                                await GetAccountInfoCall
                                                                    .call(
                                                              authID: widget
                                                                  .account
                                                                  .authID,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            logFirebaseEvent(
                                                                'Button-Backend-Call');

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
                                                            await widget.account
                                                                .reference
                                                                .update(
                                                                    accountsUpdateData);
                                                            logFirebaseEvent(
                                                                'Button-Backend-Call');
                                                            transactionJsonRespons =
                                                                await GetTransactionsCall
                                                                    .call(
                                                              authID: widget
                                                                  .account
                                                                  .authID,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            // Action_clearTransactions
                                                            logFirebaseEvent(
                                                                'Button-Action_clearTransactions');
                                                            await actions
                                                                .deleteTransactions(
                                                              buttonTransactionsRecordList
                                                                  .toList(),
                                                            );
                                                            // Action_writeTransactions
                                                            logFirebaseEvent(
                                                                'Button-Action_writeTransactions');
                                                            await actions
                                                                .writeTransactions(
                                                              (transactionJsonRespons
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              widget.account,
                                                              buttonTransactionsRecordList
                                                                  .toList(),
                                                            );
                                                            logFirebaseEvent(
                                                                'Button-Show-Snack-Bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Synchronization Successful',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
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
                                                            logFirebaseEvent(
                                                                'Button-Show-Snack-Bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Synchronization Error: Please try again later',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
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
                                                          }

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                      },
                                                      text: 'Refresh',
                                                      icon: Icon(
                                                        Icons.refresh_rounded,
                                                        size: 15,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 130,
                                                        height: 50,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius: 12,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 50,
                                              decoration: BoxDecoration(),
                                              child: StreamBuilder<
                                                  List<TransactionsRecord>>(
                                                stream: queryTransactionsRecord(
                                                  queryBuilder:
                                                      (transactionsRecord) =>
                                                          transactionsRecord.where(
                                                              'account',
                                                              isEqualTo: widget
                                                                  .account
                                                                  .reference),
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
                                                  List<TransactionsRecord>
                                                      buttonTransactionsRecordList =
                                                      snapshot.data;
                                                  return FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'Button-ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button-Custom-Action');
                                                      await actions
                                                          .deleteTransactions(
                                                        buttonTransactionsRecordList
                                                            .toList(),
                                                      );
                                                    },
                                                    text: 'Clear Transactions',
                                                    icon: Icon(
                                                      Icons.clear_rounded,
                                                      size: 15,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 130,
                                                      height: 50,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius: 12,
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
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(),
                                ),
                              ],
                            ),
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
                                      isEqualTo: widget.account.reference)
                                  .orderBy('trasactionDate', descending: true),
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
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<TransactionsRecord>
                              columnTransactionsRecordList = snapshot.data;
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'Container-ON_TAP');
                                            // Action_navToTransactionSingle
                                            logFirebaseEvent(
                                                'Container-Action_navToTransactionSingle');
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
                                            height: 100,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 10),
                                              child: InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'Row-ON_TAP');
                                                  logFirebaseEvent(
                                                      'Row-Navigate-To');
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
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if (columnTransactionsRecord
                                                                    .isCategorized ??
                                                                true)
                                                              StreamBuilder<
                                                                  BudgetCategoriesRecord>(
                                                                stream: BudgetCategoriesRecord
                                                                    .getDocument(
                                                                        columnTransactionsRecord
                                                                            .linkedCategory),
                                                                builder: (context,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          size:
                                                                              50,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final textBudgetCategoriesRecord =
                                                                      snapshot
                                                                          .data;
                                                                  return AutoSizeText(
                                                                    textBudgetCategoriesRecord
                                                                        .categoryName
                                                                        .maybeHandleOverflow(
                                                                      maxChars:
                                                                          25,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  );
                                                                },
                                                              ),
                                                            if (!(columnTransactionsRecord
                                                                    .isCategorized) ??
                                                                true)
                                                              AutoSizeText(
                                                                'Uncategorized',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: Color(
                                                                          0xFFFF0003),
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                    ),
                                                              ),
                                                            Text(
                                                              '${dateTimeFormat('Hm', columnTransactionsRecord.trasactionDate)} | ${dateTimeFormat('MMMEd', columnTransactionsRecord.trasactionDate)}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                            Stack(
                                                              children: [
                                                                if ((columnTransactionsRecord
                                                                        .transactionType) ==
                                                                    'debit')
                                                                  AutoSizeText(
                                                                    columnTransactionsRecord
                                                                        .transactionType
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
                                                                              'Roboto',
                                                                          color:
                                                                              Color(0xFFFF0003),
                                                                        ),
                                                                  ),
                                                                if ((columnTransactionsRecord
                                                                        .transactionType) ==
                                                                    'credit')
                                                                  AutoSizeText(
                                                                    columnTransactionsRecord
                                                                        .transactionType
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
                                                                              'Roboto',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryColor,
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
    );
  }
}
