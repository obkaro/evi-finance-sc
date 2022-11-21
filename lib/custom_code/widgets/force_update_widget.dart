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

// Begin custom widget code
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../components/new_version_found_widget.dart';
//import 'package:minimize_app/minimize_app.dart';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';

class ForceUpdateWidget extends StatefulWidget {
  const ForceUpdateWidget({
    Key? key,
    this.width,
    this.height,
    //required this.remoteVersion,
  }) : super(key: key);

  final double? width;
  final double? height;
  //final String remoteVersion;

  @override
  _ForceUpdateWidgetState createState() => _ForceUpdateWidgetState();
}

class _ForceUpdateWidgetState extends State<ForceUpdateWidget> {
  Future getVersion(VersionsRecord dashboardVersionsRecord) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    bool forceUpdateCalc = false;

    var _androidAppRetain = MethodChannel("android_app_retain");

    final List<int> currentVersion =
        version.split('.').map((String number) => int.parse(number)).toList();
    final List<int> enforcedVersion = dashboardVersionsRecord
        .versionNumberString!
        .split('.')
        .map((String number) => int.parse(number))
        .toList();

    for (int i = 0; i < 1; i++) {
      if (enforcedVersion[i] != currentVersion[i] &&
          enforcedVersion[i] > currentVersion[i]) {
        forceUpdateCalc = true;
      } else
        forceUpdateCalc = false;
    }
    // print(version);
    // print(currentVersion);
    // print(dashboardVersionsRecord.versionNumberString);
    // print(enforcedVersion);

    if (forceUpdateCalc == true) {
      FFAppState().hasUpdatePromptShown = true;
      await showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        enableDrag: false,
        constraints: BoxConstraints(
          minWidth: 1,
          minHeight: 1,
        ),
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          DateTime timeBackPressed = DateTime.now();
          return WillPopScope(
              onWillPop: () async {
                final difference = DateTime.now().difference(timeBackPressed);
                timeBackPressed = DateTime.now();
                if (difference >= Duration(seconds: 2)) {
                  final String msg = 'Press the back button to exit';
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        msg,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
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
                    //MinimizeApp.minimizeApp();
                  }
                  return true;
                }
              },
              child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: NewVersionFoundWidget(
                  forceUpdate: dashboardVersionsRecord.forceUpdate,
                ),
              ));
          // return Padding(
          //   padding: MediaQuery.of(context).viewInsets,
          //   child: NewVersionFoundWidget(
          //     forceUpdate: dashboardVersionsRecord.forceUpdate,
          //   ),
          // );
        },
      );
      // setState(() {
      //   FFAppState().hasUpdatePromptShown = false;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VersionsRecord>>(
        future: queryVersionsRecordOnce(
          queryBuilder: (versionsRecord) =>
              versionsRecord.orderBy('releaseDate', descending: true),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            // return Center(
            //   child: SizedBox(
            //     width: 50,
            //     height: 50,
            //     child: SpinKitRing(
            //       color: FlutterFlowTheme.of(context).primaryColor,
            //       size: 50,
            //     ),
            //   ),
            // );
            return Container();
          }
          List<VersionsRecord> dashboardVersionsRecordList = snapshot.data!;
          // Return an empty Container when the document does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final dashboardVersionsRecord = dashboardVersionsRecordList.first;
          if (FFAppState().hasUpdatePromptShown == false) {
            getVersion(dashboardVersionsRecord);
          }

          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          );
        });
  }
}
