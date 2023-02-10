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

class AccountDataRefreshModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Data Sync)] action in Button widget.
  ApiCallResponse? dataSyncResponse;
  // Stores action output result for [Backend Call - API (Reauthenticate)] action in Button widget.
  ApiCallResponse? reauthCode;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
