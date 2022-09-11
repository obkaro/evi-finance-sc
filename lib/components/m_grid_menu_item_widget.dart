import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MGridMenuItemWidget extends StatefulWidget {
  const MGridMenuItemWidget({
    Key? key,
    this.menuText,
    this.menuIcon,
    this.fgColor,
    this.bgColor,
    this.action,
  }) : super(key: key);

  final String? menuText;
  final Widget? menuIcon;
  final Color? fgColor;
  final Color? bgColor;
  final Future<dynamic> Function()? action;

  @override
  _MGridMenuItemWidgetState createState() => _MGridMenuItemWidgetState();
}

class _MGridMenuItemWidgetState extends State<MGridMenuItemWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await widget.action?.call();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: widget.bgColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
              child: widget.menuIcon!,
            ),
            Text(
              widget.menuText!,
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
