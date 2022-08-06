// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:package_info_plus/package_info_plus.dart';

Future<bool> checkForceUpdate(String remoteVersion) async {
  // Add your function code here!
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String appName = packageInfo.appName;
  String packageName = packageInfo.packageName;
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;

  final List<int> currentVersion =
      version.split('.').map((String number) => int.parse(number)).toList();
  final List<int> enforcedVersion = remoteVersion
      .split('.')
      .map((String number) => int.parse(number))
      .toList();
  for (int i = 0; i < 3; i++) {
    if (enforcedVersion[i] > currentVersion[i]) return true;
  }
  return false;
}
