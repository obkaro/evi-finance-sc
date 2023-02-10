import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_loading_text_model.dart';
export 'empty_loading_text_model.dart';

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
  late EmptyLoadingTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyLoadingTextModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
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
