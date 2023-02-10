import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_empty_model.dart';
export 'loading_empty_model.dart';

class LoadingEmptyWidget extends StatefulWidget {
  const LoadingEmptyWidget({Key? key}) : super(key: key);

  @override
  _LoadingEmptyWidgetState createState() => _LoadingEmptyWidgetState();
}

class _LoadingEmptyWidgetState extends State<LoadingEmptyWidget> {
  late LoadingEmptyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingEmptyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container();
  }
}
