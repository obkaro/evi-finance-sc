// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:minimize_app/minimize_app.dart';

class BackButtonControl extends StatefulWidget {
  const BackButtonControl({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _BackButtonControlState createState() => _BackButtonControlState();
}

class _BackButtonControlState extends State<BackButtonControl> {
  @override
  Widget build(BuildContext context) {
    DateTime timeBackPressed = DateTime.now();
    return WillPopScope(
      child: SizedBox.shrink(),
      onWillPop: () async {
        final differeance = DateTime.now().difference(timeBackPressed);
        timeBackPressed = DateTime.now();
        if (differeance >= Duration(seconds: 2)) {
          final String msg = 'Press the back button to exit';
          Fluttertoast.showToast(
            msg: msg,
          );
          return false;
        } else {
          Fluttertoast.cancel();
          SystemNavigator.pop();
          return true;
        }
      },
    );
  }
}
