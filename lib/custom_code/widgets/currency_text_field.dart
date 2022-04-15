// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code

// Begin custom widget code
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CurrencyTextField extends StatefulWidget {
  const CurrencyTextField({
    Key key,
    this.width,
    this.height,
    this.amount,
    this.labelText,
    this.hintText,
    //this.moneyController,
  }) : super(key: key);

  final double width;
  final double height;
  final int amount;
  final String labelText;
  final String hintText;
  //final MoneyMaskedTextController moneyController;

  @override
  _CurrencyTextFieldState createState() => _CurrencyTextFieldState();
}

class _CurrencyTextFieldState extends State<CurrencyTextField> {
  TextEditingController textController;
  var controller = new MaskedTextController(mask: '000.000.000-00');

  var moneyController = new MoneyMaskedTextController(
      decimalSeparator: '.',
      thousandSeparator: ',',
      leftSymbol: '\₦',
      initialValue: 0.0);

  @override
  void initState() {
    // if ((moneyController.numberValue < 1.0)) {
    //   moneyController.updateValue(160000);
    // }
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => moneyController.updateValue(widget.amount / 100));
  }

  @override
  Widget build(BuildContext context) {
    moneyController.afterChange = (String masked, double raw) {
      setState(() {
        FFAppState().currencyTextField = (raw * 100).round();
      });
      print(FFAppState().currencyTextField);
    };

    setState(() {});

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: TextFormField(
        controller: moneyController,
        obscureText: false,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        style: FlutterFlowTheme.of(context).bodyText1,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
