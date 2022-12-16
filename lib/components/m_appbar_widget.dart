import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MAppbarWidget extends StatefulWidget {
  const MAppbarWidget({
    Key? key,
    this.titleText,
    this.icon,
    this.bgColor,
    this.fgColor,
    this.textColor,
    this.iconAction,
    this.actionIcon,
  }) : super(key: key);

  final String? titleText;
  final Widget? icon;
  final Color? bgColor;
  final Color? fgColor;
  final Color? textColor;
  final Future<dynamic> Function()? iconAction;
  final Widget? actionIcon;

  @override
  _MAppbarWidgetState createState() => _MAppbarWidgetState();
}

class _MAppbarWidgetState extends State<MAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: widget.bgColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(32, 0, 0, 0),
                            child: widget.icon!,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              widget.titleText!,
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .title1Family,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryPrimary,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .title1Family),
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: widget.actionIcon!,
                          onPressed: () async {
                            await widget.iconAction?.call();
                          },
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
    );
  }
}
