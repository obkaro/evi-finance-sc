import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllocateFirstBudgetWidget extends StatefulWidget {
  const AllocateFirstBudgetWidget({
    Key? key,
    this.budget,
    this.categoryToEdit,
    this.categoriesTotal,
  }) : super(key: key);

  final BudgetsRecord? budget;
  final CategoriesRecord? categoryToEdit;
  final int? categoriesTotal;

  @override
  _AllocateFirstBudgetWidgetState createState() =>
      _AllocateFirstBudgetWidgetState();
}

class _AllocateFirstBudgetWidgetState extends State<AllocateFirstBudgetWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      child: Container(
        width: double.infinity,
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
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Allocate Your Budget',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.table_chart,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 72,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: 0,
                          runSpacing: 0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                              child: Text(
                                'If you can\'t remember everything just yet, don\'t sweat it. We make it super easy for you to edit all of these at any time during your budget period.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: FlutterFlowTheme.of(context).fadedDivider,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Continue',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .subtitle2Family,
                                  color: Colors.white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
