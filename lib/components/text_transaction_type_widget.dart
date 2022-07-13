import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTransactionTypeWidget extends StatefulWidget {
  const TextTransactionTypeWidget({
    Key? key,
    this.transactionType,
  }) : super(key: key);

  final String? transactionType;

  @override
  _TextTransactionTypeWidgetState createState() =>
      _TextTransactionTypeWidgetState();
}

class _TextTransactionTypeWidgetState extends State<TextTransactionTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello World',
      style: FlutterFlowTheme.of(context).bodyText1,
    );
  }
}
