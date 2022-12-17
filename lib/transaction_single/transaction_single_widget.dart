import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_recurring_payment_widget.dart';
import '../components/create_custom_category_widget.dart';
import '../components/loading_empty_widget.dart';
import '../components/new_income_source_widget.dart';
import '../components/text_transaction_type_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransactionSingleWidget extends StatefulWidget {
  const TransactionSingleWidget({
    Key? key,
    this.transaction,
  }) : super(key: key);

  final TransactionsRecord? transaction;

  @override
  _TransactionSingleWidgetState createState() =>
      _TransactionSingleWidgetState();
}

class _TransactionSingleWidgetState extends State<TransactionSingleWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'wrapOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 250.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'wrapOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 250.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'wrapOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 250.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  DateTime? datePicked;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
          'Transaction Details',
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
          child: StreamBuilder<TransactionsRecord>(
            stream:
                TransactionsRecord.getDocument(widget.transaction!.reference),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: LoadingEmptyWidget(),
                );
              }
              final columnTransactionsRecord = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                      child: FutureBuilder<AccountsRecord>(
                        future: AccountsRecord.getDocumentOnce(
                            widget.transaction!.account!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: LoadingEmptyWidget(),
                            );
                          }
                          final columnAccountsRecord = snapshot.data!;
                          return SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 16, 0),
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        child: Stack(
                                          alignment: AlignmentDirectional(0, 0),
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          300),
                                                ),
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
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    columnTransactionsRecord
                                                        .accountDetails.logo!,
                                                width: 48,
                                                height: 48,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                              child: Text(
                                                functions.formatTransCurrency(
                                                    widget.transaction!
                                                        .transactionAmount),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle1Family,
                                                          fontSize: 20,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1Family),
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            TextTransactionTypeWidget(
                                              transactionType: widget
                                                  .transaction!.transactionType,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 16),
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
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    16, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          4),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Date',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 48,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Wrap(
                                                                    spacing: 0,
                                                                    runSpacing:
                                                                        0,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        WrapCrossAlignment
                                                                            .start,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    runAlignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    verticalDirection:
                                                                        VerticalDirection
                                                                            .down,
                                                                    clipBehavior:
                                                                        Clip.none,
                                                                    children: [
                                                                      Text(
                                                                        dateTimeFormat(
                                                                          'MMMMEEEEd',
                                                                          widget
                                                                              .transaction!
                                                                              .trasactionDate!,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle1
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).subtitle1Family,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle1Family),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () async {
                                                        final _datePickedTime =
                                                            await showTimePicker(
                                                          context: context,
                                                          initialTime: TimeOfDay
                                                              .fromDateTime(widget
                                                                  .transaction!
                                                                  .trasactionDate!),
                                                        );
                                                        if (_datePickedTime !=
                                                            null) {
                                                          setState(
                                                            () => datePicked =
                                                                DateTime(
                                                              widget
                                                                  .transaction!
                                                                  .trasactionDate!
                                                                  .year,
                                                              widget
                                                                  .transaction!
                                                                  .trasactionDate!
                                                                  .month,
                                                              widget
                                                                  .transaction!
                                                                  .trasactionDate!
                                                                  .day,
                                                              _datePickedTime
                                                                  .hour,
                                                              _datePickedTime
                                                                  .minute,
                                                            ),
                                                          );
                                                        }

                                                        final transactionsUpdateData =
                                                            createTransactionsRecordData(
                                                          trasactionDate:
                                                              datePicked,
                                                        );
                                                        await widget
                                                            .transaction!
                                                            .reference
                                                            .update(
                                                                transactionsUpdateData);
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        4),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Time',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 48,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .lightPrimary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .fadedDivider,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          8,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Wrap(
                                                                    spacing: 0,
                                                                    runSpacing:
                                                                        0,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        WrapCrossAlignment
                                                                            .start,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    runAlignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    verticalDirection:
                                                                        VerticalDirection
                                                                            .down,
                                                                    clipBehavior:
                                                                        Clip.none,
                                                                    children: [
                                                                      Text(
                                                                        dateTimeFormat(
                                                                          'jm',
                                                                          widget
                                                                              .transaction!
                                                                              .trasactionDate!,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle1,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .edit_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 16,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 10),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 4),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Narration',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Wrap(
                                                            spacing: 0,
                                                            runSpacing: 0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: [
                                                              Text(
                                                                widget
                                                                    .transaction!
                                                                    .transactionNarration!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .subtitle1Family,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).subtitle1Family),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 10),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 4),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Account',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        2),
                                                            child: Wrap(
                                                              spacing: 0,
                                                              runSpacing: 0,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                              direction: Axis
                                                                  .horizontal,
                                                              runAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalDirection:
                                                                  VerticalDirection
                                                                      .down,
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: [
                                                                Text(
                                                                  columnAccountsRecord
                                                                      .accountName!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).subtitle1Family,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle1Family),
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Wrap(
                                                            spacing: 0,
                                                            runSpacing: 0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: [
                                                              Text(
                                                                columnAccountsRecord
                                                                    .accountNumber!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .subtitle1Family,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).subtitle1Family),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (widget
                                                  .transaction!.balanceAfter !=
                                              0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 10),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
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
                                                          'Balance After',
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
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Wrap(
                                                              spacing: 0,
                                                              runSpacing: 0,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                              direction: Axis
                                                                  .horizontal,
                                                              runAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalDirection:
                                                                  VerticalDirection
                                                                      .down,
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: [
                                                                Text(
                                                                  functions.formatTransCurrency(widget
                                                                      .transaction!
                                                                      .balanceAfter),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).subtitle1Family,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle1Family),
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          if (columnTransactionsRecord
                                                  .transactionCategory !=
                                              null)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 10),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
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
                                                          'Category',
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        columnTransactionsRecord
                                                            .categoryDetails
                                                            .name!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1,
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          if (columnTransactionsRecord
                                                                  .recurringRef !=
                                                              null) {
                                                            final subscriptionsUpdateData =
                                                                {
                                                              'narrations':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                columnTransactionsRecord
                                                                    .transactionNarration
                                                              ]),
                                                              'transactions':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                columnTransactionsRecord
                                                                    .reference
                                                              ]),
                                                            };
                                                            await columnTransactionsRecord
                                                                .recurringRef!
                                                                .update(
                                                                    subscriptionsUpdateData);
                                                            // Action_CategorizeTrans

                                                            final transactionsUpdateData =
                                                                {
                                                              ...createTransactionsRecordData(
                                                                categoryDetails:
                                                                    createCategoryDetailsStruct(
                                                                        delete:
                                                                            true),
                                                                subscriptionDetails:
                                                                    createSubscriptionDetailsStruct(
                                                                        delete:
                                                                            true),
                                                                isAssigned:
                                                                    false,
                                                              ),
                                                              'transactionCategory':
                                                                  FieldValue
                                                                      .delete(),
                                                              'recurringRef':
                                                                  FieldValue
                                                                      .delete(),
                                                              'transactionBudget':
                                                                  FieldValue
                                                                      .delete(),
                                                              'dateAssigned':
                                                                  FieldValue
                                                                      .delete(),
                                                            };
                                                            await widget
                                                                .transaction!
                                                                .reference
                                                                .update(
                                                                    transactionsUpdateData);
                                                          } else {
                                                            // Action_CategorizeTrans

                                                            final transactionsUpdateData =
                                                                {
                                                              ...createTransactionsRecordData(
                                                                categoryDetails:
                                                                    createCategoryDetailsStruct(
                                                                        delete:
                                                                            true),
                                                                isAssigned:
                                                                    false,
                                                              ),
                                                              'transactionCategory':
                                                                  FieldValue
                                                                      .delete(),
                                                              'transactionBudget':
                                                                  FieldValue
                                                                      .delete(),
                                                              'dateAssigned':
                                                                  FieldValue
                                                                      .delete(),
                                                            };
                                                            await widget
                                                                .transaction!
                                                                .reference
                                                                .update(
                                                                    transactionsUpdateData);
                                                          }
                                                        },
                                                        child: Icon(
                                                          Icons.cancel_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          if (columnTransactionsRecord
                                                  .recurringRef !=
                                              null)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 10),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        4,
                                                                        0),
                                                            child: Icon(
                                                              Icons
                                                                  .credit_card_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24,
                                                            ),
                                                          ),
                                                          Text(
                                                            columnTransactionsRecord
                                                                .subscriptionDetails
                                                                .name!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle1,
                                                          ),
                                                        ],
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          // Action_CategorizeTrans

                                                          final transactionsUpdateData =
                                                              {
                                                            ...createTransactionsRecordData(
                                                              subscriptionDetails:
                                                                  createSubscriptionDetailsStruct(
                                                                      delete:
                                                                          true),
                                                            ),
                                                            'recurringRef':
                                                                FieldValue
                                                                    .delete(),
                                                          };
                                                          await widget
                                                              .transaction!
                                                              .reference
                                                              .update(
                                                                  transactionsUpdateData);

                                                          final subscriptionsUpdateData =
                                                              {
                                                            'narrations':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              columnTransactionsRecord
                                                                  .transactionNarration
                                                            ]),
                                                            'transactions':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              columnTransactionsRecord
                                                                  .reference
                                                            ]),
                                                          };
                                                          await columnTransactionsRecord
                                                              .recurringRef!
                                                              .update(
                                                                  subscriptionsUpdateData);
                                                        },
                                                        child: Icon(
                                                          Icons.cancel_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          if (columnTransactionsRecord
                                                  .incomeCategory !=
                                              null)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 10),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                          'Income Source',
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      StreamBuilder<
                                                          IncomeCategoriesRecord>(
                                                        stream: IncomeCategoriesRecord
                                                            .getDocument(
                                                                columnTransactionsRecord
                                                                    .incomeCategory!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 36,
                                                                height: 36,
                                                                child:
                                                                    SpinKitThreeBounce(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 36,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final textIncomeCategoriesRecord =
                                                              snapshot.data!;
                                                          return Text(
                                                            textIncomeCategoriesRecord
                                                                .categoryName!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle1,
                                                          );
                                                        },
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          final transactionsUpdateData =
                                                              {
                                                            ...createTransactionsRecordData(
                                                              incomeDetails:
                                                                  createIncomeDetailsStruct(
                                                                      delete:
                                                                          true),
                                                              isAssigned: false,
                                                            ),
                                                            'incomeCategory':
                                                                FieldValue
                                                                    .delete(),
                                                            'dateAssigned':
                                                                FieldValue
                                                                    .delete(),
                                                          };
                                                          await columnTransactionsRecord
                                                              .reference
                                                              .update(
                                                                  transactionsUpdateData);
                                                        },
                                                        child: Icon(
                                                          Icons.cancel_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (columnTransactionsRecord
                                              .transactionType ==
                                          'debit')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 16, 0),
                                                child: Container(
                                                  width: double.infinity,
                                                  color: Color(0x00000000),
                                                  child: ExpandableNotifier(
                                                    initialExpanded: false,
                                                    child: ExpandablePanel(
                                                      header: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16,
                                                                    16, 16, 16),
                                                        child: Text(
                                                          'Assign Transaction',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1,
                                                        ),
                                                      ),
                                                      collapsed: Container(
                                                        width: 100,
                                                        height: 0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      expanded: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 16),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            16),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            setState(() {
                                                                              FFAppState().showCategoryOrSub = 'category';
                                                                            });
                                                                          },
                                                                          text:
                                                                              'Categories',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                130,
                                                                            height:
                                                                                40,
                                                                            color: FFAppState().showCategoryOrSub == 'category'
                                                                                ? FlutterFlowTheme.of(context).primaryColor
                                                                                : FlutterFlowTheme.of(context).fadedDivider,
                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                  color: FFAppState().showCategoryOrSub == 'category' ? Colors.white : FlutterFlowTheme.of(context).secondaryText,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                ),
                                                                            elevation:
                                                                                0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            setState(() {
                                                                              FFAppState().showCategoryOrSub = 'sub';
                                                                            });
                                                                          },
                                                                          text:
                                                                              'Subscriptions',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                130,
                                                                            height:
                                                                                40,
                                                                            color: FFAppState().showCategoryOrSub == 'sub'
                                                                                ? FlutterFlowTheme.of(context).primaryColor
                                                                                : FlutterFlowTheme.of(context).fadedDivider,
                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                  color: FFAppState().showCategoryOrSub == 'sub' ? Colors.white : FlutterFlowTheme.of(context).secondaryText,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                ),
                                                                            elevation:
                                                                                0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child: Stack(
                                                                  children: [
                                                                    if (FFAppState()
                                                                            .showCategoryOrSub ==
                                                                        'category')
                                                                      AuthUserStreamWidget(
                                                                        child: FutureBuilder<
                                                                            List<CategoriesRecord>>(
                                                                          future:
                                                                              queryCategoriesRecordOnce(
                                                                            parent:
                                                                                currentUserDocument!.activeBudget,
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: Container(
                                                                                  height: 72,
                                                                                  child: LoadingEmptyWidget(),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<CategoriesRecord>
                                                                                wrapCategoriesRecordList =
                                                                                snapshot.data!;
                                                                            return Wrap(
                                                                              spacing: 8,
                                                                              runSpacing: 8,
                                                                              alignment: WrapAlignment.start,
                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                              direction: Axis.horizontal,
                                                                              runAlignment: WrapAlignment.start,
                                                                              verticalDirection: VerticalDirection.down,
                                                                              clipBehavior: Clip.none,
                                                                              children: List.generate(wrapCategoriesRecordList.length, (wrapIndex) {
                                                                                final wrapCategoriesRecord = wrapCategoriesRecordList[wrapIndex];
                                                                                return FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    final transactionsUpdateData = createTransactionsRecordData(
                                                                                      transactionCategory: wrapCategoriesRecord.reference,
                                                                                      transactionBudget: currentUserDocument!.activeBudget,
                                                                                      categoryDetails: createCategoryDetailsStruct(
                                                                                        name: wrapCategoriesRecord.categoryName,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                      isAssigned: true,
                                                                                      dateAssigned: getCurrentTimestamp,
                                                                                    );
                                                                                    await columnTransactionsRecord.reference.update(transactionsUpdateData);
                                                                                    ScaffoldMessenger.of(context).clearSnackBars();
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          'Transaction assigned',
                                                                                          style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText2Family,
                                                                                                color: Colors.white,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                                                                              ),
                                                                                        ),
                                                                                        duration: Duration(milliseconds: 1500),
                                                                                        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                  text: wrapCategoriesRecord.categoryName!,
                                                                                  options: FFButtonOptions(
                                                                                    height: 32,
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                        ),
                                                                                    elevation: 0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(32),
                                                                                  ),
                                                                                  showLoadingIndicator: false,
                                                                                );
                                                                              }),
                                                                            ).animateOnPageLoad(animationsMap['wrapOnPageLoadAnimation1']!);
                                                                          },
                                                                        ),
                                                                      ),
                                                                    if (FFAppState()
                                                                            .showCategoryOrSub ==
                                                                        'sub')
                                                                      FutureBuilder<
                                                                          List<
                                                                              SubscriptionsRecord>>(
                                                                        future:
                                                                            querySubscriptionsRecordOnce(
                                                                          queryBuilder: (subscriptionsRecord) => subscriptionsRecord.where(
                                                                              'owner',
                                                                              isEqualTo: currentUserReference),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: Container(
                                                                                height: 72,
                                                                                child: LoadingEmptyWidget(),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<SubscriptionsRecord>
                                                                              wrapSubscriptionsRecordList =
                                                                              snapshot.data!;
                                                                          return Wrap(
                                                                            spacing:
                                                                                8,
                                                                            runSpacing:
                                                                                8,
                                                                            alignment:
                                                                                WrapAlignment.start,
                                                                            crossAxisAlignment:
                                                                                WrapCrossAlignment.start,
                                                                            direction:
                                                                                Axis.horizontal,
                                                                            runAlignment:
                                                                                WrapAlignment.start,
                                                                            verticalDirection:
                                                                                VerticalDirection.down,
                                                                            clipBehavior:
                                                                                Clip.none,
                                                                            children:
                                                                                List.generate(wrapSubscriptionsRecordList.length, (wrapIndex) {
                                                                              final wrapSubscriptionsRecord = wrapSubscriptionsRecordList[wrapIndex];
                                                                              return FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  if (widget.transaction!.recurringRef != null) {
                                                                                    await actions.normalizeTransSub(
                                                                                      widget.transaction!,
                                                                                    );

                                                                                    final transactionsUpdateData = createTransactionsRecordData(
                                                                                      transactionCategory: wrapSubscriptionsRecord.category,
                                                                                      transactionBudget: currentUserDocument!.activeBudget,
                                                                                      recurringRef: wrapSubscriptionsRecord.reference,
                                                                                      categoryDetails: createCategoryDetailsStruct(
                                                                                        name: wrapSubscriptionsRecord.categoryDetails.name,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                      subscriptionDetails: createSubscriptionDetailsStruct(
                                                                                        name: wrapSubscriptionsRecord.name,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                      isAssigned: true,
                                                                                      dateAssigned: getCurrentTimestamp,
                                                                                    );
                                                                                    await widget.transaction!.reference.update(transactionsUpdateData);
                                                                                    if (wrapSubscriptionsRecord.lastChargeDate != null) {
                                                                                      if (widget.transaction!.trasactionDate! > wrapSubscriptionsRecord.lastChargeDate!) {
                                                                                        final subscriptionsUpdateData = {
                                                                                          ...createSubscriptionsRecordData(
                                                                                            lastChargeDate: widget.transaction!.trasactionDate,
                                                                                            lastCharge: createMoneyStruct(
                                                                                              amount: widget.transaction!.transactionAmount,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                            expChargeDate: functions.addDaysToDate(widget.transaction!.trasactionDate, functions.setNewExpectedSubDate(wrapSubscriptionsRecord)),
                                                                                          ),
                                                                                          'transactions': FieldValue.arrayUnion([
                                                                                            widget.transaction!.reference
                                                                                          ]),
                                                                                          'narrations': FieldValue.arrayUnion([
                                                                                            widget.transaction!.transactionNarration
                                                                                          ]),
                                                                                        };
                                                                                        await wrapSubscriptionsRecord.reference.update(subscriptionsUpdateData);
                                                                                      } else {
                                                                                        final subscriptionsUpdateData = {
                                                                                          'transactions': FieldValue.arrayUnion([
                                                                                            widget.transaction!.reference
                                                                                          ]),
                                                                                          'narrations': FieldValue.arrayUnion([
                                                                                            widget.transaction!.transactionNarration
                                                                                          ]),
                                                                                        };
                                                                                        await wrapSubscriptionsRecord.reference.update(subscriptionsUpdateData);
                                                                                      }
                                                                                    } else {
                                                                                      final subscriptionsUpdateData = {
                                                                                        ...createSubscriptionsRecordData(
                                                                                          lastChargeDate: widget.transaction!.trasactionDate,
                                                                                          lastCharge: createMoneyStruct(
                                                                                            amount: widget.transaction!.transactionAmount,
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                          expChargeDate: functions.addDaysToDate(widget.transaction!.trasactionDate, functions.setNewExpectedSubDate(wrapSubscriptionsRecord)),
                                                                                        ),
                                                                                        'transactions': FieldValue.arrayUnion([
                                                                                          widget.transaction!.reference
                                                                                        ]),
                                                                                        'narrations': FieldValue.arrayUnion([
                                                                                          widget.transaction!.transactionNarration
                                                                                        ]),
                                                                                      };
                                                                                      await wrapSubscriptionsRecord.reference.update(subscriptionsUpdateData);
                                                                                    }
                                                                                  } else {
                                                                                    final transactionsUpdateData = createTransactionsRecordData(
                                                                                      transactionCategory: wrapSubscriptionsRecord.category,
                                                                                      transactionBudget: currentUserDocument!.activeBudget,
                                                                                      recurringRef: wrapSubscriptionsRecord.reference,
                                                                                      categoryDetails: createCategoryDetailsStruct(
                                                                                        name: wrapSubscriptionsRecord.name,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                      subscriptionDetails: createSubscriptionDetailsStruct(
                                                                                        name: wrapSubscriptionsRecord.name,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                      isAssigned: true,
                                                                                      dateAssigned: getCurrentTimestamp,
                                                                                    );
                                                                                    await widget.transaction!.reference.update(transactionsUpdateData);
                                                                                    if (wrapSubscriptionsRecord.lastChargeDate != null) {
                                                                                      if (widget.transaction!.trasactionDate! > wrapSubscriptionsRecord.lastChargeDate!) {
                                                                                        final subscriptionsUpdateData = {
                                                                                          ...createSubscriptionsRecordData(
                                                                                            lastChargeDate: widget.transaction!.trasactionDate,
                                                                                            lastCharge: createMoneyStruct(
                                                                                              amount: widget.transaction!.transactionAmount,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                            expChargeDate: functions.addDaysToDate(widget.transaction!.trasactionDate, functions.setNewExpectedSubDate(wrapSubscriptionsRecord)),
                                                                                          ),
                                                                                          'transactions': FieldValue.arrayUnion([
                                                                                            widget.transaction!.reference
                                                                                          ]),
                                                                                          'narrations': FieldValue.arrayUnion([
                                                                                            widget.transaction!.transactionNarration
                                                                                          ]),
                                                                                        };
                                                                                        await wrapSubscriptionsRecord.reference.update(subscriptionsUpdateData);
                                                                                      } else {
                                                                                        final subscriptionsUpdateData = {
                                                                                          'transactions': FieldValue.arrayUnion([
                                                                                            widget.transaction!.reference
                                                                                          ]),
                                                                                          'narrations': FieldValue.arrayUnion([
                                                                                            widget.transaction!.transactionNarration
                                                                                          ]),
                                                                                        };
                                                                                        await wrapSubscriptionsRecord.reference.update(subscriptionsUpdateData);
                                                                                      }
                                                                                    } else {
                                                                                      final subscriptionsUpdateData = {
                                                                                        ...createSubscriptionsRecordData(
                                                                                          lastChargeDate: widget.transaction!.trasactionDate,
                                                                                          lastCharge: createMoneyStruct(
                                                                                            amount: widget.transaction!.transactionAmount,
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                          expChargeDate: functions.addDaysToDate(widget.transaction!.trasactionDate, functions.setNewExpectedSubDate(wrapSubscriptionsRecord)),
                                                                                        ),
                                                                                        'transactions': FieldValue.arrayUnion([
                                                                                          widget.transaction!.reference
                                                                                        ]),
                                                                                        'narrations': FieldValue.arrayUnion([
                                                                                          widget.transaction!.transactionNarration
                                                                                        ]),
                                                                                      };
                                                                                      await wrapSubscriptionsRecord.reference.update(subscriptionsUpdateData);
                                                                                    }
                                                                                  }

                                                                                  ScaffoldMessenger.of(context).clearSnackBars();
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Transaction assigned',
                                                                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText2Family,
                                                                                              color: Colors.white,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                                                                            ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 1500),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                text: wrapSubscriptionsRecord.name!,
                                                                                options: FFButtonOptions(
                                                                                  height: 32,
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                  elevation: 0,
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    width: 1,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(32),
                                                                                ),
                                                                                showLoadingIndicator: false,
                                                                              );
                                                                            }),
                                                                          ).animateOnPageLoad(
                                                                              animationsMap['wrapOnPageLoadAnimation2']!);
                                                                        },
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          16,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  AuthUserStreamWidget(
                                                                    child: FutureBuilder<
                                                                        BudgetsRecord>(
                                                                      future: BudgetsRecord.getDocumentOnce(
                                                                          currentUserDocument!
                                                                              .activeBudget!),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                Container(
                                                                              width: 40,
                                                                              height: 40,
                                                                              child: LoadingEmptyWidget(),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final iconButtonBudgetsRecord =
                                                                            snapshot.data!;
                                                                        return FlutterFlowIconButton(
                                                                          borderRadius:
                                                                              30,
                                                                          borderWidth:
                                                                              1,
                                                                          buttonSize:
                                                                              40,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.add,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                16,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            if (FFAppState().showCategoryOrSub ==
                                                                                'category') {
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: CreateCustomCategoryWidget(
                                                                                      budget: iconButtonBudgetsRecord,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));
                                                                            } else {
                                                                              if (FFAppState().showCategoryOrSub == 'sub') {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: AddRecurringPaymentWidget(),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              } else {
                                                                                return;
                                                                              }
                                                                            }
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      theme:
                                                          ExpandableThemeData(
                                                        tapHeaderToExpand: true,
                                                        tapBodyToExpand: true,
                                                        tapBodyToCollapse:
                                                            false,
                                                        headerAlignment:
                                                            ExpandablePanelHeaderAlignment
                                                                .center,
                                                        hasIcon: true,
                                                        expandIcon: Icons
                                                            .keyboard_arrow_down_rounded,
                                                        collapseIcon: Icons
                                                            .keyboard_arrow_up_rounded,
                                                        iconSize: 16,
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (columnTransactionsRecord
                                              .transactionType ==
                                          'credit')
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(32),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 0, 16, 0),
                                              child: Container(
                                                width: double.infinity,
                                                color: Color(0x00000000),
                                                child: ExpandableNotifier(
                                                  initialExpanded: false,
                                                  child: ExpandablePanel(
                                                    header: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 16,
                                                                  16, 16),
                                                      child: Text(
                                                        'Assign Transaction',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1,
                                                      ),
                                                    ),
                                                    collapsed: Container(
                                                      width: 100,
                                                      height: 0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                    expanded: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 16),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32),
                                                            ),
                                                            child: Visibility(
                                                              visible:
                                                                  columnTransactionsRecord
                                                                          .transactionType ==
                                                                      'credit',
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              16),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () {
                                                                                  print('Button pressed ...');
                                                                                },
                                                                                text: 'Income Sources',
                                                                                options: FFButtonOptions(
                                                                                  height: 40,
                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                        color: Colors.white,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                      ),
                                                                                  elevation: 0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(12),
                                                                                ),
                                                                                showLoadingIndicator: false,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 30,
                                                                              borderWidth: 1,
                                                                              buttonSize: 40,
                                                                              fillColor: FlutterFlowTheme.of(context).primaryColor,
                                                                              icon: Icon(
                                                                                Icons.add,
                                                                                color: Colors.white,
                                                                                size: 16,
                                                                              ),
                                                                              onPressed: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: NewIncomeSourceWidget(),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              8),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              IncomeCategoriesRecord>>(
                                                                        stream:
                                                                            queryIncomeCategoriesRecord(
                                                                          parent:
                                                                              currentUserReference,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: Center(
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: 32,
                                                                                  child: LoadingEmptyWidget(),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<IncomeCategoriesRecord>
                                                                              wrapIncomeCategoriesRecordList =
                                                                              snapshot.data!;
                                                                          return Wrap(
                                                                            spacing:
                                                                                8,
                                                                            runSpacing:
                                                                                8,
                                                                            alignment:
                                                                                WrapAlignment.start,
                                                                            crossAxisAlignment:
                                                                                WrapCrossAlignment.start,
                                                                            direction:
                                                                                Axis.horizontal,
                                                                            runAlignment:
                                                                                WrapAlignment.start,
                                                                            verticalDirection:
                                                                                VerticalDirection.down,
                                                                            clipBehavior:
                                                                                Clip.none,
                                                                            children:
                                                                                List.generate(wrapIncomeCategoriesRecordList.length, (wrapIndex) {
                                                                              final wrapIncomeCategoriesRecord = wrapIncomeCategoriesRecordList[wrapIndex];
                                                                              return FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  final transactionsUpdateData = createTransactionsRecordData(
                                                                                    incomeCategory: wrapIncomeCategoriesRecord.reference,
                                                                                    incomeDetails: createIncomeDetailsStruct(
                                                                                      name: wrapIncomeCategoriesRecord.categoryName,
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                    isAssigned: true,
                                                                                    dateAssigned: getCurrentTimestamp,
                                                                                  );
                                                                                  await columnTransactionsRecord.reference.update(transactionsUpdateData);
                                                                                  ScaffoldMessenger.of(context).clearSnackBars();
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Transaction assigned',
                                                                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText2Family,
                                                                                              color: Colors.white,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                                                                            ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 1500),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                text: wrapIncomeCategoriesRecord.categoryName!,
                                                                                options: FFButtonOptions(
                                                                                  height: 32,
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                  elevation: 0,
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    width: 1,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(32),
                                                                                ),
                                                                                showLoadingIndicator: false,
                                                                              );
                                                                            }),
                                                                          ).animateOnPageLoad(
                                                                              animationsMap['wrapOnPageLoadAnimation3']!);
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    theme: ExpandableThemeData(
                                                      tapHeaderToExpand: true,
                                                      tapBodyToExpand: true,
                                                      tapBodyToCollapse: false,
                                                      headerAlignment:
                                                          ExpandablePanelHeaderAlignment
                                                              .center,
                                                      hasIcon: true,
                                                      expandIcon: Icons
                                                          .keyboard_arrow_down_rounded,
                                                      collapseIcon: Icons
                                                          .keyboard_arrow_up_rounded,
                                                      iconSize: 16,
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
