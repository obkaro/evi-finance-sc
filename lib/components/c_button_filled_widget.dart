import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_button_filled_model.dart';
export 'c_button_filled_model.dart';

class CButtonFilledWidget extends StatefulWidget {
  const CButtonFilledWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  _CButtonFilledWidgetState createState() => _CButtonFilledWidgetState();
}

class _CButtonFilledWidgetState extends State<CButtonFilledWidget> {
  late CButtonFilledModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CButtonFilledModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: widget.text!,
      options: FFButtonOptions(
        width: double.infinity,
        height: 60,
        color: FlutterFlowTheme.of(context).primaryColor,
        textStyle: FlutterFlowTheme.of(context).subtitle1.override(
              fontFamily: FlutterFlowTheme.of(context).subtitle1Family,
              color: Colors.white,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).subtitle1Family),
            ),
        elevation: 2,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
