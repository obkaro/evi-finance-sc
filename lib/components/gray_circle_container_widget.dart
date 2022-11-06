import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class GrayCircleContainerWidget extends StatefulWidget {
  const GrayCircleContainerWidget({Key? key}) : super(key: key);

  @override
  _GrayCircleContainerWidgetState createState() =>
      _GrayCircleContainerWidgetState();
}

class _GrayCircleContainerWidgetState extends State<GrayCircleContainerWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
