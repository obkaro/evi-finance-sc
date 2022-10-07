import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Container(
      width: widget.width?.toDouble(),
      height: widget.height?.toDouble(),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
        width: widget.width?.toDouble(),
        height: 10,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
