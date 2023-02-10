import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'overlay_alert_model.dart';
export 'overlay_alert_model.dart';

class OverlayAlertWidget extends StatefulWidget {
  const OverlayAlertWidget({Key? key}) : super(key: key);

  @override
  _OverlayAlertWidgetState createState() => _OverlayAlertWidgetState();
}

class _OverlayAlertWidgetState extends State<OverlayAlertWidget> {
  late OverlayAlertModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OverlayAlertModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(64, 64, 64, 64),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Visibility(
              visible: FFAppState().pageOverlayVisible,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32, 32, 32, 32),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Icon(
                        Icons.check_circle_rounded,
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        size: 128,
                      ),
                    ),
                    Text(
                      'Transaction Assigned',
                      style: FlutterFlowTheme.of(context).subtitle1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
