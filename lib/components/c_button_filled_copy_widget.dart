import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_button_filled_copy_model.dart';
export 'c_button_filled_copy_model.dart';

class CButtonFilledCopyWidget extends StatefulWidget {
  const CButtonFilledCopyWidget({
    Key? key,
    this.text,
    this.icon,
    this.action,
  }) : super(key: key);

  final String? text;
  final Widget? icon;
  final Future<dynamic> Function()? action;

  @override
  _CButtonFilledCopyWidgetState createState() =>
      _CButtonFilledCopyWidgetState();
}

class _CButtonFilledCopyWidgetState extends State<CButtonFilledCopyWidget> {
  late CButtonFilledCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CButtonFilledCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FFButtonWidget(
      onPressed: () async {
        await widget.action?.call();
      },
      text: widget.text!,
      icon: widget.icon,
      options: FFButtonOptions(
        width: double.infinity,
        height: 55,
        color: Color(0x00FF0054),
        textStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
              color: FlutterFlowTheme.of(context).primaryColor,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyText1Family),
            ),
        elevation: 0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).fadedDivider,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
