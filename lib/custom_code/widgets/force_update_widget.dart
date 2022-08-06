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
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../components/new_version_found_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<VersionsRecord>>(
        stream: queryVersionsRecord(
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

          Future getVersion() async {
            final PackageInfo packageInfo = await PackageInfo.fromPlatform();

            String appName = packageInfo.appName;
            String packageName = packageInfo.packageName;
            String version = packageInfo.version;
            String buildNumber = packageInfo.buildNumber;

            bool forceUpdateCalc = false;

            final List<int> currentVersion = version
                .split('.')
                .map((String number) => int.parse(number))
                .toList();
            final List<int> enforcedVersion = dashboardVersionsRecord
                .versionNumberString!
                .split('.')
                .map((String number) => int.parse(number))
                .toList();

            for (int i = 0; i < 3; i++) {
              if (enforcedVersion[i] != currentVersion[i] &&
                  enforcedVersion[i] > currentVersion[i]) {
                forceUpdateCalc = true;
              } else
                forceUpdateCalc = false;
            }
            print(version);
            print(currentVersion);
            print(dashboardVersionsRecord.versionNumberString);
            print(enforcedVersion);

            if (forceUpdateCalc == true) {
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
                  return WillPopScope(
                      onWillPop: () async => false,
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
            }
          }

          getVersion();

          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          );
        });
  }
}
