import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../transaction_single/transaction_single_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionsWidget extends StatefulWidget {
  const TransactionsWidget({Key? key}) : super(key: key);

  @override
  _TransactionsWidgetState createState() => _TransactionsWidgetState();
}

class _TransactionsWidgetState extends State<TransactionsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Transactions'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
        automaticallyImplyLeading: true,
        title: Text(
          'All Transactions',
          style: FlutterFlowTheme.of(context).title3,
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
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 14,
                          color: FlutterFlowTheme.of(context).shadowGray,
                        )
                      ],
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: DefaultTabController(
                        length: 2,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            TabBar(
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              labelPadding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              labelStyle: FlutterFlowTheme.of(context).title3,
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              indicatorWeight: 3,
                              tabs: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 0),
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: Color(0xFFFF0000),
                                      ),
                                    ),
                                    Tab(
                                      text: 'Expenses',
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 0),
                                      child: Icon(
                                        Icons.arrow_drop_up,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                      ),
                                    ),
                                    Tab(
                                      text: 'Income',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child:
                                        StreamBuilder<List<TransactionsRecord>>(
                                      stream: queryTransactionsRecord(
                                        queryBuilder: (transactionsRecord) =>
                                            transactionsRecord
                                                .where('transactionOwner',
                                                    isEqualTo:
                                                        currentUserReference)
                                                .where('transactionType',
                                                    isEqualTo: 'debit')
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        List<TransactionsRecord>
                                            columnTransactionsRecordList =
                                            snapshot.data!;
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: List.generate(
                                                columnTransactionsRecordList
                                                    .length, (columnIndex) {
                                              final columnTransactionsRecord =
                                                  columnTransactionsRecordList[
                                                      columnIndex];
                                              return InkWell(
                                                onTap: () async {
                                                  // Action_NavToTransaction
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
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 8, 8, 8),
                                                      child: FutureBuilder<
                                                          AccountsRecord>(
                                                        future: AccountsRecord
                                                            .getDocumentOnce(
                                                                columnTransactionsRecord
                                                                    .account!),
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
                                                          final rowAccountsRecord =
                                                              snapshot.data!;
                                                          return Row(
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
                                                                    FutureBuilder<
                                                                        List<
                                                                            ConstInstitutionLogosRecord>>(
                                                                      future:
                                                                          queryConstInstitutionLogosRecordOnce(
                                                                        queryBuilder: (constInstitutionLogosRecord) => constInstitutionLogosRecord.where(
                                                                            'institutionCode',
                                                                            isEqualTo:
                                                                                rowAccountsRecord.bankCode),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50,
                                                                              height: 50,
                                                                              child: SpinKitRing(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 50,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<ConstInstitutionLogosRecord>
                                                                            imageConstInstitutionLogosRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the document does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final imageConstInstitutionLogosRecord = imageConstInstitutionLogosRecordList.isNotEmpty
                                                                            ? imageConstInstitutionLogosRecordList.first
                                                                            : null;
                                                                        return ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(12),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            imageUrl:
                                                                                imageConstInstitutionLogosRecord!.institutionLogo!,
                                                                            width:
                                                                                40,
                                                                            height:
                                                                                40,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        );
                                                                      },
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
                                                                              if (columnTransactionsRecord.transactionCategory != null)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                  child: StreamBuilder<CategoriesRecord>(
                                                                                    stream: CategoriesRecord.getDocument(columnTransactionsRecord.transactionCategory!),
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
                                                                                      final textCategoriesRecord = snapshot.data!;
                                                                                      return AutoSizeText(
                                                                                        textCategoriesRecord.categoryName!.maybeHandleOverflow(
                                                                                          maxChars: 25,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).subtitle1,
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              if (columnTransactionsRecord.incomeCategory != null)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                  child: StreamBuilder<IncomeCategoriesRecord>(
                                                                                    stream: IncomeCategoriesRecord.getDocument(columnTransactionsRecord.incomeCategory!),
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
                                                                                      final textIncomeCategoriesRecord = snapshot.data!;
                                                                                      return AutoSizeText(
                                                                                        textIncomeCategoriesRecord.categoryName!.maybeHandleOverflow(
                                                                                          maxChars: 25,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).subtitle1,
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              if (columnTransactionsRecord.transactionCategory == null)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                  child: AutoSizeText(
                                                                                    'Uncategorized',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                          color: Color(0xFFD40F0F),
                                                                                          fontStyle: FontStyle.italic,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              Text(
                                                                                '${dateTimeFormat('jm', columnTransactionsRecord.trasactionDate)} | ${dateTimeFormat('MMMEd', columnTransactionsRecord.trasactionDate)}',
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
                                                                                functions.formatTransCurrency(columnTransactionsRecord.transactionAmount).maybeHandleOverflow(
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
                                                                              columnTransactionsRecord.transactionType!.maybeHandleOverflow(
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
                                                          );
                                                        },
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child:
                                        StreamBuilder<List<TransactionsRecord>>(
                                      stream: queryTransactionsRecord(
                                        queryBuilder: (transactionsRecord) =>
                                            transactionsRecord
                                                .where('transactionOwner',
                                                    isEqualTo:
                                                        currentUserReference)
                                                .where('transactionType',
                                                    isEqualTo: 'credit')
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        List<TransactionsRecord>
                                            columnTransactionsRecordList =
                                            snapshot.data!;
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: List.generate(
                                                columnTransactionsRecordList
                                                    .length, (columnIndex) {
                                              final columnTransactionsRecord =
                                                  columnTransactionsRecordList[
                                                      columnIndex];
                                              return InkWell(
                                                onTap: () async {
                                                  // Action_NavToTransaction
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
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 0, 8, 0),
                                                      child: FutureBuilder<
                                                          AccountsRecord>(
                                                        future: AccountsRecord
                                                            .getDocumentOnce(
                                                                columnTransactionsRecord
                                                                    .account!),
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
                                                          final rowAccountsRecord =
                                                              snapshot.data!;
                                                          return Row(
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
                                                                    FutureBuilder<
                                                                        List<
                                                                            ConstInstitutionLogosRecord>>(
                                                                      future:
                                                                          queryConstInstitutionLogosRecordOnce(
                                                                        queryBuilder: (constInstitutionLogosRecord) => constInstitutionLogosRecord.where(
                                                                            'institutionCode',
                                                                            isEqualTo:
                                                                                rowAccountsRecord.bankCode),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50,
                                                                              height: 50,
                                                                              child: SpinKitRing(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 50,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<ConstInstitutionLogosRecord>
                                                                            imageConstInstitutionLogosRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the document does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final imageConstInstitutionLogosRecord = imageConstInstitutionLogosRecordList.isNotEmpty
                                                                            ? imageConstInstitutionLogosRecordList.first
                                                                            : null;
                                                                        return ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(12),
                                                                          child:
                                                                              Image.network(
                                                                            imageConstInstitutionLogosRecord!.institutionLogo!,
                                                                            width:
                                                                                40,
                                                                            height:
                                                                                40,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        );
                                                                      },
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
                                                                              if (columnTransactionsRecord.transactionCategory != null)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                  child: FutureBuilder<CategoriesRecord>(
                                                                                    future: CategoriesRecord.getDocumentOnce(columnTransactionsRecord.transactionCategory!),
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
                                                                                      final textCategoriesRecord = snapshot.data!;
                                                                                      return AutoSizeText(
                                                                                        textCategoriesRecord.categoryName!.maybeHandleOverflow(
                                                                                          maxChars: 25,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).subtitle1,
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              if (columnTransactionsRecord.incomeCategory != null)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                  child: StreamBuilder<IncomeCategoriesRecord>(
                                                                                    stream: IncomeCategoriesRecord.getDocument(columnTransactionsRecord.incomeCategory!),
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
                                                                                      final textIncomeCategoriesRecord = snapshot.data!;
                                                                                      return AutoSizeText(
                                                                                        textIncomeCategoriesRecord.categoryName!.maybeHandleOverflow(
                                                                                          maxChars: 25,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).subtitle1,
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              if (columnTransactionsRecord.incomeCategory == null)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                  child: AutoSizeText(
                                                                                    'Uncategorized',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                          color: Color(0xFFD40F0F),
                                                                                          fontStyle: FontStyle.italic,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              Text(
                                                                                '${dateTimeFormat('Hm', columnTransactionsRecord.trasactionDate)} | ${dateTimeFormat('MMMEd', columnTransactionsRecord.trasactionDate)}',
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
                                                                                functions.formatTransCurrency(columnTransactionsRecord.transactionAmount).maybeHandleOverflow(
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
                                                                              columnTransactionsRecord.transactionType!.maybeHandleOverflow(
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
                                                          );
                                                        },
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
                          ],
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
  }
}
