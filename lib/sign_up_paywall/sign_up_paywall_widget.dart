import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/notification_prompt_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/instant_timer.dart';
import '../landing_page_view/landing_page_view_widget.dart';
import '../main.dart';
import '../welcome_to_evi/welcome_to_evi_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sign_up_paywall_model.dart';
export 'sign_up_paywall_model.dart';

class SignUpPaywallWidget extends StatefulWidget {
  const SignUpPaywallWidget({Key? key}) : super(key: key);

  @override
  _SignUpPaywallWidgetState createState() => _SignUpPaywallWidgetState();
}

class _SignUpPaywallWidgetState extends State<SignUpPaywallWidget> {
  late SignUpPaywallModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpPaywallModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SignUpPaywall'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent(
        'app_pay_redirect_pageview',
        parameters: {
          'user_email': currentUserEmail,
        },
      );

      final billingEventsCreateData = createBillingEventsRecordData(
        eventDate: getCurrentTimestamp.toString(),
      );
      await BillingEventsRecord.createDoc(currentUserReference!)
          .set(billingEventsCreateData);
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          await actions.printConsole(
            'PERIOD COUNT',
          );
          if (valueOrDefault(currentUserDocument?.subStatus, '') != null &&
              valueOrDefault(currentUserDocument?.subStatus, '') != '') {
            await actions.printConsole(
              valueOrDefault(currentUserDocument?.subStatus, ''),
            );
            if (valueOrDefault(currentUserDocument?.subStatus, '') ==
                'active') {
              _model.instantTimer?.cancel();
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
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: NotificationPromptWidget(),
                      );
                    },
                  ).then((value) => setState(() {}));
                }
              }
            }
          }
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
              size: 24,
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
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 21, 0, 16),
                              child: ClipRRect(
                                child: Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://media.giphy.com/media/Tzstx0wv1Siztoaybi/giphy.gif',
                                    width: 240,
                                    height: 240,
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
                                    style: FlutterFlowTheme.of(context).title1,
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
                                    child: SelectionArea(
                                        child: Text(
                                      'Please check your email for verification and account setup.',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                            lineHeight: 1.5,
                                          ),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                            if (false)
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 16),
                                      child: SelectionArea(
                                          child: Text(
                                        'OR click here to continue in your browser.',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                              lineHeight: 1.5,
                                            ),
                                      )),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
