import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../first_budget/first_budget_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/instant_timer.dart';
import '../landing_page_view/landing_page_view_widget.dart';
import '../main.dart';
import '../welcome_to_evi/welcome_to_evi_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpProgressWidget extends StatefulWidget {
  const SignUpProgressWidget({Key? key}) : super(key: key);

  @override
  _SignUpProgressWidgetState createState() => _SignUpProgressWidgetState();
}

class _SignUpProgressWidgetState extends State<SignUpProgressWidget> {
  InstantTimer? instantTimer;
  PaymentInfoRecord? payInfo;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          if (currentUserDocument!.paymentInfo != null) {
            payInfo = await actions.fetchPayInfo(
              context,
              currentUserDocument!.paymentInfo,
            );
            if (payInfo!.payStatus == 'active') {
              if (valueOrDefault(currentUserDocument?.username, '') == null ||
                  valueOrDefault(currentUserDocument?.username, '') == '') {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeToEviWidget(),
                  ),
                );
              } else {
                if (currentUserDocument!.activeBudget != null) {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NavBarPage(initialPage: 'Dashboard'),
                    ),
                  );
                } else {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FirstBudgetWidget(),
                    ),
                  );
                }
              }
            }
          }
        },
        startImmediately: true,
      );
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SignUpProgress'});
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    instantTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<PaymentInfoRecord>(
        stream:
            PaymentInfoRecord.getDocument(currentUserDocument!.paymentInfo!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 36,
                height: 36,
                child: SpinKitThreeBounce(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 36,
                ),
              ),
            );
          }
          final signUpProgressPaymentInfoRecord = snapshot.data!;
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
              automaticallyImplyLeading: false,
              actions: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 60,
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () async {
                    await signOut();
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LandingPageViewWidget(),
                      ),
                      (r) => false,
                    );
                  },
                ),
              ],
              centerTitle: true,
              elevation: 0,
            ),
            body: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 16),
                                  child: ClipRRect(
                                    child: Container(
                                      width: 200,
                                      height: 240,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Image.network(
                                        'https://media.giphy.com/media/Tzstx0wv1Siztoaybi/giphy.gif',
                                        width: 160,
                                        height: 160,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 16),
                                      child: Text(
                                        'One more step...',
                                        style:
                                            FlutterFlowTheme.of(context).title1,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 16),
                                        child: Text(
                                          'Visit app.evi.finance to finish signing in. As an Evi user, you can unleash the power of an informed and healthy financial life without stress.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1Family),
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
