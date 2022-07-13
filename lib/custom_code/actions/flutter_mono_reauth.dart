// Automatic FlutterFlow imports
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
//import '../mono_custom/mono_flutter.dart';
import 'package:evi/auth/auth_util.dart';
import 'package:evi/backend/api_requests/api_calls.dart';
import 'package:evi/dashboard/dashboard_widget.dart';
import 'package:mono_flutter/mono_flutter.dart';

extension CustomContext on BuildContext {
  double screenHeight([double percent = 1]) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth([double percent = 1]) =>
      MediaQuery.of(this).size.width * percent;
}

Future flutterMonoReauth(
  BuildContext context,
  String reauthCode,
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
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        const Radius.circular(24.0),
                      ),
                      child: MonoWebView(
                        apiKey: 'live_pk_dNWUp8sYwG5mGXq3mFOT',
                        //config: "abc",
                        reAuthCode: reauthCode,
                        onEvent: (event, data) {
                          print('event: $event, data: $data');
                        },
                        onClosed: () {
                          print('Modal closed');
                          print('REAUTH CODE WAS: $reauthCode');
                        },
                        onLoad: () {
                          print('Mono loaded successfully');
                        },
                        onSuccess: (code) async {
                          print('Mono Success $code');

                          //Write temporary key to database
                          final usersUpdateData = createUsersRecordData(
                            tempAuthCode: '$code',
                          );
                          await currentUserReference!.update(usersUpdateData);

                          //Print temporary key
                          //print(currentUserDocument?.tempAuthCode);

                          //Use temporary key to get permanent key, save to variable: permKey
                          ApiCallResponse permKey =
                              await GetPermanentAuthCall.call(
                                  tempKey: (currentUserDocument?.tempAuthCode));

                          print(getJsonField(
                            (permKey?.jsonBody ?? ''),
                            r'''$.id''',
                          ).toString());

                          //Write permanent key to database
                          var accountsCreateData = createAccountsRecordData(
                            authID: getJsonField(
                              (permKey?.jsonBody ?? ''),
                              r'''$.id''',
                            ).toString(),
                            accountOwner: currentUserReference,
                          );
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
                      )),
                ))
              ],
            ));
