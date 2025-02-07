import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../landing_page_view/landing_page_view_widget.dart';
import '../profile_settings/profile_settings_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Settings'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.versionNumber = await actions.getVersionNumber();
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
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).secondaryPrimary),
        automaticallyImplyLeading: true,
        title: Text(
          'Settings',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: FlutterFlowTheme.of(context).title3Family,
                color: FlutterFlowTheme.of(context).secondaryPrimary,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).title3Family),
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  duration: Duration(milliseconds: 200),
                                  reverseDuration: Duration(milliseconds: 200),
                                  child: ProfileSettingsWidget(),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.person_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 32,
                              ),
                              title: Text(
                                'Profile',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle1Family,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .subtitle1Family),
                                      lineHeight: 1.6,
                                    ),
                              ),
                              subtitle: Text(
                                'Edit profile details',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 20,
                              ),
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 10, 20, 16),
                            ),
                          ),
                          if (false)
                            ListTile(
                              leading: Icon(
                                Icons.star_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 32,
                              ),
                              title: Text(
                                'Subscription Plan',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle1Family,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .subtitle1Family),
                                      lineHeight: 1.6,
                                    ),
                              ),
                              subtitle: Text(
                                'Get in on Evi premium options',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 10, 20, 16),
                            ),
                          InkWell(
                            onTap: () async {
                              if ((Theme.of(context).brightness ==
                                      Brightness.dark) ==
                                  true) {
                                setDarkModeSetting(context, ThemeMode.light);
                              } else {
                                setDarkModeSetting(context, ThemeMode.dark);
                              }
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.toggle_on_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 32,
                              ),
                              title: Text(
                                'Dark Mode',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle1Family,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .subtitle1Family),
                                      lineHeight: 1.6,
                                    ),
                              ),
                              subtitle: Text(
                                'Toggle dark/light mode',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 20,
                              ),
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 10, 20, 16),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await launchURL('https://evifinance.com/privacy');
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.shield,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 32,
                              ),
                              title: Text(
                                'Personal data & Privacy',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle1Family,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .subtitle1Family),
                                      lineHeight: 1.6,
                                    ),
                              ),
                              subtitle: Text(
                                'Review and manage your data',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 10, 20, 16),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await launchURL('https://evifinance.com/terms');
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.launch_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 32,
                              ),
                              title: Text(
                                'Terms and Conditions',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle1Family,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .subtitle1Family),
                                      lineHeight: 1.6,
                                    ),
                              ),
                              subtitle: Text(
                                'Link to our TCs',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 10, 20, 16),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await launchURL('https://www.evifinance.com');
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.info_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 32,
                              ),
                              title: Text(
                                'About Us',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle1Family,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .subtitle1Family),
                                      lineHeight: 1.6,
                                    ),
                              ),
                              subtitle: Text(
                                'Learn more about Evi Finance',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 10, 20, 16),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await launchURL('https://www.evifinance.com');
                            },
                            child: ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.whatsapp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 32,
                              ),
                              title: Text(
                                'Need Help?',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle1Family,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .subtitle1Family),
                                      lineHeight: 1.6,
                                    ),
                              ),
                              subtitle: Text(
                                'Reach out via WhatsApp',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 10, 20, 16),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await signOut();
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LandingPageViewWidget(),
                                ),
                                (r) => false,
                              );
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.logout,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 32,
                              ),
                              title: Text(
                                'Logout',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle1Family,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .subtitle1Family),
                                      lineHeight: 1.6,
                                    ),
                              ),
                              subtitle: Text(
                                'Exit the app',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 10, 20, 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_model.versionNumber != null &&
                              _model.versionNumber != '')
                            Text(
                              'Evi  v${_model.versionNumber}',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
