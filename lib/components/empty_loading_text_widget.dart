import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmptyLoadingTextWidget extends StatefulWidget {
  const EmptyLoadingTextWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  _EmptyLoadingTextWidgetState createState() => _EmptyLoadingTextWidgetState();
}

class _EmptyLoadingTextWidgetState extends State<EmptyLoadingTextWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Text(
      widget.text!,
      style: FlutterFlowTheme.of(context).bodyText1.override(
            fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
            color: FlutterFlowTheme.of(context).secondaryText,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).bodyText1Family),
          ),
    );
  }
}
