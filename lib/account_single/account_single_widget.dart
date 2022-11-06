import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/account_data_refresh_widget.dart';
import '../components/dialog_box_widget.dart';
import '../components/empty_list_widget.dart';
import '../components/loading_empty_widget.dart';
import '../components/loading_transaction_widget.dart';
import '../components/transaction_list_item_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../settings/settings_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
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
  ApiCallResponse? dataSyncResponse;
  ApiCallResponse? reauthCode;
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
              child: AccountDataRefreshWidget(
                account: widget.account,
              ),
            );
          },
        ).then((value) => setState(() {}));
      } else {
        return;
      }
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AccountSingle'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).secondaryPrimary),
        automaticallyImplyLeading: true,
        title: Text(
          'Account Details',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: FlutterFlowTheme.of(context).title3Family,
                color: FlutterFlowTheme.of(context).secondaryPrimary,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).title3Family),
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: AuthUserStreamWidget(
            child: StreamBuilder<List<CategoriesRecord>>(
              stream: queryCategoriesRecord(
                parent: currentUserDocument!.activeBudget,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: Center(
                      child: LoadingEmptyWidget(),
                    ),
                  );
                }
                List<CategoriesRecord> containerCategoriesRecordList =
                    snapshot.data!;
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      // Action_dataSyncCall
                      dataSyncResponse = await DataSyncMonoCall.call(
                        authID: widget.account!.authID,
                      );
                      setState(() => FFAppState().dataSyncCode = getJsonField(
                            (dataSyncResponse?.jsonBody ?? ''),
                            r'''$.code''',
                          ).toString());
                      if (FFAppState().dataSyncCode ==
                          'REAUTHORISATION_REQUIRED') {
                        // Action_ReauthCall
                        reauthCode = await ReauthMonoCall.call(
                          authID: widget.account!.authID,
                        );
                        // Action_ReauthAcct
                        await actions.flutterMonoReauth(
                          context,
                          getJsonField(
                            (reauthCode?.jsonBody ?? ''),
                            r'''$.token''',
                          ).toString(),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Refreshing transactions. This might take a minute...',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: Color(0xFFD1D1D1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                            duration: Duration(milliseconds: 8000),
                            backgroundColor: Colors.black,
                          ),
                        );
                      } else {
                        if (FFAppState().dataSyncCode == 'SYNC_SUCCESSFUL') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Refreshing transactions. This might take a minute...',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: Color(0xFFC1C1C1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              duration: Duration(milliseconds: 8000),
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
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: Color(0xFFE7E7E7),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: Colors.black,
                            ),
                          );
                        }
                      }
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 20, 20, 20),
                                    child: StreamBuilder<AccountsRecord>(
                                      stream: AccountsRecord.getDocument(
                                          widget.account!.reference),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 42,
                                              height: 42,
                                              child: SpinKitChasingDots(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 42,
                                              ),
                                            ),
                                          );
                                        }
                                        final columnAccountsRecord =
                                            snapshot.data!;
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 10),
                                                child: Container(
                                                  width: 128,
                                                  height: 128,
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      1, 0, 0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          300),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                          ),
                                                        ),
                                                      ),
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              columnAccountsRecord
                                                                  .accountLogo!,
                                                          width: 80,
                                                          height: 80,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      if (widget.account!
                                                              .reauthRequired ==
                                                          true)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1, -1),
                                                          child: Icon(
                                                            Icons
                                                                .warning_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            size: 32,
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 20),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      columnAccountsRecord
                                                          .accountName!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 4),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Account Balance',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          functions.formatTransCurrency(
                                                              columnAccountsRecord
                                                                  .accountBalance),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 4),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Institution',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          columnAccountsRecord
                                                              .institutionName!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 4),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Account Number',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          columnAccountsRecord
                                                              .accountNumber!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 4),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Account Details',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          columnAccountsRecord
                                                              .accountType!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: StreamBuilder<List<TransactionsRecord>>(
                                stream: queryTransactionsRecord(
                                  queryBuilder: (transactionsRecord) =>
                                      transactionsRecord
                                          .where('transactionOwner',
                                              isEqualTo: currentUserReference)
                                          .where('account',
                                              isEqualTo:
                                                  widget.account!.reference),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: LoadingTransactionWidget(),
                                    );
                                  }
                                  List<TransactionsRecord>
                                      listViewTransactionsRecordList =
                                      snapshot.data!;
                                  if (listViewTransactionsRecordList.isEmpty) {
                                    return Center(
                                      child: Container(
                                        width: double.infinity,
                                        height: 300,
                                        child: EmptyListWidget(
                                          text:
                                              'Connect an account to import transactions',
                                          icon: Icon(
                                            Icons.compare_arrows_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 64,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewTransactionsRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewTransactionsRecord =
                                          listViewTransactionsRecordList[
                                              listViewIndex];
                                      return TransactionListItemWidget(
                                        key: Key(
                                            'transactionListItem_${listViewIndex}'),
                                        transactionDoc:
                                            listViewTransactionsRecord,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: StreamBuilder<List<TransactionsRecord>>(
                                stream: queryTransactionsRecord(
                                  queryBuilder: (transactionsRecord) =>
                                      transactionsRecord
                                          .where('account',
                                              isEqualTo:
                                                  widget.account!.reference)
                                          .where('transactionOwner',
                                              isEqualTo: currentUserReference),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 42,
                                        height: 42,
                                        child: SpinKitChasingDots(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 42,
                                        ),
                                      ),
                                    );
                                  }
                                  List<TransactionsRecord>
                                      buttonTransactionsRecordList =
                                      snapshot.data!;
                                  return InkWell(
                                    onLongPress: () async {
                                      HapticFeedback.vibrate();
                                      await actions.deleteTransactions(
                                        buttonTransactionsRecordList.toList(),
                                      );
                                    },
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        setState(() => FFAppState()
                                            .dialogBoxReturn = false);
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: DialogBoxWidget(
                                                heading: 'Warning',
                                                body:
                                                    'You are about to delete all account and associated data from Evi. We cannot undo this.',
                                                buttonYes: 'Cancel',
                                                buttonNo: 'Delete Account',
                                                information: false,
                                                yesAction: () async {},
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));

                                        if (FFAppState().dialogBoxReturn) {
                                          return;
                                        }

                                        await actions.deleteTransactions(
                                          buttonTransactionsRecordList.toList(),
                                        );
                                        await UnlinkMonoCall.call(
                                          authID: widget.account!.authID,
                                        );
                                        await widget.account!.reference
                                            .delete();
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SettingsWidget(),
                                          ),
                                        );
                                      },
                                      text: 'Disconnect Account',
                                      icon: Icon(
                                        Icons.delete,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 60,
                                        color: Color(0xFFFF0003),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2Family,
                                              color: Colors.white,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2Family),
                                            ),
                                        elevation: 2,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
