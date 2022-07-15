import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSettingsWidget extends StatefulWidget {
  const ProfileSettingsWidget({Key? key}) : super(key: key);

  @override
  _ProfileSettingsWidgetState createState() => _ProfileSettingsWidgetState();
}

class _ProfileSettingsWidgetState extends State<ProfileSettingsWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProfileSettings'});
    textController1 = TextEditingController(text: currentUserDisplayName);
    textController2 = TextEditingController(text: currentUserEmail);
    textController3 = TextEditingController(text: currentPhoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
        automaticallyImplyLeading: true,
        title: Text(
          'Profile Settings',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: FlutterFlowTheme.of(context).title2Family,
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 24),
                          child: AuthUserStreamWidget(
                            child: TextFormField(
                              controller: textController1,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController1',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                hintText: 'New username here',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              keyboardType: TextInputType.name,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: textController2,
                          onChanged: (_) => EasyDebounce.debounce(
                            'textController2',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          readOnly: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Email address here',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                          child: AuthUserStreamWidget(
                            child: TextFormField(
                              controller: textController3,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController3',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              autofocus: true,
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Phone',
                                hintText: 'Phone number here',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (formKey.currentState == null ||
                                  !formKey.currentState!.validate()) {
                                return;
                              }

                              final usersUpdateData = createUsersRecordData(
                                displayName: textController1!.text,
                                email: textController2!.text,
                                phoneNumber: textController3!.text,
                              );
                              await currentUserReference!
                                  .update(usersUpdateData);
                              Navigator.pop(context);
                            },
                            text: 'Save',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 60,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .subtitle2Family,
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
