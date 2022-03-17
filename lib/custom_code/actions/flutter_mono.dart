// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom action code
// Begin custom action code
import 'package:mono_flutter/mono_flutter.dart';
import 'package:evi_finance/auth/auth_util.dart';
import 'package:evi_finance/backend/api_requests/api_calls.dart';
import 'package:evi_finance/dashboard/dashboard_widget.dart';

extension CustomContext on BuildContext {
  double screenHeight([double percent = 1]) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth([double percent = 1]) =>
      MediaQuery.of(this).size.width * percent;
}

Future flutterMono(
  // Add your function code here!
  //Key key,
  BuildContext context, {

  /// Public Key from your https://app.withmono.com/apps
  //Key key,

  /// Success callback
  Function(String code) onSuccess,

  /// Mono popup Close callback
  Function onClosed,

  /// final Widget error;
  Widget error,
}) async =>
    showDialog(
        //BuildContext context,
        //builder: (context) =>
        context: context,
        builder: (_) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Container(
                  width: context.screenWidth(.9),
                  height: context.screenHeight(.73),
                  child: MonoWebView(
                    apiKey: 'test_pk_8MSZBepR1V75hvZ2bPlu',
                    onClosed: () {
                      print('Modal closed');
                    },
                    onSuccess: (code) async {
                      print('Mono Success $code');

                      //Write temporary key to database
                      final usersUpdateData = createUsersRecordData(
                        tempAuthCode: '$code',
                      );
                      await currentUserReference.update(usersUpdateData);

                      //Print temporary key
                      print(currentUserDocument?.tempAuthCode);

                      //Use temporary key to get permanent key, save to variable: permKey
                      ApiCallResponse permKey = await GetPermanentAuthCall.call(
                          tempKey: (currentUserDocument?.tempAuthCode));

                      print(getJsonField(
                        (permKey?.jsonBody ?? ''),
                        r'''$.id''',
                      ).toString());

                      //Write permanent key to database
                      final accountsCreateData = createAccountsRecordData(
                        authID: getJsonField(
                          (permKey?.jsonBody ?? ''),
                          r'''$.id''',
                        ).toString(),
                        accountOwner: currentUserReference,
                      );

                      var accountsRecordReference =
                          AccountsRecord.collection.doc();
                      await accountsRecordReference.set(accountsCreateData);
                      AccountsRecord newacct =
                          AccountsRecord.getDocumentFromData(
                              accountsCreateData, accountsRecordReference);

                      final usersUpdateData2 = {
                        'accountsList':
                            FieldValue.arrayUnion([newacct.reference]),
                      };

                      await currentUserReference.update(usersUpdateData2);

                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardWidget(
                            command: 'get_acct_info',
                            newAccount: newacct.reference,
                          ),
                        ),
                      );
                      //setState(() {});
                    },
                  ),
                ))
              ],
            ));
