import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

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
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.bgColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Row(
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
                                style: FlutterFlowTheme.of(context).title1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 32, 0),
                            child: InkWell(
                              onTap: () async {
                                await widget.iconAction?.call();
                              },
                              child: widget.actionIcon!,
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
        Container(
          width: double.infinity,
          height: 32,
          decoration: BoxDecoration(
            color: widget.bgColor,
          ),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: widget.fgColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(3),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
