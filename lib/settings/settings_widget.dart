import '../auth/auth_util.dart';
import '../components/m_appbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../land_page/land_page_widget.dart';
import '../profile_settings/profile_settings_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  String? versionNumber;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      versionNumber = await actions.getVersionNumber();
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Settings'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(132),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: MAppbarWidget(
            titleText: 'Settings',
            icon: Icon(
              Icons.settings_rounded,
              color: Colors.white,
              size: 32,
            ),
            bgColor: FlutterFlowTheme.of(context).primaryColor,
            fgColor: FlutterFlowTheme.of(context).primaryBackground,
            textColor: Colors.white,
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileSettingsWidget(),
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
                              'Edit profile settings',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF303030),
                              size: 20,
                            ),
                            dense: false,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 16),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent('premiumClick');
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.star_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 32,
                            ),
                            title: Text(
                              'Premium Plan',
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
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 16),
                          ),
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
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 16),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await launchURL(
                                'https://www.evifinance.com/privacy-policy');
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
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 16),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await launchURL(
                                'https://www.evifinance.com/general-terms');
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
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 16),
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
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 16),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await signOut();
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LandPageWidget(),
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
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 16),
                          ),
                        ),
                      ],
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
                          Text(
                            'Evi  v${versionNumber}',
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
