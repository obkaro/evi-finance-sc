import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountDataRefreshWidget extends StatefulWidget {
  const AccountDataRefreshWidget({
    Key? key,
    this.account,
  }) : super(key: key);

  final AccountsRecord? account;

  @override
  _AccountDataRefreshWidgetState createState() =>
      _AccountDataRefreshWidgetState();
}

class _AccountDataRefreshWidgetState extends State<AccountDataRefreshWidget> {
  ApiCallResponse? dataSyncResponse;
  ApiCallResponse? reauthCode;

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 14,
              color: FlutterFlowTheme.of(context).shadowGray,
            )
          ],
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Account Data Refresh',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.refresh_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 72,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: 0,
                          runSpacing: 0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                              child: Text(
                                'Due to connection protocols from ${valueOrDefault<String>(
                                  widget.account!.institutionName,
                                  'your bank',
                                )}, you may need to provide authentication to get your account data up to date.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                      lineHeight: 1.2,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: FlutterFlowTheme.of(context).fadedDivider,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Don\'t Refresh',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60,
                            color: Color(0x00D2D2D2),
                            textStyle: FlutterFlowTheme.of(context).subtitle2,
                            elevation: 0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      Container(
                        width: 20,
                        decoration: BoxDecoration(),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            // Action_dataSyncCall
                            dataSyncResponse =
                                await MonoGroup.dataSyncCall.call(
                              authID: widget.account!.authID,
                            );
                            FFAppState().update(() {
                              FFAppState().dataSyncCode = getJsonField(
                                (dataSyncResponse?.jsonBody ?? ''),
                                r'''$.code''',
                              ).toString();
                            });
                            if (FFAppState().dataSyncCode ==
                                'REAUTHORISATION_REQUIRED') {
                              // Action_ReauthCall
                              reauthCode =
                                  await MonoGroup.reauthenticateCall.call(
                                authID: widget.account!.authID,
                              );
                              // Action_ReauthAcct
                              await actions.flutterMonoReauth(
                                context,
                                getJsonField(
                                  (reauthCode?.jsonBody ?? ''),
                                  r'''$.token''',
                                ).toString(),
                                widget.account!,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Refreshing transactions. This might take some time...',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family,
                                          color: Color(0xFFD1D1D1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 8000),
                                  backgroundColor: Colors.black,
                                ),
                              );
                              logFirebaseEvent(
                                'app_account_refresh',
                                parameters: {
                                  'user_email': currentUserEmail,
                                },
                              );
                            } else {
                              if (FFAppState().dataSyncCode ==
                                  'SYNC_SUCCESSFUL') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Refreshing transactions. This might take some time...',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            color: Color(0xFFC1C1C1),
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 8000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                                logFirebaseEvent(
                                  'app_account_refresh',
                                  parameters: {
                                    'user_email': currentUserEmail,
                                  },
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Synchronization Error: Please try again later',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            color: Color(0xFFE7E7E7),
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                              }
                            }

                            Navigator.pop(context);

                            setState(() {});
                          },
                          text: 'Continue',
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
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .subtitle2Family),
                                ),
                            elevation: 2,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          showLoadingIndicator: false,
                        ),
                      ),
                    ],
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
