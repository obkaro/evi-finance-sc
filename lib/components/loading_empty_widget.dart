import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingEmptyWidget extends StatefulWidget {
  const LoadingEmptyWidget({Key? key}) : super(key: key);

  @override
  _LoadingEmptyWidgetState createState() => _LoadingEmptyWidgetState();
}

class _LoadingEmptyWidgetState extends State<LoadingEmptyWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
