import '../admin/admin_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../profile_settings/profile_settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Profile'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Container(
                    width: double.infinity,
                    height: 72,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(1, 1, 1, 1),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Icon(
                              Icons.settings_rounded,
                              color: Color(0xFFF4F4F4),
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(8, 0, 20, 0),
                            child: Text(
                              'Settings',
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Spline Sans',
                                        color: Color(0xFFF4F4F4),
                                        useGoogleFonts: false,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent('ListTile-ON_TAP');
                            logFirebaseEvent('ListTile-Navigate-To');
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
                                    fontFamily: 'Source Sans Pro',
                                    lineHeight: 1.6,
                                  ),
                            ),
                            subtitle: Text(
                              'Edit profile settings',
                              style: FlutterFlowTheme.of(context).subtitle2,
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
                            logFirebaseEvent('ListTile-ON_TAP');
                            logFirebaseEvent('ListTile-Google-Analytics-Event');
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
                                    fontFamily: 'Source Sans Pro',
                                    lineHeight: 1.6,
                                  ),
                            ),
                            subtitle: Text(
                              'Get in on Evi premium options',
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                            dense: false,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 16),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent('ListTile-ON_TAP');
                            if ((Theme.of(context).brightness ==
                                    Brightness.dark) ==
                                true) {
                              logFirebaseEvent(
                                  'ListTile-Set-Dark-Mode-Settings');
                              setDarkModeSetting(context, ThemeMode.light);
                            } else {
                              logFirebaseEvent(
                                  'ListTile-Set-Dark-Mode-Settings');
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
                                    fontFamily: 'Source Sans Pro',
                                    lineHeight: 1.6,
                                  ),
                            ),
                            subtitle: Text(
                              'Toggle dark/light mode',
                              style: FlutterFlowTheme.of(context).subtitle2,
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
                            logFirebaseEvent('ListTile-ON_TAP');
                            logFirebaseEvent('ListTile-Launch-U-R-L');
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
                                    fontFamily: 'Source Sans Pro',
                                    lineHeight: 1.6,
                                  ),
                            ),
                            subtitle: Text(
                              'Review and manage your data',
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                            dense: false,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 16),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent('ListTile-ON_TAP');
                            logFirebaseEvent('ListTile-Launch-U-R-L');
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
                                    fontFamily: 'Source Sans Pro',
                                    lineHeight: 1.6,
                                  ),
                            ),
                            subtitle: Text(
                              'Link to our TCs',
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                            dense: false,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 16),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent('ListTile-ON_TAP');
                            logFirebaseEvent('ListTile-Launch-U-R-L');
                            await launchURL('https://www.evifinance.com');
                          },
                          onLongPress: () async {
                            logFirebaseEvent('ListTile-ON_LONG_PRESS');
                            logFirebaseEvent('ListTile-Navigate-To');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminWidget(),
                              ),
                            );
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
                                    fontFamily: 'Source Sans Pro',
                                    lineHeight: 1.6,
                                  ),
                            ),
                            subtitle: Text(
                              'Learn more about Evi Finance',
                              style: FlutterFlowTheme.of(context).subtitle2,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
