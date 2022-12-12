import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoadingSecbgTextWidget extends StatefulWidget {
  const LoadingSecbgTextWidget({
    Key? key,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  final int? height;
  final int? width;
  final Color? color;

  @override
  _LoadingSecbgTextWidgetState createState() => _LoadingSecbgTextWidgetState();
}

class _LoadingSecbgTextWidgetState extends State<LoadingSecbgTextWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: widget.width?.toDouble(),
      height: 40,
      decoration: BoxDecoration(),
      child: Container(
        width: widget.width?.toDouble(),
        height: 6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
