// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

//import 'package:minimize_app/minimize_app.dart';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';

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
  var _androidAppRetain = MethodChannel("android_app_retain");

  @override
  Widget build(BuildContext context) {
    DateTime timeBackPressed = DateTime.now();
    return WillPopScope(
      child: SizedBox.shrink(),
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        timeBackPressed = DateTime.now();
        if (difference >= Duration(seconds: 2)) {
          final String msg = 'Press the back button again to exit';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                msg,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      color: Color(0xFFE7E7E7),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: Colors.black,
            ),
          );
          return false;
        } else {
          if (Platform.isAndroid) {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          } else {
            _androidAppRetain.invokeMethod("sendToBackground");
            //MinimizeApp.minimizeApp(); ASDFASDFASDG
          }
          return true;
        }
      },
    );
  }
}
