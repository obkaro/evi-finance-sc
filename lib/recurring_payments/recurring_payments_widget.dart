import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_recurring_payment_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../subscription_details/subscription_details_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
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
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).secondaryPrimary),
        automaticallyImplyLeading: true,
        title: Text(
          'Subscriptions',
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
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
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: StreamBuilder<List<SubscriptionsRecord>>(
                    stream: querySubscriptionsRecord(
                      queryBuilder: (subscriptionsRecord) => subscriptionsRecord
                          .where('owner', isEqualTo: currentUserReference),
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
                      List<SubscriptionsRecord>
                          containerSubscriptionsRecordList = snapshot.data!;
                      return Material(
                        color: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(
                              color: Colors.transparent,
                              width: 0,
                            ),
                          ),
                          child: Builder(
                            builder: (context) {
                              final subs =
                                  containerSubscriptionsRecordList.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: subs.length,
                                itemBuilder: (context, subsIndex) {
                                  final subsItem = subs[subsIndex];
                                  return InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SubscriptionDetailsWidget(
                                            subscription: subsItem,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24, 0, 24, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 16, 0, 16),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 16, 0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      8, 8, 8),
                                                          child: Hero(
                                                            tag: subsItem.icon!,
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    subsItem
                                                                        .icon!,
                                                                width: 44,
                                                                height: 44,
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
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
                                                                        8),
                                                            child: Text(
                                                              functions
                                                                  .toTitleCase(
                                                                      subsItem
                                                                          .name!),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1,
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Due: ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
                                                              ),
                                                              Text(
                                                                dateTimeFormat(
                                                                    'MMMEd',
                                                                    subsItem
                                                                        .expChargeDate!),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2Family,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyText2Family),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .formatTransCurrency(
                                                                  subsItem
                                                                      .expCharge
                                                                      .amount),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                height: 1,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .fadedDivider,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
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
  }
}
