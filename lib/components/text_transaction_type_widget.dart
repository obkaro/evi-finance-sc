import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'text_transaction_type_model.dart';
export 'text_transaction_type_model.dart';

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
  late TextTransactionTypeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextTransactionTypeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Text(
      widget.transactionType!,
      style: FlutterFlowTheme.of(context).bodyText2,
    );
  }
}
