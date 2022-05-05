import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import '../sign_up/sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LandPageWidget extends StatefulWidget {
  const LandPageWidget({Key key}) : super(key: key);

  @override
  _LandPageWidgetState createState() => _LandPageWidgetState();
}

class _LandPageWidgetState extends State<LandPageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LandPage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
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
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: Color(0x98000000),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Maximize your income.',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Spline Sans',
                                              color: Colors.white,
                                              fontSize: 48,
                                              useGoogleFonts: false,
                                            ),
                                      ).animated([
                                        animationsMap[
                                            'textOnPageLoadAnimation1']
                                      ]),
                                      Text(
                                        'Live Better, with Evi.',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Spline Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontSize: 32,
                                              useGoogleFonts: false,
                                            ),
                                      ).animated([
                                        animationsMap[
                                            'textOnPageLoadAnimation2']
                                      ]),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 40, 0, 0),
                                        child: Text(
                                          'Evi wants to be your personal accountant, helping you make detailed financial plans and execute on those plans effectively.',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Source Sans Pro',
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                lineHeight: 1.4,
                                              ),
                                        ).animated([
                                          animationsMap[
                                              'textOnPageLoadAnimation3']
                                        ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent('Button_SignUp-ON_TAP');
                                    logFirebaseEvent(
                                        'Button_SignUp-Navigate-To');
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.topToBottom,
                                        duration: Duration(milliseconds: 200),
                                        reverseDuration:
                                            Duration(milliseconds: 200),
                                        child: SignUpWidget(),
                                      ),
                                    );
                                  },
                                  text: 'Sign Up',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 55,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Source Sans Pro',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 32,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent('Button_Login-ON_TAP');
                                    logFirebaseEvent(
                                        'Button_Login-Navigate-To');
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.scale,
                                        alignment: Alignment.bottomCenter,
                                        duration: Duration(milliseconds: 500),
                                        reverseDuration:
                                            Duration(milliseconds: 500),
                                        child: LoginWidget(),
                                      ),
                                    );
                                  },
                                  text: 'Login',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 55,
                                    color: Color(0x001B2124),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Source Sans Pro',
                                          color: Color(0xFFE4E5E6),
                                        ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 32,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
