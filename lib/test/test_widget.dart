import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../dashboard/dashboard_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({Key key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  AccountsRecord newacct;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final accountsCreateData = createAccountsRecordData(
        authID: 'ssdadfwe',
        accountOwner: currentUserReference,
      );
      var accountsRecordReference = AccountsRecord.collection.doc();
      await accountsRecordReference.set(accountsCreateData);
      newacct = AccountsRecord.getDocumentFromData(
          accountsCreateData, accountsRecordReference);

      final usersUpdateData = {
        'accountsList': FieldValue.arrayUnion([newacct.reference]),
      };
      await currentUserReference.update(usersUpdateData);
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardWidget(
            command: 'get_acct_info',
            newAccount: newacct.reference,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
