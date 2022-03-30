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
import 'package:mono_flutter/mono_flutter.dart';
//import '../backend/backend.dart';
//import 'package:evi_finance/backend/schema/users_record.dart';
import 'package:evi_finance/auth/auth_util.dart';
import 'package:evi_finance/backend/api_requests/api_calls.dart';
import 'package:evi_finance/backend/api_requests/api_manager.dart';
import 'package:evi_finance/dashboard/dashboard_widget.dart';

class MonoConnect extends StatefulWidget {
  const MonoConnect({
    Key key,
    this.width,
    this.height,
    this.code,
  }) : super(key: key);

  final double width;
  final double height;
  final String code;

  @override
  _MonoConnectState createState() => _MonoConnectState();
}

class _MonoConnectState extends State<MonoConnect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MonoWebView(
        apiKey: 'live_pk_dNWUp8sYwG5mGXq3mFOT',
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

          var accountsRecordReference = AccountsRecord.collection.doc();
          await accountsRecordReference.set(accountsCreateData);
          AccountsRecord newacct = AccountsRecord.getDocumentFromData(
              accountsCreateData, accountsRecordReference);

          final usersUpdateData2 = {
            'accountsList': FieldValue.arrayUnion([newacct.reference]),
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
    );
  }
}
