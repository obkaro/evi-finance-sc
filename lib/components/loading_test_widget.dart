import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoadingTestWidget extends StatefulWidget {
  const LoadingTestWidget({Key? key}) : super(key: key);

  @override
  _LoadingTestWidgetState createState() => _LoadingTestWidgetState();
}

class _LoadingTestWidgetState extends State<LoadingTestWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Icon(
      Icons.notifications_rounded,
      color: FlutterFlowTheme.of(context).secondarySecondary,
      size: 24,
    );
  }
}
