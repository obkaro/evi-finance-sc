import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_recurring_payment_widget.dart';
import '../components/empty_list_widget.dart';
import '../components/loading_empty_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../subscription_details/subscription_details_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class RecurringPaymentsWidget extends StatefulWidget {
  const RecurringPaymentsWidget({Key? key}) : super(key: key);

  @override
  _RecurringPaymentsWidgetState createState() =>
      _RecurringPaymentsWidgetState();
}

class _RecurringPaymentsWidgetState extends State<RecurringPaymentsWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
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
                          .where('owner', isEqualTo: currentUserReference)
                          .orderBy('expChargeDate', descending: true),
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
                              if (subs.isEmpty) {
                                return Center(
                                  child: Container(
                                    width: double.infinity,
                                    height: 300,
                                    child: EmptyListWidget(
                                      text:
                                          'No subscriptions added yet. Use the + button to create a new subsscription.',
                                      icon: Icon(
                                        Icons.credit_card,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 73,
                                      ),
                                    ),
                                  ),
                                );
                              }
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
                                                            tag: valueOrDefault<
                                                                String>(
                                                              subsItem.icon,
                                                              'https://firebasestorage.googleapis.com/v0/b/evi-finance-prod.appspot.com/o/cms_uploads%2Fdefaultimages%2F1664354213902000%2Fcredit-card-icon-png-4401.png?alt=media&token=baaa1d09-a0f9-48ce-8f45-720785cdb67e' +
                                                                  '$subsIndex',
                                                            ),
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
                                                                    valueOrDefault<
                                                                        String>(
                                                                  subsItem.icon,
                                                                  'https://firebasestorage.googleapis.com/v0/b/evi-finance-prod.appspot.com/o/cms_uploads%2Fdefaultimages%2F1664354213902000%2Fcredit-card-icon-png-4401.png?alt=media&token=baaa1d09-a0f9-48ce-8f45-720785cdb67e',
                                                                ),
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
                                                                      .expChargeDate!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
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
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!);
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
