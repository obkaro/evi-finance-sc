import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_recurring_payment_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class RecurringPaymentsWidget extends StatefulWidget {
  const RecurringPaymentsWidget({Key? key}) : super(key: key);

  @override
  _RecurringPaymentsWidgetState createState() =>
      _RecurringPaymentsWidgetState();
}

class _RecurringPaymentsWidgetState extends State<RecurringPaymentsWidget> {
  SubscriptionsRecord? newRecurring;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'RecurringPayments'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'RecurringPayments',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
            automaticallyImplyLeading: false,
            title: Text(
              'Subscriptions',
              style: FlutterFlowTheme.of(context).title3.override(
                    fontFamily: FlutterFlowTheme.of(context).title3Family,
                    color: Colors.white,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final subscriptionsCreateData = createSubscriptionsRecordData(
                notification: true,
              );
              var subscriptionsRecordReference =
                  SubscriptionsRecord.collection.doc();
              await subscriptionsRecordReference.set(subscriptionsCreateData);
              newRecurring = SubscriptionsRecord.getDocumentFromData(
                  subscriptionsCreateData, subscriptionsRecordReference);
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: AddRecurringPaymentWidget(
                      recurringPayment: newRecurring,
                    ),
                  );
                },
              );

              setState(() {});
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            elevation: 3,
            child: Icon(
              Icons.add_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: StreamBuilder<List<SubscriptionsRecord>>(
                      stream: querySubscriptionsRecord(
                        queryBuilder: (subscriptionsRecord) =>
                            subscriptionsRecord.where('owner',
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<SubscriptionsRecord>
                            containerSubscriptionsRecordList = snapshot.data!;
                        return Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 14,
                                color: FlutterFlowTheme.of(context).shadowGray,
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            child: DefaultTabController(
                              length: 2,
                              initialIndex: 0,
                              child: Column(
                                children: [
                                  TabBar(
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    labelPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                    labelStyle:
                                        FlutterFlowTheme.of(context).title3,
                                    indicatorColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    indicatorWeight: 3,
                                    tabs: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 16, 0),
                                            child: Icon(
                                              Icons.radio_button_off_rounded,
                                              color: Color(0xFFFF0000),
                                              size: 16,
                                            ),
                                          ),
                                          Tab(
                                            text: 'Upcoming',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 16, 0),
                                            child: Icon(
                                              Icons.check_circle_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              size: 16,
                                            ),
                                          ),
                                          Tab(
                                            text: 'Paid',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Builder(
                                            builder: (context) {
                                              final subscriptions =
                                                  containerSubscriptionsRecordList
                                                      .toList();
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: List.generate(
                                                      subscriptions.length,
                                                      (subscriptionsIndex) {
                                                    final subscriptionsItem =
                                                        subscriptions[
                                                            subscriptionsIndex];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      8, 8, 8),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 60,
                                                                height: 60,
                                                                child: Stack(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(300),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            120,
                                                                        height:
                                                                            120,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child: Image
                                                                            .network(
                                                                          subscriptionsItem
                                                                              .icon!,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                child: AutoSizeText(
                                                                                  subscriptionsItem.name!.maybeHandleOverflow(
                                                                                    maxChars: 25,
                                                                                    replacement: '…',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).subtitle1,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'Next pay on: ${subscriptionsItem.expChargeDate?.toString()}',
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyText2,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            100,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                              child: AutoSizeText(
                                                                                formatNumber(
                                                                                  subscriptionsItem.expCharge.amount!,
                                                                                  formatType: FormatType.custom,
                                                                                  currency: '₦',
                                                                                  format: '###,###,###.0#',
                                                                                  locale: '',
                                                                                ).maybeHandleOverflow(
                                                                                  maxChars: 15,
                                                                                  replacement: '…',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).subtitle1Family,
                                                                                      fontSize: 16,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            AutoSizeText(
                                                                              formatNumber(
                                                                                subscriptionsItem.expCharge.amount!,
                                                                                formatType: FormatType.custom,
                                                                                currency: '₦',
                                                                                format: '###,###,###.0#',
                                                                                locale: '',
                                                                              ).maybeHandleOverflow(
                                                                                maxChars: 15,
                                                                                replacement: '…',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyText2,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(),
                                                      ],
                                                    );
                                                  }),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Builder(
                                            builder: (context) {
                                              final subscriptions =
                                                  containerSubscriptionsRecordList
                                                      .toList();
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: List.generate(
                                                      subscriptions.length,
                                                      (subscriptionsIndex) {
                                                    final subscriptionsItem =
                                                        subscriptions[
                                                            subscriptionsIndex];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      8, 8, 8),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 60,
                                                                height: 60,
                                                                child: Stack(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(300),
                                                                      ),
                                                                    ),
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        imageUrl:
                                                                            subscriptionsItem.icon!,
                                                                        width:
                                                                            40,
                                                                        height:
                                                                            40,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                child: AutoSizeText(
                                                                                  subscriptionsItem.name!.maybeHandleOverflow(
                                                                                    maxChars: 25,
                                                                                    replacement: '…',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).subtitle1,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'Last paid on: ${dateTimeFormat('MMMEd', subscriptionsItem.lastChargeDate)}',
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyText2,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            100,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                              child: AutoSizeText(
                                                                                formatNumber(
                                                                                  subscriptionsItem.lastCharge.amount!,
                                                                                  formatType: FormatType.custom,
                                                                                  currency: '₦',
                                                                                  format: '###,###,###.0#',
                                                                                  locale: '',
                                                                                ).maybeHandleOverflow(
                                                                                  maxChars: 15,
                                                                                  replacement: '…',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).subtitle1Family,
                                                                                      fontSize: 16,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            AutoSizeText(
                                                                              formatNumber(
                                                                                subscriptionsItem.lastCharge.amount!,
                                                                                formatType: FormatType.custom,
                                                                                currency: '₦',
                                                                                format: '###,###,###.0#',
                                                                                locale: '',
                                                                              ).maybeHandleOverflow(
                                                                                maxChars: 15,
                                                                                replacement: '…',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyText2,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(),
                                                      ],
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
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
