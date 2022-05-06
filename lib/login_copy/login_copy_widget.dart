import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginCopyWidget extends StatefulWidget {
  const LoginCopyWidget({Key key}) : super(key: key);

  @override
  _LoginCopyWidgetState createState() => _LoginCopyWidgetState();
}

class _LoginCopyWidgetState extends State<LoginCopyWidget> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController inputEmailController;

  @override
  void initState() {
    super.initState();
    inputEmailController = TextEditingController();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LoginCopy'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/100naira.jpg',
                      ).image,
                    ),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional(0, 1),
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(
                          color: Color(0x99000000),
                        ),
                        alignment: AlignmentDirectional(-1, 0),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 16),
                                child: Text(
                                  'Forgot Password',
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Spline Sans',
                                        color: Colors.white,
                                        fontSize: 32,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Form(
                                  key: formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 20, 20, 20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 16),
                                            child: TextFormField(
                                              controller: inputEmailController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Email',
                                                hintText: 'Enter your email',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'Button_SignUp-ON_TAP');
                                            logFirebaseEvent(
                                                'Button_SignUp-Validate-Form');
                                            if (formKey.currentState == null ||
                                                !formKey.currentState
                                                    .validate()) {
                                              return;
                                            }

                                            // Action_SignUp
                                            logFirebaseEvent(
                                                'Button_SignUp-Action_SignUp');
                                            if (inputEmailController
                                                .text.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Email required!',
                                                  ),
                                                ),
                                              );
                                              return;
                                            }
                                            await resetPassword(
                                              email: inputEmailController.text,
                                              context: context,
                                            );
                                            logFirebaseEvent(
                                                'Button_SignUp-Navigate-To');
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginWidget(),
                                              ),
                                            );
                                          },
                                          text: 'Reset Password',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 55,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily:
                                                          'Source Sans Pro',
                                                      color: Colors.white,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius: 16,
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
                    ],
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
