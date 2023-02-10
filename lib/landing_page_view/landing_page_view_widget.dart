import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/new_version_found_widget.dart';
import '../components/notification_prompt_widget.dart';
import '../email_auth/email_auth_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../sign_up_paywall/sign_up_paywall_widget.dart';
import '../welcome_to_evi/welcome_to_evi_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'landing_page_view_model.dart';
export 'landing_page_view_model.dart';

class LandingPageViewWidget extends StatefulWidget {
  const LandingPageViewWidget({Key? key}) : super(key: key);

  @override
  _LandingPageViewWidgetState createState() => _LandingPageViewWidgetState();
}

class _LandingPageViewWidgetState extends State<LandingPageViewWidget> {
  late LandingPageViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LandingPageViewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LandingPageView'});
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 0,
                height: 0,
                child: custom_widgets.BackButtonControl(
                  width: 0,
                  height: 0,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: Container(
                    width: double.infinity,
                    height: 500,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                          child: PageView(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(32),
                                      child: Image.asset(
                                        'assets/images/secure_account_(1).png',
                                        width: double.infinity,
                                        height: 100,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: Text(
                                      'Connect your accounts',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: Text(
                                      'Securely import all your transactions into Evi.',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(32),
                                      child: Image.asset(
                                        'assets/images/create_a_budget_(1).png',
                                        width: double.infinity,
                                        height: 100,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: Text(
                                      'Create a Budget',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: Text(
                                      'Build and manage budgets and categories to keep track of your money',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 24, 24),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(32),
                                        child: Image.asset(
                                          'assets/images/track_expenses.png',
                                          width: double.infinity,
                                          height: 100,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: Text(
                                      'Know your money',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: Text(
                                      'Come back into the app often to assign transactions and manage your finances',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              count: 3,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) {
                                _model.pageViewController!.animateToPage(
                                  i,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              effect: smooth_page_indicator.ExpandingDotsEffect(
                                expansionFactor: 2,
                                spacing: 8,
                                radius: 16,
                                dotWidth: 16,
                                dotHeight: 16,
                                dotColor: FlutterFlowTheme.of(context)
                                    .eviredTransparent,
                                activeDotColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final user =
                                        await signInWithGoogle(context);
                                    if (user == null) {
                                      return;
                                    }
                                    FFAppState().lastSignIn =
                                        getCurrentTimestamp;

                                    final usersUpdateData =
                                        createUsersRecordData(
                                      lastActive: getCurrentTimestamp,
                                    );
                                    await currentUserReference!
                                        .update(usersUpdateData);
                                    if (valueOrDefault(
                                                currentUserDocument?.subStatus,
                                                '') !=
                                            null &&
                                        valueOrDefault(
                                                currentUserDocument?.subStatus,
                                                '') !=
                                            '') {
                                      await actions.printConsole(
                                        'PAY STATUS - ${valueOrDefault(currentUserDocument?.subStatus, '')}',
                                      );
                                      if (valueOrDefault(
                                              currentUserDocument?.subStatus,
                                              '') ==
                                          'active') {
                                        if (valueOrDefault(
                                                    currentUserDocument
                                                        ?.username,
                                                    '') ==
                                                null ||
                                            valueOrDefault(
                                                    currentUserDocument
                                                        ?.username,
                                                    '') ==
                                                '') {
                                          await Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  WelcomeToEviWidget(),
                                            ),
                                            (r) => false,
                                          );
                                        } else {
                                          if (currentUserDocument!
                                                  .activeBudget !=
                                              null) {
                                            await Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    NavBarPage(
                                                        initialPage:
                                                            'Dashboard'),
                                              ),
                                              (r) => false,
                                            );
                                          } else {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child:
                                                      NotificationPromptWidget(),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          }
                                        }
                                      } else {
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpPaywallWidget(),
                                          ),
                                          (r) => false,
                                        );
                                      }
                                    } else {
                                      await Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SignUpPaywallWidget(),
                                        ),
                                        (r) => false,
                                      );
                                    }
                                  },
                                  text: 'Sign in with Google',
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.transparent,
                                    size: 20,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 60,
                                    color: Colors.white,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2Family,
                                          color: Color(0xFF0C0C0C),
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2Family),
                                        ),
                                    elevation: 2,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.83, 0),
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/google-color-icon.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (isiOS)
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            child: Stack(
                              children: [
                                isAndroid
                                    ? Container()
                                    : Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            final user =
                                                await signInWithApple(context);
                                            if (user == null) {
                                              return;
                                            }
                                            FFAppState().lastSignIn =
                                                getCurrentTimestamp;

                                            final usersUpdateData =
                                                createUsersRecordData(
                                              lastActive: getCurrentTimestamp,
                                            );
                                            await currentUserReference!
                                                .update(usersUpdateData);
                                            if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.subStatus,
                                                        '') !=
                                                    null &&
                                                valueOrDefault(
                                                        currentUserDocument
                                                            ?.subStatus,
                                                        '') !=
                                                    '') {
                                              await actions.printConsole(
                                                'PAY STATUS - ${valueOrDefault(currentUserDocument?.subStatus, '')}',
                                              );
                                              if (valueOrDefault(
                                                      currentUserDocument
                                                          ?.subStatus,
                                                      '') ==
                                                  'active') {
                                                if (valueOrDefault(
                                                            currentUserDocument
                                                                ?.username,
                                                            '') ==
                                                        null ||
                                                    valueOrDefault(
                                                            currentUserDocument
                                                                ?.username,
                                                            '') ==
                                                        '') {
                                                  await Navigator
                                                      .pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          WelcomeToEviWidget(),
                                                    ),
                                                    (r) => false,
                                                  );
                                                } else {
                                                  if (currentUserDocument!
                                                          .activeBudget !=
                                                      null) {
                                                    await Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            NavBarPage(
                                                                initialPage:
                                                                    'Dashboard'),
                                                      ),
                                                      (r) => false,
                                                    );
                                                  } else {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child:
                                                              NotificationPromptWidget(),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  }
                                                }
                                              } else {
                                                await Navigator
                                                    .pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignUpPaywallWidget(),
                                                  ),
                                                  (r) => false,
                                                );
                                              }
                                            } else {
                                              await Navigator
                                                  .pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUpPaywallWidget(),
                                                ),
                                                (r) => false,
                                              );
                                            }
                                          },
                                          text: 'Sign in with Apple',
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.transparent,
                                            size: 20,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 60,
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2Family,
                                                      color: Colors.white,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2Family),
                                                    ),
                                            elevation: 2,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                      ),
                                Align(
                                  alignment: AlignmentDirectional(-0.83, 0),
                                  child: Container(
                                    width: 22,
                                    height: 22,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/images/apple-xxl.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EmailAuthWidget(),
                                    ),
                                  );
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: NewVersionFoundWidget(
                                          forceUpdate: false,
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                text: 'Continue with Email',
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.transparent,
                                  size: 20,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 60,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .subtitle2Family,
                                        color: Colors.white,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2Family),
                                      ),
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.83, 0),
                              child: Icon(
                                Icons.email_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
