import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CButtonFilledWidget extends StatefulWidget {
  const CButtonFilledWidget({Key? key}) : super(key: key);

  @override
  _CButtonFilledWidgetState createState() => _CButtonFilledWidgetState();
}

class _CButtonFilledWidgetState extends State<CButtonFilledWidget> {
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
      text: 'Save',
      options: FFButtonOptions(
        width: double.infinity,
        height: 60,
        color: FlutterFlowTheme.of(context).primaryColor,
        textStyle: FlutterFlowTheme.of(context).subtitle1.override(
              fontFamily: FlutterFlowTheme.of(context).subtitle1Family,
              color: Colors.white,
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
