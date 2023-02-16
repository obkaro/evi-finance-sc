import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_secbg_text_model.dart';
export 'loading_secbg_text_model.dart';

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
  late LoadingSecbgTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingSecbgTextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
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
