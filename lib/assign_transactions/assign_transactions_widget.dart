import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/text_transaction_type_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_swipeable_stack.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class AssignTransactionsWidget extends StatefulWidget {
  const AssignTransactionsWidget({Key? key}) : super(key: key);

  @override
  _AssignTransactionsWidgetState createState() =>
      _AssignTransactionsWidgetState();
}

class _AssignTransactionsWidgetState extends State<AssignTransactionsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late SwipeableCardSectionController swipeableStackController;

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'assignTransactions'});
    swipeableStackController = SwipeableCardSectionController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TransactionsRecord>>(
      stream: queryTransactionsRecord(
        queryBuilder: (transactionsRecord) => transactionsRecord
            .where('transactionOwner', isEqualTo: currentUserReference),
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
        List<TransactionsRecord> assignTransactionsTransactionsRecordList =
            snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
            iconTheme: IconThemeData(
                color: FlutterFlowTheme.of(context).secondaryPrimary),
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You have ',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          assignTransactionsTransactionsRecordList.length
                              .toString(),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                color: Color(0xFFFF0000),
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                        Text(
                          ' unassigned transactions',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: AuthUserStreamWidget(
                      child: StreamBuilder<List<CategoriesRecord>>(
                        stream: queryCategoriesRecord(
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<CategoriesRecord> containerCategoriesRecordList =
                              snapshot.data!;
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<SubscriptionsRecord>
                                    containerSubscriptionsRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 16),
                                    child: Builder(
                                      builder: (context) {
                                        final transactionFromPage =
                                            assignTransactionsTransactionsRecordList
                                                .toList();
                                        return FlutterFlowSwipeableStack(
                                          topCardHeightFraction: 0.85,
                                          middleCardHeightFraction: 0.68,
                                          botttomCardHeightFraction: 0.75,
                                          topCardWidthFraction: 0.9,
                                          middleCardWidthFraction: 0.85,
                                          botttomCardWidthFraction: 0.8,
                                          onSwipeFn: (index) async {
                                            swipeableStackController
                                                .triggerSwipeUp();
                                          },
                                          onLeftSwipe: (index) {},
                                          onRightSwipe: (index) {},
                                          onUpSwipe: (index) {},
                                          onDownSwipe: (index) {},
                                          itemBuilder: (context,
                                              transactionFromPageIndex) {
                                            final transactionFromPageItem =
                                                transactionFromPage[
                                                    transactionFromPageIndex];
                                            return Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 20, 20, 20),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 16, 0),
                                                          child: Container(
                                                            width: 80,
                                                            height: 80,
                                                            child: Stack(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              300),
                                                                    ),
                                                                    child:
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
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    imageUrl: transactionFromPageItem
                                                                        .accountDetails
                                                                        .logo!,
                                                                    width: 48,
                                                                    height: 48,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          10),
                                                                  child: Text(
                                                                    functions.formatTransCurrency(
                                                                        transactionFromPageItem
                                                                            .transactionAmount),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).subtitle1Family,
                                                                          fontSize:
                                                                              20,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle1Family),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                TextTransactionTypeWidget(
                                                                  transactionType:
                                                                      transactionFromPageItem
                                                                          .transactionType,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 16, 0, 0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(32),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16,
                                                                      10,
                                                                      16,
                                                                      0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            10),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                16,
                                                                                0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Date',
                                                                                        style: FlutterFlowTheme.of(context).bodyText2,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
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
                                                                                          dateTimeFormat('MMMMEEEEd', transactionFromPageItem.trasactionDate!),
                                                                                          style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).subtitle1Family,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle1Family),
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              4),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'Narration',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText2,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
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
                                                                                    transactionFromPageItem.transactionNarration!,
                                                                                    style: FlutterFlowTheme.of(context).subtitle1.override(
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 8, 0, 0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 300,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0),
                                                              topLeft: Radius
                                                                  .circular(32),
                                                              topRight: Radius
                                                                  .circular(32),
                                                            ),
                                                          ),
                                                          child:
                                                              DefaultTabController(
                                                            length: 2,
                                                            initialIndex: 0,
                                                            child: Column(
                                                              children: [
                                                                TabBar(
                                                                  isScrollable:
                                                                      true,
                                                                  labelColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  unselectedLabelColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  labelPadding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              16,
                                                                              8,
                                                                              16,
                                                                              8),
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1,
                                                                  indicatorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                  tabs: [
                                                                    Tab(
                                                                      text:
                                                                          'Categories',
                                                                      iconMargin:
                                                                          EdgeInsetsDirectional.fromSTEB(
                                                                              8,
                                                                              8,
                                                                              8,
                                                                              8),
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'Subscriptions',
                                                                    ),
                                                                  ],
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      TabBarView(
                                                                    children: [
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final categoriesfromcont =
                                                                              containerCategoriesRecordList.toList();
                                                                          return ListView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                categoriesfromcont.length,
                                                                            itemBuilder:
                                                                                (context, categoriesfromcontIndex) {
                                                                              final categoriesfromcontItem = categoriesfromcont[categoriesfromcontIndex];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                            child: Text(
                                                                                              categoriesfromcontItem.categoryName!,
                                                                                              style: FlutterFlowTheme.of(context).subtitle1,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            functions.subtractCurrencyOfCopy(categoriesfromcontItem.categoryAmount, categoriesfromcontItem.spentAmount),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Stack(
                                                                                          children: [
                                                                                            if (transactionFromPageItem.transactionCategory != categoriesfromcontItem.reference)
                                                                                              FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                borderRadius: 30,
                                                                                                borderWidth: 1,
                                                                                                buttonSize: 60,
                                                                                                icon: Icon(
                                                                                                  Icons.radio_button_off_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 30,
                                                                                                ),
                                                                                                onPressed: () async {
                                                                                                  swipeableStackController.triggerSwipeUp();

                                                                                                  final transactionsUpdateData = createTransactionsRecordData(
                                                                                                    transactionCategory: categoriesfromcontItem.reference,
                                                                                                    transactionBudget: categoriesfromcontItem.parentReference,
                                                                                                    isAssigned: true,
                                                                                                    dateAssigned: getCurrentTimestamp,
                                                                                                    categoryDetails: createCategoryDetailsStruct(
                                                                                                      name: categoriesfromcontItem.categoryName,
                                                                                                      clearUnsetFields: false,
                                                                                                    ),
                                                                                                  );
                                                                                                  await transactionFromPageItem.reference.update(transactionsUpdateData);
                                                                                                },
                                                                                              ),
                                                                                            if (transactionFromPageItem.transactionCategory == categoriesfromcontItem.reference)
                                                                                              FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                borderRadius: 30,
                                                                                                borderWidth: 1,
                                                                                                buttonSize: 60,
                                                                                                icon: Icon(
                                                                                                  Icons.radio_button_checked_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  size: 30,
                                                                                                ),
                                                                                                onPressed: () {
                                                                                                  print('IconButton pressed ...');
                                                                                                },
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            double.infinity,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final inheritedSubs =
                                                                                containerSubscriptionsRecordList.toList();
                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: inheritedSubs.length,
                                                                              itemBuilder: (context, inheritedSubsIndex) {
                                                                                final inheritedSubsItem = inheritedSubs[inheritedSubsIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                                                                        child: Hero(
                                                                                          tag: inheritedSubsItem.icon!,
                                                                                          transitionOnUserGestures: true,
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(12),
                                                                                            child: CachedNetworkImage(
                                                                                              imageUrl: inheritedSubsItem.icon!,
                                                                                              width: 48,
                                                                                              height: 48,
                                                                                              fit: BoxFit.scaleDown,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              inheritedSubsItem.name!,
                                                                                              style: FlutterFlowTheme.of(context).subtitle1,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Stack(
                                                                                            children: [
                                                                                              if (inheritedSubsItem.transactions!.toList().contains(transactionFromPageItem.reference) == false)
                                                                                                FlutterFlowIconButton(
                                                                                                  borderColor: Colors.transparent,
                                                                                                  borderRadius: 30,
                                                                                                  borderWidth: 1,
                                                                                                  buttonSize: 60,
                                                                                                  icon: Icon(
                                                                                                    Icons.radio_button_off_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 30,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    swipeableStackController.triggerSwipeUp();
                                                                                                    if (transactionFromPageItem.recurringRef != null) {
                                                                                                      await actions.normalizeTransSub(
                                                                                                        transactionFromPageItem,
                                                                                                      );

                                                                                                      final transactionsUpdateData = createTransactionsRecordData(
                                                                                                        transactionCategory: inheritedSubsItem.category,
                                                                                                        transactionBudget: currentUserDocument!.activeBudget,
                                                                                                        recurringRef: inheritedSubsItem.reference,
                                                                                                        dateAssigned: getCurrentTimestamp,
                                                                                                        categoryDetails: createCategoryDetailsStruct(
                                                                                                          name: inheritedSubsItem.categoryDetails.name,
                                                                                                          clearUnsetFields: true,
                                                                                                        ),
                                                                                                        subscriptionDetails: createSubscriptionDetailsStruct(
                                                                                                          name: inheritedSubsItem.name,
                                                                                                          clearUnsetFields: false,
                                                                                                        ),
                                                                                                        isAssigned: true,
                                                                                                      );
                                                                                                      await transactionFromPageItem.reference.update(transactionsUpdateData);
                                                                                                      if (inheritedSubsItem.lastChargeDate != null) {
                                                                                                        if (transactionFromPageItem.trasactionDate! > inheritedSubsItem.lastChargeDate!) {
                                                                                                          final subscriptionsUpdateData = {
                                                                                                            ...createSubscriptionsRecordData(
                                                                                                              lastChargeDate: transactionFromPageItem.trasactionDate,
                                                                                                              lastCharge: createMoneyStruct(
                                                                                                                amount: transactionFromPageItem.transactionAmount,
                                                                                                                clearUnsetFields: false,
                                                                                                              ),
                                                                                                              expChargeDate: functions.addDaysToDate(transactionFromPageItem.trasactionDate, functions.setNewExpectedSubDate(inheritedSubsItem)),
                                                                                                            ),
                                                                                                            'transactions': FieldValue.arrayUnion([
                                                                                                              transactionFromPageItem.reference
                                                                                                            ]),
                                                                                                            'narrations': FieldValue.arrayUnion([
                                                                                                              transactionFromPageItem.transactionNarration
                                                                                                            ]),
                                                                                                          };
                                                                                                          await inheritedSubsItem.reference.update(subscriptionsUpdateData);
                                                                                                        } else {
                                                                                                          final subscriptionsUpdateData = {
                                                                                                            'transactions': FieldValue.arrayUnion([
                                                                                                              transactionFromPageItem.reference
                                                                                                            ]),
                                                                                                            'narrations': FieldValue.arrayUnion([
                                                                                                              transactionFromPageItem.transactionNarration
                                                                                                            ]),
                                                                                                          };
                                                                                                          await inheritedSubsItem.reference.update(subscriptionsUpdateData);
                                                                                                        }
                                                                                                      } else {
                                                                                                        final subscriptionsUpdateData = {
                                                                                                          ...createSubscriptionsRecordData(
                                                                                                            lastChargeDate: transactionFromPageItem.trasactionDate,
                                                                                                            lastCharge: createMoneyStruct(
                                                                                                              amount: transactionFromPageItem.transactionAmount,
                                                                                                              clearUnsetFields: false,
                                                                                                            ),
                                                                                                            expChargeDate: functions.addDaysToDate(transactionFromPageItem.trasactionDate, functions.setNewExpectedSubDate(inheritedSubsItem)),
                                                                                                          ),
                                                                                                          'transactions': FieldValue.arrayUnion([
                                                                                                            transactionFromPageItem.reference
                                                                                                          ]),
                                                                                                          'narrations': FieldValue.arrayUnion([
                                                                                                            transactionFromPageItem.transactionNarration
                                                                                                          ]),
                                                                                                        };
                                                                                                        await inheritedSubsItem.reference.update(subscriptionsUpdateData);
                                                                                                      }
                                                                                                    } else {
                                                                                                      final transactionsUpdateData = createTransactionsRecordData(
                                                                                                        transactionCategory: inheritedSubsItem.category,
                                                                                                        transactionBudget: currentUserDocument!.activeBudget,
                                                                                                        recurringRef: inheritedSubsItem.reference,
                                                                                                        dateAssigned: getCurrentTimestamp,
                                                                                                        categoryDetails: createCategoryDetailsStruct(
                                                                                                          name: inheritedSubsItem.categoryDetails.name,
                                                                                                          clearUnsetFields: true,
                                                                                                        ),
                                                                                                        subscriptionDetails: createSubscriptionDetailsStruct(
                                                                                                          name: inheritedSubsItem.name,
                                                                                                          clearUnsetFields: false,
                                                                                                        ),
                                                                                                        isAssigned: true,
                                                                                                      );
                                                                                                      await transactionFromPageItem.reference.update(transactionsUpdateData);
                                                                                                      if (inheritedSubsItem.lastChargeDate != null) {
                                                                                                        if (transactionFromPageItem.trasactionDate! > inheritedSubsItem.lastChargeDate!) {
                                                                                                          final subscriptionsUpdateData = {
                                                                                                            ...createSubscriptionsRecordData(
                                                                                                              lastChargeDate: transactionFromPageItem.trasactionDate,
                                                                                                              lastCharge: createMoneyStruct(
                                                                                                                amount: transactionFromPageItem.transactionAmount,
                                                                                                                clearUnsetFields: false,
                                                                                                              ),
                                                                                                              expChargeDate: functions.addDaysToDate(transactionFromPageItem.trasactionDate, functions.setNewExpectedSubDate(inheritedSubsItem)),
                                                                                                            ),
                                                                                                            'transactions': FieldValue.arrayUnion([
                                                                                                              transactionFromPageItem.reference
                                                                                                            ]),
                                                                                                            'narrations': FieldValue.arrayUnion([
                                                                                                              transactionFromPageItem.transactionNarration
                                                                                                            ]),
                                                                                                          };
                                                                                                          await inheritedSubsItem.reference.update(subscriptionsUpdateData);
                                                                                                        } else {
                                                                                                          final subscriptionsUpdateData = {
                                                                                                            'transactions': FieldValue.arrayUnion([
                                                                                                              transactionFromPageItem.reference
                                                                                                            ]),
                                                                                                            'narrations': FieldValue.arrayUnion([
                                                                                                              transactionFromPageItem.transactionNarration
                                                                                                            ]),
                                                                                                          };
                                                                                                          await inheritedSubsItem.reference.update(subscriptionsUpdateData);
                                                                                                        }
                                                                                                      } else {
                                                                                                        final subscriptionsUpdateData = {
                                                                                                          ...createSubscriptionsRecordData(
                                                                                                            lastChargeDate: transactionFromPageItem.trasactionDate,
                                                                                                            lastCharge: createMoneyStruct(
                                                                                                              amount: transactionFromPageItem.transactionAmount,
                                                                                                              clearUnsetFields: false,
                                                                                                            ),
                                                                                                            expChargeDate: functions.addDaysToDate(transactionFromPageItem.trasactionDate, functions.setNewExpectedSubDate(inheritedSubsItem)),
                                                                                                          ),
                                                                                                          'transactions': FieldValue.arrayUnion([
                                                                                                            transactionFromPageItem.reference
                                                                                                          ]),
                                                                                                          'narrations': FieldValue.arrayUnion([
                                                                                                            transactionFromPageItem.transactionNarration
                                                                                                          ]),
                                                                                                        };
                                                                                                        await inheritedSubsItem.reference.update(subscriptionsUpdateData);
                                                                                                      }
                                                                                                    }
                                                                                                  },
                                                                                                ),
                                                                                              if (inheritedSubsItem.transactions!.toList().contains(transactionFromPageItem.reference))
                                                                                                FlutterFlowIconButton(
                                                                                                  borderColor: Colors.transparent,
                                                                                                  borderRadius: 30,
                                                                                                  borderWidth: 1,
                                                                                                  buttonSize: 60,
                                                                                                  icon: Icon(
                                                                                                    Icons.radio_button_checked_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                    size: 30,
                                                                                                  ),
                                                                                                  onPressed: () {
                                                                                                    print('IconButton pressed ...');
                                                                                                  },
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
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
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount: transactionFromPage.length,
                                          controller: swipeableStackController,
                                          enableSwipeUp: false,
                                          enableSwipeDown: false,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
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
    );
  }
}
