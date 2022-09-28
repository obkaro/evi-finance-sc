import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NewVersionFoundWidget extends StatefulWidget {
  const NewVersionFoundWidget({
    Key? key,
    this.forceUpdate,
  }) : super(key: key);

  final bool? forceUpdate;

  @override
  _NewVersionFoundWidgetState createState() => _NewVersionFoundWidgetState();
}

class _NewVersionFoundWidgetState extends State<NewVersionFoundWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Experience new features',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.system_update_alt_rounded,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 0),
                                  child: Text(
                                    'We are constantly improving the Evi experience. Update to the latest version to get the best of what we have to offer 😊',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                          if (!widget.forceUpdate!)
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                text: 'Update later',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 30,
                                  color: Color(0x00D2D2D2),
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                await actions.launchStore();
                              },
                              text: 'Update now',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 60,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle2Family,
                                      color: Colors.white,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
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
        ],
      ),
    );
  }
}
