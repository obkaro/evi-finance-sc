import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CButtonFilledCopyWidget extends StatefulWidget {
  const CButtonFilledCopyWidget({
    Key? key,
    this.text,
    this.icon,
  }) : super(key: key);

  final String? text;
  final Widget? icon;

  @override
  _CButtonFilledCopyWidgetState createState() =>
      _CButtonFilledCopyWidgetState();
}

class _CButtonFilledCopyWidgetState extends State<CButtonFilledCopyWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: widget.text!,
      icon: widget.icon,
      options: FFButtonOptions(
        width: double.infinity,
        height: 48,
        color: Color(0x00FF0054),
        textStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
        elevation: 0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
