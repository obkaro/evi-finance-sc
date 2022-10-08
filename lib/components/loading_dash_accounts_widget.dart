import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingDashAccountsWidget extends StatefulWidget {
  const LoadingDashAccountsWidget({Key? key}) : super(key: key);

  @override
  _LoadingDashAccountsWidgetState createState() =>
      _LoadingDashAccountsWidgetState();
}

class _LoadingDashAccountsWidgetState extends State<LoadingDashAccountsWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
      child: Container(
        width: 148,
        height: 148,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 20, 24, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 64,
                height: 64,
                child: Stack(
                  alignment: AlignmentDirectional(0, 0),
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 64,
                height: 16,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
