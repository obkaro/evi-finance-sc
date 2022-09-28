import '../backend/backend.dart';
import '../components/circular_indicator_big_widget.dart';
import '../components/empty_list_widget.dart';
import '../components/transaction_list_item_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorySingleWidget extends StatefulWidget {
  const CategorySingleWidget({
    Key? key,
    this.category,
  }) : super(key: key);

  final CategoriesRecord? category;

  @override
  _CategorySingleWidgetState createState() => _CategorySingleWidgetState();
}

class _CategorySingleWidgetState extends State<CategorySingleWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CategorySingle'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TransactionsRecord>>(
      stream: queryTransactionsRecord(
        queryBuilder: (transactionsRecord) => transactionsRecord.where(
            'transactionCategory',
            isEqualTo: widget.category!.reference),
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
        List<TransactionsRecord> categorySingleTransactionsRecordList =
            snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
            iconTheme: IconThemeData(
                color: FlutterFlowTheme.of(context).secondaryPrimary),
            automaticallyImplyLeading: true,
            title: Text(
              widget.category!.categoryName!,
              style: FlutterFlowTheme.of(context).title3.override(
                    fontFamily: FlutterFlowTheme.of(context).title3Family,
                    color: FlutterFlowTheme.of(context).secondaryPrimary,
                    useGoogleFonts: GoogleFonts.asMap()
                        .containsKey(FlutterFlowTheme.of(context).title3Family),
                  ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.link_off_rounded,
                  color: FlutterFlowTheme.of(context).secondarySecondary,
                  size: 20,
                ),
                onPressed: () async {
                  await actions.unlinkAllTransCategories(
                    categorySingleTransactionsRecordList.toList(),
                  );
                },
              ),
            ],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 20),
                                      child: CircularIndicatorBigWidget(
                                        totalAmount:
                                            widget.category!.categoryAmount,
                                        spentAmount: valueOrDefault<int>(
                                          widget.category!.spentAmount,
                                          0,
                                        ),
                                        centerText: functions.subtractCurrency(
                                            widget.category!.categoryAmount,
                                            valueOrDefault<int>(
                                              widget.category!.spentAmount,
                                              0,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Spent',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        ),
                                        Text(
                                          functions.formatTransCurrency(
                                              functions.sumTransactionAmounts(
                                                  categorySingleTransactionsRecordList
                                                      .toList())),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Target',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              functions.formatTransCurrency(
                                                  widget.category!
                                                      .categoryAmount),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Builder(
                            builder: (context) {
                              final transactionsFromPage =
                                  categorySingleTransactionsRecordList.toList();
                              if (transactionsFromPage.isEmpty) {
                                return Center(
                                  child: Container(
                                    width: double.infinity,
                                    height: 300,
                                    child: EmptyListWidget(
                                      text:
                                          'No transactions assigned to this category yet',
                                      icon: Icon(
                                        Icons.list_rounded,
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
                                itemCount: transactionsFromPage.length,
                                itemBuilder:
                                    (context, transactionsFromPageIndex) {
                                  final transactionsFromPageItem =
                                      transactionsFromPage[
                                          transactionsFromPageIndex];
                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: TransactionListItemWidget(
                                      transactionDoc: transactionsFromPageItem,
                                    ),
                                  );
                                },
                              );
                            },
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
    );
  }
}
