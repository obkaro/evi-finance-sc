// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// Begin custom action code
import '../mono_custom/mono_flutter.dart';
import 'package:evi/auth/auth_util.dart';
import 'package:evi/backend/api_requests/api_calls.dart';
import 'package:evi/dashboard/dashboard_widget.dart';
import '../actions/index.dart' as actions;

extension CustomContext on BuildContext {
  double screenHeight([double percent = 1]) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth([double percent = 1]) =>
      MediaQuery.of(this).size.width * percent;
}

Future flutterMono(
  // Add your function code here!
  //Key key,
  BuildContext context,
//   {

//   /// Public Key from your https://app.withmono.com/apps
//   //Key key,

//   /// Success callback
//   Function(String code) onSuccess,

//   /// Mono popup Close callback
//   Function onClosed,

//   /// final Widget error;
//   Widget error,
// }
) async =>
    showDialog(
        //BuildContext context,
        //builder: (context) =>
        context: context,
        builder: (_) =>
            // context: context
            // builder: (BuildContext context) =>
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Container(
                  width: context.screenWidth(.95),
                  height: context.screenHeight(.8),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        const Radius.circular(32.0),
                      ),
                      child: MonoWebView(
                        apiKey: 'live_pk_dNWUp8sYwG5mGXq3mFOT',
                        onClosed: () {
                          print('Modal closed');
                        },
                        onSuccess: (code) async {
                          //print('Mono Success $code');

                          //Write temporary key to database
                          final usersUpdateData = createUsersRecordData(
                            tempAuthCode: '$code',
                          );
                          await currentUserReference.update(usersUpdateData);

                          //Print temporary key
                          //print(currentUserDocument?.tempAuthCode);

                          //Use temporary key to get permanent key, save to variable: permKey
                          ApiCallResponse permKey =
                              await GetPermanentAuthCall.call(
                                  tempKey: (currentUserDocument?.tempAuthCode));

                          // print(getJsonField(
                          //   (permKey?.jsonBody ?? ''),
                          //   r'''$.id''',
                          // ).toString());

                          //Write permanent key to database
                          var accountsCreateData = createAccountsRecordData(
                            authID: getJsonField(
                              (permKey?.jsonBody ?? ''),
                              r'''$.id''',
                            ).toString(),
                            accountOwner: currentUserReference,
                          );

                          final accountsRecordReference =
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

                          ApiCallResponse acctInfoResponse =
                              await GetAccountInfoCall.call(
                            authID: newacct.authID,
                          );

                          print((acctInfoResponse?.jsonBody ?? '').toString());
                          final accountsUpdateData = createAccountsRecordData(
                            accountName: getJsonField(
                              (acctInfoResponse?.jsonBody ?? ''),
                              r'''$.account.name''',
                            ).toString(),
                            accountBalance: getJsonField(
                              (acctInfoResponse?.jsonBody ?? ''),
                              r'''$.account.balance''',
                            ),
                            dataStatus: getJsonField(
                              (acctInfoResponse?.jsonBody ?? ''),
                              r'''$.meta.data_status''',
                            ).toString(),
                            institutionName: getJsonField(
                              (acctInfoResponse?.jsonBody ?? ''),
                              r'''$.account.institution.name''',
                            ).toString(),
                            accountType: getJsonField(
                              (acctInfoResponse?.jsonBody ?? ''),
                              r'''$.account.type''',
                            ).toString(),
                            bankCode: getJsonField(
                              (acctInfoResponse?.jsonBody ?? ''),
                              r'''$.account.institution.bankCode''',
                            ).toString(),
                            institutionType: getJsonField(
                              (acctInfoResponse?.jsonBody ?? ''),
                              r'''$.account.institution.type''',
                            ).toString(),
                            authMethod: getJsonField(
                              (acctInfoResponse?.jsonBody ?? ''),
                              r'''$.meta.auth_method''',
                            ).toString(),
                            bvn: getJsonField(
                              (acctInfoResponse?.jsonBody ?? ''),
                              r'''$.account.bvn''',
                            ).toString(),
                            currency: getJsonField(
                              (acctInfoResponse?.jsonBody ?? ''),
                              r'''$.account.currency''',
                            ).toString(),
                            accountNumber: getJsonField(
                              (acctInfoResponse?.jsonBody ?? ''),
                              r'''$.account.accountNumber''',
                            ).toString(),
                            dateLinked: getCurrentTimestamp,
                            lastSync: getCurrentTimestamp,
                          );
                          await newacct.reference.update(accountsUpdateData);

                          logFirebaseEvent('Initial_Write_Transactions');
                          ApiCallResponse transactionsResponse =
                              await GetTransactionsCall.call(
                            authID: newacct.authID,
                          );
                          //print(transactionsResponse?.jsonBody ?? '');
                          // logFirebaseEvent(
                          //     'FloatingActionButton-Custom-Action');
                          //print('ABOUT TO RUN TRANSACTION WRITE');
                          await actions.writeNewAcctTransactions(
                            (transactionsResponse?.jsonBody ?? ''),
                            newacct,
                          );
                        },
                      )),
                ))
              ],
            ));
