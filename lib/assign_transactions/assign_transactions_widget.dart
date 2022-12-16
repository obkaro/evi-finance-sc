import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_list_widget.dart';
import '../components/empty_loading_text_widget.dart';
import '../components/info_box_widget.dart';
import '../components/loading_empty_widget.dart';
import '../components/overlay_alert_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AssignTransactionsWidget extends StatefulWidget {
  const AssignTransactionsWidget({
    Key? key,
    this.transactions,
  }) : super(key: key);

  final List<TransactionsRecord>? transactions;

  @override
  _AssignTransactionsWidgetState createState() =>
      _AssignTransactionsWidgetState();
}

class _AssignTransactionsWidgetState extends State<AssignTransactionsWidget>
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
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().showQuickTransAssign) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: InfoBoxWidget(
                heading: 'Quickly Assign Transactions',
                body: 'Asingn multiple transactions in quick succession.',
                buttonText: 'Okay',
                showIcon: true,
                icon: Icon(
                  Icons.info_outline_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 72,
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));

        setState(() {
          FFAppState().showQuickTransAssign = false;
        });
      } else {
        return;
      }
    });
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
          'Assign Transactions',
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
          child: Stack(
            children: [
              StreamBuilder<List<TransactionsRecord>>(
                stream: queryTransactionsRecord(
                  queryBuilder: (transactionsRecord) => transactionsRecord
                      .where('transactionOwner',
                          isEqualTo: currentUserReference)
                      .where('isAssigned', isEqualTo: false),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: LoadingEmptyWidget(),
                      ),
                    );
                  }
                  List<TransactionsRecord> containerTransactionsRecordList =
                      snapshot.data!;
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: AuthUserStreamWidget(
                      child: FutureBuilder<List<CategoriesRecord>>(
                        future: queryCategoriesRecordOnce(
                          parent: currentUserDocument!.activeBudget,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: LoadingEmptyWidget(),
                            );
                          }
                          List<CategoriesRecord> containerCategoriesRecordList =
                              snapshot.data!;
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: FutureBuilder<List<IncomeCategoriesRecord>>(
                              future: queryIncomeCategoriesRecordOnce(
                                parent: currentUserReference,
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
                                List<IncomeCategoriesRecord>
                                    containerIncomeCategoriesRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(),
                                  child:
                                      FutureBuilder<List<SubscriptionsRecord>>(
                                    future: querySubscriptionsRecordOnce(
                                      queryBuilder: (subscriptionsRecord) =>
                                          subscriptionsRecord.where('owner',
                                              isEqualTo: currentUserReference),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: LoadingEmptyWidget(),
                                        );
                                      }
                                      List<SubscriptionsRecord>
                                          containerSubscriptionsRecordList =
                                          snapshot.data!;
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (containerTransactionsRecordList
                                                    .length >
                                                0)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 16, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'You have ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                    Text(
                                                      containerTransactionsRecordList
                                                          .length
                                                          .toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: Color(
                                                                    0xFFFF0000),
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                    ),
                                                    Text(
                                                      ' unassigned transactions',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 10),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final unassignedtransactions =
                                                          containerTransactionsRecordList
                                                              .toList();
                                                      if (unassignedtransactions
                                                          .isEmpty) {
                                                        return Center(
                                                          child:
                                                              EmptyListWidget(
                                                            text:
                                                                'Nice work ${valueOrDefault(currentUserDocument?.username, '')}, you have assigned all transactions. Keep it up!',
                                                            icon: Icon(
                                                              Icons.celebration,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 128,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            unassignedtransactions
                                                                .length,
                                                        itemBuilder: (context,
                                                            unassignedtransactionsIndex) {
                                                          final unassignedtransactionsItem =
                                                              unassignedtransactions[
                                                                  unassignedtransactionsIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20,
                                                                        10,
                                                                        20,
                                                                        10),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            32),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20,
                                                                            20,
                                                                            20,
                                                                            20),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          color:
                                                                              Color(0x00000000),
                                                                          child:
                                                                              ExpandableNotifier(
                                                                            initialExpanded:
                                                                                false,
                                                                            child:
                                                                                ExpandablePanel(
                                                                              header: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                                                                    child: Container(
                                                                                      width: 80,
                                                                                      height: 80,
                                                                                      child: Stack(
                                                                                        alignment: AlignmentDirectional(0, 0),
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0, 0),
                                                                                            child: Material(
                                                                                              color: Colors.transparent,
                                                                                              elevation: 0,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(300),
                                                                                              ),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                height: double.infinity,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Colors.white,
                                                                                                  borderRadius: BorderRadius.circular(300),
                                                                                                ),
                                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(12),
                                                                                            child: CachedNetworkImage(
                                                                                              imageUrl: unassignedtransactionsItem.accountDetails.logo!,
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
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                                                                            child: Text(
                                                                                              functions.formatTransCurrency(unassignedtransactionsItem.transactionAmount),
                                                                                              style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).subtitle1Family,
                                                                                                    fontSize: 20,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle1Family),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            dateTimeFormat(
                                                                                              'MMMMEEEEd',
                                                                                              unassignedtransactionsItem.trasactionDate!,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Stack(
                                                                                    children: [
                                                                                      if (unassignedtransactionsItem.transactionType == 'credit')
                                                                                        Icon(
                                                                                          Icons.call_made_rounded,
                                                                                          color: valueOrDefault<Color>(
                                                                                            unassignedtransactionsItem.transactionType == 'debit' ? FlutterFlowTheme.of(context).tertiaryColor : Color(0xFFFF0000),
                                                                                            FlutterFlowTheme.of(context).tertiaryColor,
                                                                                          ),
                                                                                          size: 32,
                                                                                        ),
                                                                                      if (unassignedtransactionsItem.transactionType == 'debit')
                                                                                        Icon(
                                                                                          Icons.call_received_rounded,
                                                                                          color: valueOrDefault<Color>(
                                                                                            unassignedtransactionsItem.transactionType == 'debit' ? FlutterFlowTheme.of(context).tertiaryColor : Color(0xFFFF0000),
                                                                                            FlutterFlowTheme.of(context).tertiaryColor,
                                                                                          ),
                                                                                          size: 32,
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              collapsed: Container(
                                                                                width: 100,
                                                                                height: 0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                              ),
                                                                              expanded: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(32),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Wrap(
                                                                                                              spacing: 0,
                                                                                                              runSpacing: 0,
                                                                                                              alignment: WrapAlignment.start,
                                                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                              direction: Axis.horizontal,
                                                                                                              runAlignment: WrapAlignment.start,
                                                                                                              verticalDirection: VerticalDirection.down,
                                                                                                              clipBehavior: Clip.none,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  unassignedtransactionsItem.transactionNarration!,
                                                                                                                  style: FlutterFlowTheme.of(context).subtitle1,
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
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Divider(
                                                                                    indent: 16,
                                                                                    endIndent: 16,
                                                                                    color: FlutterFlowTheme.of(context).fadedDivider,
                                                                                  ),
                                                                                  Stack(
                                                                                    children: [
                                                                                      if (unassignedtransactionsItem.transactionType == 'debit')
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: MediaQuery.of(context).size.width,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 16),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                                        child: FFButtonWidget(
                                                                                                          onPressed: () async {
                                                                                                            setState(() {
                                                                                                              FFAppState().showCategoryOrSub = 'category';
                                                                                                            });
                                                                                                          },
                                                                                                          text: 'Categories',
                                                                                                          options: FFButtonOptions(
                                                                                                            width: 130,
                                                                                                            height: 40,
                                                                                                            color: FFAppState().showCategoryOrSub == 'category' ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).fadedDivider,
                                                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                                                  color: FFAppState().showCategoryOrSub == 'category' ? Colors.white : FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                                                ),
                                                                                                            elevation: 0,
                                                                                                            borderSide: BorderSide(
                                                                                                              color: Colors.transparent,
                                                                                                              width: 1,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(12),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                                                                                        child: FFButtonWidget(
                                                                                                          onPressed: () async {
                                                                                                            setState(() {
                                                                                                              FFAppState().showCategoryOrSub = 'sub';
                                                                                                            });
                                                                                                          },
                                                                                                          text: 'Subscriptions',
                                                                                                          options: FFButtonOptions(
                                                                                                            width: 130,
                                                                                                            height: 40,
                                                                                                            color: FFAppState().showCategoryOrSub == 'sub' ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).fadedDivider,
                                                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                                                  color: FFAppState().showCategoryOrSub == 'sub' ? Colors.white : FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                                                ),
                                                                                                            elevation: 0,
                                                                                                            borderSide: BorderSide(
                                                                                                              color: Colors.transparent,
                                                                                                              width: 1,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(12),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                ),
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  child: Stack(
                                                                                                    children: [
                                                                                                      if (FFAppState().showCategoryOrSub == 'category')
                                                                                                        Builder(
                                                                                                          builder: (context) {
                                                                                                            final categories = containerCategoriesRecordList.toList();
                                                                                                            if (categories.isEmpty) {
                                                                                                              return EmptyLoadingTextWidget(
                                                                                                                text: 'No categories added yet',
                                                                                                              );
                                                                                                            }
                                                                                                            return Wrap(
                                                                                                              spacing: 8,
                                                                                                              runSpacing: 8,
                                                                                                              alignment: WrapAlignment.start,
                                                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                              direction: Axis.horizontal,
                                                                                                              runAlignment: WrapAlignment.start,
                                                                                                              verticalDirection: VerticalDirection.down,
                                                                                                              clipBehavior: Clip.none,
                                                                                                              children: List.generate(categories.length, (categoriesIndex) {
                                                                                                                final categoriesItem = categories[categoriesIndex];
                                                                                                                return FFButtonWidget(
                                                                                                                  onPressed: () async {
                                                                                                                    showModalBottomSheet(
                                                                                                                      isScrollControlled: true,
                                                                                                                      backgroundColor: Colors.transparent,
                                                                                                                      barrierColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                      context: context,
                                                                                                                      builder: (context) {
                                                                                                                        return Padding(
                                                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                                                          child: OverlayAlertWidget(),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ).then((value) => setState(() {}));

                                                                                                                    await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                                    if (containerTransactionsRecordList.length == 1) {
                                                                                                                      Navigator.pop(context);

                                                                                                                      final transactionsUpdateData = createTransactionsRecordData(
                                                                                                                        transactionCategory: categoriesItem.reference,
                                                                                                                        transactionBudget: currentUserDocument!.activeBudget,
                                                                                                                        categoryDetails: createCategoryDetailsStruct(
                                                                                                                          name: categoriesItem.categoryName,
                                                                                                                          clearUnsetFields: false,
                                                                                                                        ),
                                                                                                                        isAssigned: true,
                                                                                                                        dateAssigned: getCurrentTimestamp,
                                                                                                                      );
                                                                                                                      await unassignedtransactionsItem.reference.update(transactionsUpdateData);
                                                                                                                    } else {
                                                                                                                      final transactionsUpdateData = createTransactionsRecordData(
                                                                                                                        transactionCategory: categoriesItem.reference,
                                                                                                                        transactionBudget: currentUserDocument!.activeBudget,
                                                                                                                        categoryDetails: createCategoryDetailsStruct(
                                                                                                                          name: categoriesItem.categoryName,
                                                                                                                          clearUnsetFields: false,
                                                                                                                        ),
                                                                                                                        isAssigned: true,
                                                                                                                        dateAssigned: getCurrentTimestamp,
                                                                                                                      );
                                                                                                                      await unassignedtransactionsItem.reference.update(transactionsUpdateData);
                                                                                                                      Navigator.pop(context);
                                                                                                                    }
                                                                                                                  },
                                                                                                                  text: categoriesItem.categoryName!,
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
                                                                                                      if (FFAppState().showCategoryOrSub == 'sub')
                                                                                                        Builder(
                                                                                                          builder: (context) {
                                                                                                            final subscriptions = containerSubscriptionsRecordList.toList();
                                                                                                            if (subscriptions.isEmpty) {
                                                                                                              return EmptyLoadingTextWidget(
                                                                                                                text: 'No subscriptions added yet',
                                                                                                              );
                                                                                                            }
                                                                                                            return Wrap(
                                                                                                              spacing: 8,
                                                                                                              runSpacing: 8,
                                                                                                              alignment: WrapAlignment.start,
                                                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                              direction: Axis.horizontal,
                                                                                                              runAlignment: WrapAlignment.start,
                                                                                                              verticalDirection: VerticalDirection.down,
                                                                                                              clipBehavior: Clip.none,
                                                                                                              children: List.generate(subscriptions.length, (subscriptionsIndex) {
                                                                                                                final subscriptionsItem = subscriptions[subscriptionsIndex];
                                                                                                                return FFButtonWidget(
                                                                                                                  onPressed: () async {
                                                                                                                    showModalBottomSheet(
                                                                                                                      isScrollControlled: true,
                                                                                                                      backgroundColor: Colors.transparent,
                                                                                                                      barrierColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                      context: context,
                                                                                                                      builder: (context) {
                                                                                                                        return Padding(
                                                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                                                          child: OverlayAlertWidget(),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ).then((value) => setState(() {}));

                                                                                                                    await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                                    if (containerTransactionsRecordList.length == 1) {
                                                                                                                      Navigator.pop(context);

                                                                                                                      final transactionsUpdateData = createTransactionsRecordData(
                                                                                                                        transactionCategory: subscriptionsItem.category,
                                                                                                                        transactionBudget: currentUserDocument!.activeBudget,
                                                                                                                        recurringRef: subscriptionsItem.reference,
                                                                                                                        categoryDetails: createCategoryDetailsStruct(
                                                                                                                          name: subscriptionsItem.categoryDetails.name,
                                                                                                                          clearUnsetFields: false,
                                                                                                                        ),
                                                                                                                        subscriptionDetails: createSubscriptionDetailsStruct(
                                                                                                                          name: subscriptionsItem.name,
                                                                                                                          clearUnsetFields: false,
                                                                                                                        ),
                                                                                                                        isAssigned: true,
                                                                                                                        dateAssigned: getCurrentTimestamp,
                                                                                                                      );
                                                                                                                      await unassignedtransactionsItem.reference.update(transactionsUpdateData);
                                                                                                                      if (subscriptionsItem.lastChargeDate != null) {
                                                                                                                        if (unassignedtransactionsItem.trasactionDate! > subscriptionsItem.lastChargeDate!) {
                                                                                                                          final subscriptionsUpdateData = {
                                                                                                                            ...createSubscriptionsRecordData(
                                                                                                                              lastChargeDate: unassignedtransactionsItem.trasactionDate,
                                                                                                                              lastCharge: createMoneyStruct(
                                                                                                                                amount: unassignedtransactionsItem.transactionAmount,
                                                                                                                                clearUnsetFields: false,
                                                                                                                              ),
                                                                                                                              expChargeDate: functions.addDaysToDate(unassignedtransactionsItem.trasactionDate, functions.setNewExpectedSubDate(subscriptionsItem)),
                                                                                                                            ),
                                                                                                                            'transactions': FieldValue.arrayUnion([unassignedtransactionsItem.reference]),
                                                                                                                            'narrations': FieldValue.arrayUnion([
                                                                                                                              unassignedtransactionsItem.transactionNarration
                                                                                                                            ]),
                                                                                                                          };
                                                                                                                          await subscriptionsItem.reference.update(subscriptionsUpdateData);
                                                                                                                        } else {
                                                                                                                          final subscriptionsUpdateData = {
                                                                                                                            'transactions': FieldValue.arrayUnion([unassignedtransactionsItem.reference]),
                                                                                                                            'narrations': FieldValue.arrayUnion([
                                                                                                                              unassignedtransactionsItem.transactionNarration
                                                                                                                            ]),
                                                                                                                          };
                                                                                                                          await subscriptionsItem.reference.update(subscriptionsUpdateData);
                                                                                                                        }
                                                                                                                      } else {
                                                                                                                        final subscriptionsUpdateData = {
                                                                                                                          ...createSubscriptionsRecordData(
                                                                                                                            lastChargeDate: unassignedtransactionsItem.trasactionDate,
                                                                                                                            lastCharge: createMoneyStruct(
                                                                                                                              amount: unassignedtransactionsItem.transactionAmount,
                                                                                                                              clearUnsetFields: false,
                                                                                                                            ),
                                                                                                                            expChargeDate: functions.addDaysToDate(unassignedtransactionsItem.trasactionDate, functions.setNewExpectedSubDate(subscriptionsItem)),
                                                                                                                          ),
                                                                                                                          'transactions': FieldValue.arrayUnion([unassignedtransactionsItem.reference]),
                                                                                                                          'narrations': FieldValue.arrayUnion([
                                                                                                                            unassignedtransactionsItem.transactionNarration
                                                                                                                          ]),
                                                                                                                        };
                                                                                                                        await subscriptionsItem.reference.update(subscriptionsUpdateData);
                                                                                                                      }
                                                                                                                    } else {
                                                                                                                      final transactionsUpdateData = createTransactionsRecordData(
                                                                                                                        transactionCategory: subscriptionsItem.category,
                                                                                                                        transactionBudget: currentUserDocument!.activeBudget,
                                                                                                                        recurringRef: subscriptionsItem.reference,
                                                                                                                        categoryDetails: createCategoryDetailsStruct(
                                                                                                                          name: subscriptionsItem.categoryDetails.name,
                                                                                                                          clearUnsetFields: false,
                                                                                                                        ),
                                                                                                                        subscriptionDetails: createSubscriptionDetailsStruct(
                                                                                                                          name: subscriptionsItem.name,
                                                                                                                          clearUnsetFields: false,
                                                                                                                        ),
                                                                                                                        isAssigned: true,
                                                                                                                        dateAssigned: getCurrentTimestamp,
                                                                                                                      );
                                                                                                                      await unassignedtransactionsItem.reference.update(transactionsUpdateData);
                                                                                                                      if (subscriptionsItem.lastChargeDate != null) {
                                                                                                                        if (unassignedtransactionsItem.trasactionDate! > subscriptionsItem.lastChargeDate!) {
                                                                                                                          final subscriptionsUpdateData = {
                                                                                                                            ...createSubscriptionsRecordData(
                                                                                                                              lastChargeDate: unassignedtransactionsItem.trasactionDate,
                                                                                                                              lastCharge: createMoneyStruct(
                                                                                                                                amount: unassignedtransactionsItem.transactionAmount,
                                                                                                                                clearUnsetFields: false,
                                                                                                                              ),
                                                                                                                              expChargeDate: functions.addDaysToDate(unassignedtransactionsItem.trasactionDate, functions.setNewExpectedSubDate(subscriptionsItem)),
                                                                                                                            ),
                                                                                                                            'transactions': FieldValue.arrayUnion([unassignedtransactionsItem.reference]),
                                                                                                                            'narrations': FieldValue.arrayUnion([
                                                                                                                              unassignedtransactionsItem.transactionNarration
                                                                                                                            ]),
                                                                                                                          };
                                                                                                                          await subscriptionsItem.reference.update(subscriptionsUpdateData);
                                                                                                                        } else {
                                                                                                                          final subscriptionsUpdateData = {
                                                                                                                            'transactions': FieldValue.arrayUnion([unassignedtransactionsItem.reference]),
                                                                                                                            'narrations': FieldValue.arrayUnion([
                                                                                                                              unassignedtransactionsItem.transactionNarration
                                                                                                                            ]),
                                                                                                                          };
                                                                                                                          await subscriptionsItem.reference.update(subscriptionsUpdateData);
                                                                                                                        }
                                                                                                                      } else {
                                                                                                                        final subscriptionsUpdateData = {
                                                                                                                          ...createSubscriptionsRecordData(
                                                                                                                            lastChargeDate: unassignedtransactionsItem.trasactionDate,
                                                                                                                            lastCharge: createMoneyStruct(
                                                                                                                              amount: unassignedtransactionsItem.transactionAmount,
                                                                                                                              clearUnsetFields: false,
                                                                                                                            ),
                                                                                                                            expChargeDate: functions.addDaysToDate(unassignedtransactionsItem.trasactionDate, functions.setNewExpectedSubDate(subscriptionsItem)),
                                                                                                                          ),
                                                                                                                          'transactions': FieldValue.arrayUnion([unassignedtransactionsItem.reference]),
                                                                                                                          'narrations': FieldValue.arrayUnion([
                                                                                                                            unassignedtransactionsItem.transactionNarration
                                                                                                                          ]),
                                                                                                                        };
                                                                                                                        await subscriptionsItem.reference.update(subscriptionsUpdateData);
                                                                                                                      }

                                                                                                                      Navigator.pop(context);
                                                                                                                    }
                                                                                                                  },
                                                                                                                  text: subscriptionsItem.name!,
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
                                                                                                            ).animateOnPageLoad(animationsMap['wrapOnPageLoadAnimation2']!);
                                                                                                          },
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      if (unassignedtransactionsItem.transactionType == 'credit')
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: MediaQuery.of(context).size.width,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 16),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    FFButtonWidget(
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
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                ),
                                                                                                child: Builder(
                                                                                                  builder: (context) {
                                                                                                    final incomeSources = containerIncomeCategoriesRecordList.toList();
                                                                                                    if (incomeSources.isEmpty) {
                                                                                                      return EmptyLoadingTextWidget(
                                                                                                        text: 'No income sources added yet',
                                                                                                      );
                                                                                                    }
                                                                                                    return Wrap(
                                                                                                      spacing: 8,
                                                                                                      runSpacing: 8,
                                                                                                      alignment: WrapAlignment.start,
                                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                      direction: Axis.horizontal,
                                                                                                      runAlignment: WrapAlignment.start,
                                                                                                      verticalDirection: VerticalDirection.down,
                                                                                                      clipBehavior: Clip.none,
                                                                                                      children: List.generate(incomeSources.length, (incomeSourcesIndex) {
                                                                                                        final incomeSourcesItem = incomeSources[incomeSourcesIndex];
                                                                                                        return FFButtonWidget(
                                                                                                          onPressed: () async {
                                                                                                            showModalBottomSheet(
                                                                                                              isScrollControlled: true,
                                                                                                              backgroundColor: Colors.transparent,
                                                                                                              barrierColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              context: context,
                                                                                                              builder: (context) {
                                                                                                                return Padding(
                                                                                                                  padding: MediaQuery.of(context).viewInsets,
                                                                                                                  child: OverlayAlertWidget(),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => setState(() {}));

                                                                                                            await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                            if (containerTransactionsRecordList.length == 1) {
                                                                                                              Navigator.pop(context);

                                                                                                              final transactionsUpdateData = createTransactionsRecordData(
                                                                                                                incomeCategory: incomeSourcesItem.reference,
                                                                                                                incomeDetails: createIncomeDetailsStruct(
                                                                                                                  name: incomeSourcesItem.categoryName,
                                                                                                                  clearUnsetFields: false,
                                                                                                                ),
                                                                                                                isAssigned: true,
                                                                                                                dateAssigned: getCurrentTimestamp,
                                                                                                              );
                                                                                                              await unassignedtransactionsItem.reference.update(transactionsUpdateData);
                                                                                                            } else {
                                                                                                              final transactionsUpdateData = createTransactionsRecordData(
                                                                                                                incomeCategory: incomeSourcesItem.reference,
                                                                                                                incomeDetails: createIncomeDetailsStruct(
                                                                                                                  name: incomeSourcesItem.categoryName,
                                                                                                                  clearUnsetFields: false,
                                                                                                                ),
                                                                                                                isAssigned: true,
                                                                                                                dateAssigned: getCurrentTimestamp,
                                                                                                              );
                                                                                                              await unassignedtransactionsItem.reference.update(transactionsUpdateData);
                                                                                                              Navigator.pop(context);
                                                                                                            }
                                                                                                          },
                                                                                                          text: incomeSourcesItem.categoryName!,
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
                                                                                                    ).animateOnPageLoad(animationsMap['wrapOnPageLoadAnimation3']!);
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              theme: ExpandableThemeData(
                                                                                tapHeaderToExpand: true,
                                                                                tapBodyToExpand: true,
                                                                                tapBodyToCollapse: false,
                                                                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                hasIcon: false,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
