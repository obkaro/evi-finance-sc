import '../admin/admin_widget.dart';
import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../land_page/land_page_widget.dart';
import '../profile_settings/profile_settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Settings'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color(0x00FF0054),
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.settings_rounded,
                                  color: Colors.white,
                                  size: 32,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 20, 24, 20),
                                  child: Text(
                                    'Settings',
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Spline Sans',
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
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
                            logFirebaseEvent(
                                'SETTINGS_PAGE_ListTile_qqxxabj2_ON_TAP');
                            logFirebaseEvent('ListTile_Navigate-To');
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
                            logFirebaseEvent(
                                'SETTINGS_PAGE_ListTile_3wei8tcz_ON_TAP');
                            logFirebaseEvent('ListTile_Google-Analytics-Event');
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
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                            dense: false,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 16),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'SETTINGS_PAGE_ListTile_70fqxdup_ON_TAP');
                            if ((Theme.of(context).brightness ==
                                    Brightness.dark) ==
                                true) {
                              logFirebaseEvent(
                                  'ListTile_Set-Dark-Mode-Settings');
                              setDarkModeSetting(context, ThemeMode.light);
                            } else {
                              logFirebaseEvent(
                                  'ListTile_Set-Dark-Mode-Settings');
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
                            logFirebaseEvent(
                                'SETTINGS_PAGE_ListTile_m9i30zwn_ON_TAP');
                            logFirebaseEvent('ListTile_Launch-U-R-L');
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
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                            dense: false,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 16),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'SETTINGS_PAGE_ListTile_sqoev60t_ON_TAP');
                            logFirebaseEvent('ListTile_Launch-U-R-L');
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
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                            dense: false,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 16),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'SETTINGS_PAGE_ListTile_zlwx8mil_ON_TAP');
                            logFirebaseEvent('ListTile_Launch-U-R-L');
                            await launchURL('https://www.evifinance.com');
                          },
                          onLongPress: () async {
                            logFirebaseEvent(
                                'SETTINGS_PAGE_ListTile_zlwx8mil_ON_LONG_PRESS');
                            logFirebaseEvent('ListTile_Navigate-To');
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
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                            dense: false,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 16),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'SETTINGS_PAGE_ListTile_e96bswaa_ON_TAP');
                            logFirebaseEvent('ListTile_Auth');
                            await signOut();
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LandPageWidget(),
                              ),
                              (r) => false,
                            );
                          },
                          onLongPress: () async {
                            logFirebaseEvent(
                                'SETTINGS_PAGE_ListTile_e96bswaa_ON_LONG_PRESS');
                            logFirebaseEvent('ListTile_Navigate-To');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminWidget(),
                              ),
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
                                    fontFamily: 'Source Sans Pro',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
