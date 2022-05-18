import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyLinkedAccountsWidget extends StatefulWidget {
  const EmptyLinkedAccountsWidget({Key key}) : super(key: key);

  @override
  _EmptyLinkedAccountsWidgetState createState() =>
      _EmptyLinkedAccountsWidgetState();
}

class _EmptyLinkedAccountsWidgetState extends State<EmptyLinkedAccountsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: () async {
            logFirebaseEvent('Column-ON_TAP');
            // Action_linkAcct
            logFirebaseEvent('Column-Action_linkAcct');
            await actions.flutterMono(
              context,
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Text(
                  'Oops...looks like you\'re yet to link an account.\nClick here to  link a new account.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
