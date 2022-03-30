// Automatic FlutterFlow imports
//import 'package:mono_flutter/mono_html.dart';

import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// Begin custom action code
//import 'package:mono_flutter/mono_flutter.dart';
//import 'package:mono_flutter/mono_web_view.dart';
import '../mono_custom/mono_flutter.dart';
import 'package:evi_finance/auth/auth_util.dart';
import 'package:evi_finance/backend/api_requests/api_calls.dart';
import 'package:evi_finance/dashboard/dashboard_widget.dart';

extension CustomContext on BuildContext {
  double screenHeight([double percent = 1]) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth([double percent = 1]) =>
      MediaQuery.of(this).size.width * percent;
}

Future flutterMonoReauth(
  String reauthCode,
  BuildContext context,
) async =>
    showDialog(
        context: context,
        builder: (_) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Container(
                  width: context.screenWidth(.95),
                  height: context.screenHeight(.8),
                  child: ReauthMonoWebView(
                    apiKey: 'live_pk_dNWUp8sYwG5mGXq3mFOT',
                    //config: "abc",
                    token: reauthCode,
                    onEvent: (event, data) {
                      print('event: $event, data: $data');
                    },
                    onClosed: () {
                      print('Modal closed');
                    },
                    onLoad: () {
                      print('Mono loaded successfully');
                    },
                    onSuccess: (code) {
                      print('Mono Success $code');
                      // onClosed: () {
                      //   print('Modal closed');
                      // },
                      // onSuccess: (code) async {
                      //   print('Mono Success $code');

                      //Write temporary key to database
                      // final usersUpdateData = createUsersRecordData(
                      //   tempAuthCode: '$code',
                      // );
                      // await currentUserReference.update(usersUpdateData);

                      // //Use temporary key to get permanent key, save to variable: permKey
                      // ApiCallResponse permKey = await GetPermanentAuthCall.call(
                      //     tempKey: (currentUserDocument?.tempAuthCode));

                      // print(getJsonField(
                      //   (permKey?.jsonBody ?? ''),
                      //   r'''$.id''',
                      // ).toString());
                    },
                  ),
                ))
              ],
            ));
