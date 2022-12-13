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
import 'package:provider/provider.dart';

class TransactionListItemWidget extends StatefulWidget {
  const TransactionListItemWidget({
    Key? key,
    this.transactionDoc,
  }) : super(key: key);

  final TransactionsRecord? transactionDoc;

  @override
  _TransactionListItemWidgetState createState() =>
      _TransactionListItemWidgetState();
}

class _TransactionListItemWidgetState extends State<TransactionListItemWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(),
      child: InkWell(
        onTap: () async {
          // Action_TransactionSingle
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransactionSingleWidget(
                transaction: widget.transactionDoc,
              ),
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: Stack(
                      alignment: AlignmentDirectional(0, 0),
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(300),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl:
                                widget.transactionDoc!.accountDetails.logo!,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (widget.transactionDoc!
                                                      .isAssigned ==
                                                  false)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 8),
                                                  child: AutoSizeText(
                                                    '-',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          color:
                                                              Color(0xFFD40F0F),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
                                                  ),
                                                ),
                                              if (widget
                                                          .transactionDoc!
                                                          .categoryDetails
                                                          .name !=
                                                      null &&
                                                  widget
                                                          .transactionDoc!
                                                          .categoryDetails
                                                          .name !=
                                                      '')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 8),
                                                  child: AutoSizeText(
                                                    widget.transactionDoc!
                                                        .categoryDetails.name!
                                                        .maybeHandleOverflow(
                                                      maxChars: 25,
                                                      replacement: '…',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              if (widget.transactionDoc!
                                                          .incomeDetails.name !=
                                                      null &&
                                                  widget.transactionDoc!
                                                          .incomeDetails.name !=
                                                      '')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 8),
                                                  child: AutoSizeText(
                                                    widget.transactionDoc!
                                                        .incomeDetails.name!
                                                        .maybeHandleOverflow(
                                                      maxChars: 25,
                                                      replacement: '…',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '${dateTimeFormat(
                                      'jm',
                                      widget.transactionDoc!.trasactionDate,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )} | ${dateTimeFormat(
                                      'MMMEd',
                                      widget.transactionDoc!.trasactionDate,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )}',
                                    textAlign: TextAlign.start,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: AutoSizeText(
                                    functions
                                        .formatTransCurrency(widget
                                            .transactionDoc!.transactionAmount)
                                        .maybeHandleOverflow(
                                          maxChars: 15,
                                          replacement: '…',
                                        ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                                Stack(
                                  children: [
                                    if (widget
                                            .transactionDoc!.transactionType ==
                                        'debit')
                                      AutoSizeText(
                                        widget.transactionDoc!.transactionType!
                                            .maybeHandleOverflow(
                                          maxChars: 15,
                                          replacement: '…',
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family,
                                              color: Color(0xFFFF0003),
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2Family),
                                            ),
                                      ),
                                    if (widget
                                            .transactionDoc!.transactionType ==
                                        'credit')
                                      AutoSizeText(
                                        widget.transactionDoc!.transactionType!
                                            .maybeHandleOverflow(
                                          maxChars: 15,
                                          replacement: '…',
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2Family),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
