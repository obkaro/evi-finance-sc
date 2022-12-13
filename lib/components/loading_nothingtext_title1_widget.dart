import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoadingNothingtextTitle1Widget extends StatefulWidget {
  const LoadingNothingtextTitle1Widget({Key? key}) : super(key: key);

  @override
  _LoadingNothingtextTitle1WidgetState createState() =>
      _LoadingNothingtextTitle1WidgetState();
}

class _LoadingNothingtextTitle1WidgetState
    extends State<LoadingNothingtextTitle1Widget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Text(
      'Hello World',
      style: FlutterFlowTheme.of(context).title1.override(
            fontFamily: FlutterFlowTheme.of(context).title1Family,
            color: FlutterFlowTheme.of(context).secondaryColor,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).title1Family),
          ),
    );
  }
}
