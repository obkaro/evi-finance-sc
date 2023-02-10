import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_test_model.dart';
export 'loading_test_model.dart';

class LoadingTestWidget extends StatefulWidget {
  const LoadingTestWidget({Key? key}) : super(key: key);

  @override
  _LoadingTestWidgetState createState() => _LoadingTestWidgetState();
}

class _LoadingTestWidgetState extends State<LoadingTestWidget> {
  late LoadingTestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingTestModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
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
