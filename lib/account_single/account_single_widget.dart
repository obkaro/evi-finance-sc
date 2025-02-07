import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/account_data_refresh_widget.dart';
import '../components/dialog_box_widget.dart';
import '../components/empty_list_widget.dart';
import '../components/loading_empty_widget.dart';
import '../components/transaction_list_item_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'account_single_model.dart';
export 'account_single_model.dart';

class AccountSingleWidget extends StatefulWidget {
  const AccountSingleWidget({
    Key? key,
    this.account,
  }) : super(key: key);

  final AccountsRecord? account;

  @override
  _AccountSingleWidgetState createState() => _AccountSingleWidgetState();
}

class _AccountSingleWidgetState extends State<AccountSingleWidget>
    with TickerProviderStateMixin {
  late AccountSingleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'iconOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 2000.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountSingleModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AccountSingle'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((functions.addHoursToTimestamp(widget.account!.dateLinked!, 2) <
              getCurrentTimestamp) &&
          (widget.account!.lastSync == null)) {
        FFAppState().update(() {
          FFAppState().dialogBoxReturn = false;
        });
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: DialogBoxWidget(
                heading: 'Disconnect Account',
                body:
                    'We have attempted to fetch your account data from your bank, but have not recieved a response. This is usually due to temporary network issues with the bank. We recommend you cancel this request and try connecting your account again after some time. Sincere apologies for this inconvinience 🙏',
                buttonYes: 'Proceed',
                buttonNo: 'Wait',
                information: false,
                yesAction: () async {},
              ),
            );
          },
        ).then((value) => setState(() {}));

        if (FFAppState().dialogBoxReturn) {
          await MonoGroup.unlinkAccountCall.call(
            authID: widget.account!.authID,
          );
          await widget.account!.reference.delete();
          await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => NavBarPage(initialPage: 'Dashboard'),
            ),
            (r) => false,
          );
        }
      } else {
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

          logFirebaseEvent(
            'app_acct_data_refresh',
            parameters: {
              'user_email': currentUserEmail,
            },
          );
        } else {
          logFirebaseEvent(
            'app_acct_data_refresh',
            parameters: {
              'user_email': currentUserEmail,
            },
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: AuthUserStreamWidget(
            builder: (context) => StreamBuilder<List<CategoriesRecord>>(
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
                      _model.dataSyncResponse =
                          await MonoGroup.dataSyncCall.call(
                        authID: widget.account!.authID,
                      );
                      FFAppState().update(() {
                        FFAppState().dataSyncCode = getJsonField(
                          (_model.dataSyncResponse?.jsonBody ?? ''),
                          r'''$.code''',
                        ).toString();
                      });
                      if (FFAppState().dataSyncCode ==
                          'REAUTHORISATION_REQUIRED') {
                        // Action_ReauthCall
                        _model.reauthCode =
                            await MonoGroup.reauthenticateCall.call(
                          authID: widget.account!.authID,
                        );
                        // Action_ReauthAcct
                        await actions.flutterMonoReauth(
                          context,
                          getJsonField(
                            (_model.reauthCode?.jsonBody ?? ''),
                            r'''$.token''',
                          ).toString(),
                          widget.account!,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Refreshing transactions. This might take a minute...',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText2Family,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText2Family),
                                  ),
                            ),
                            duration: Duration(milliseconds: 8000),
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        );
                      } else {
                        if (FFAppState().dataSyncCode == 'SYNC_SUCCESSFUL') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Refreshing transactions. This might take a minute...',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText2Family,
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2Family),
                                    ),
                              ),
                              duration: Duration(milliseconds: 8000),
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Synchronization Error: Please try again later',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText2Family,
                                      color: Color(0xFFFF0004),
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2Family),
                                    ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
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
                          StreamBuilder<AccountsRecord>(
                            stream: AccountsRecord.getDocument(
                                widget.account!.reference),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Container(
                                    width: 0,
                                    height: 0,
                                    child: LoadingEmptyWidget(),
                                  ),
                                );
                              }
                              final containerAccountsRecord = snapshot.data!;
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible:
                                      containerAccountsRecord.awaitingWebhook ??
                                          true,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.sync,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 24,
                                            ).animateOnPageLoad(animationsMap[
                                                'iconOnPageLoadAnimation']!),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 0),
                                                child: Text(
                                                  'Fetching account data. Please check back soon.',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
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
                                              width: 36,
                                              height: 36,
                                              child: SpinKitThreeBounce(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 36,
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
                                                              valueOrDefault<
                                                                  String>(
                                                            columnAccountsRecord
                                                                .accountLogo,
                                                            'https://media.tenor.com/On7kvXhzml4AAAAj/loading-gif.gif',
                                                          ),
                                                          width: 80,
                                                          height: 80,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      if (columnAccountsRecord
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
                              child: Visibility(
                                visible: widget.account!.lastSync != null,
                                child: StreamBuilder<List<TransactionsRecord>>(
                                  stream: queryTransactionsRecord(
                                    queryBuilder: (transactionsRecord) =>
                                        transactionsRecord
                                            .where('transactionOwner',
                                                isEqualTo: currentUserReference)
                                            .where('account',
                                                isEqualTo:
                                                    widget.account!.reference)
                                            .orderBy('trasactionDate',
                                                descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 36,
                                          height: 36,
                                          child: SpinKitThreeBounce(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 36,
                                          ),
                                        ),
                                      );
                                    }
                                    List<TransactionsRecord>
                                        listViewTransactionsRecordList =
                                        snapshot.data!;
                                    if (listViewTransactionsRecordList
                                        .isEmpty) {
                                      return Center(
                                        child: Container(
                                          width: double.infinity,
                                          height: 300,
                                          child: EmptyListWidget(
                                            text:
                                                'Connect an account to import transactions',
                                            icon: Icon(
                                              Icons.compare_arrows_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              'Keyqqm_${listViewIndex}_of_${listViewTransactionsRecordList.length}'),
                                          transactionDoc:
                                              listViewTransactionsRecord,
                                        );
                                      },
                                    );
                                  },
                                ),
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
                                        width: 36,
                                        height: 36,
                                        child: SpinKitThreeBounce(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 36,
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
                                        FFAppState().update(() {
                                          FFAppState().dialogBoxReturn = false;
                                        });
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
                                        await MonoGroup.unlinkAccountCall.call(
                                          authID: widget.account!.authID,
                                        );
                                        await widget.account!.reference
                                            .delete();
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NavBarPage(
                                                initialPage: 'Dashboard'),
                                          ),
                                          (r) => false,
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
