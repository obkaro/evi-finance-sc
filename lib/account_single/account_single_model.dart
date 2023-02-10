import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/account_data_refresh_widget.dart';
import '../components/dialog_box_widget.dart';
import '../components/empty_list_widget.dart';
import '../components/loading_empty_widget.dart';
import '../components/transaction_list_item_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountSingleModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Data Sync)] action in Column widget.
  ApiCallResponse? dataSyncResponse;
  // Stores action output result for [Backend Call - API (Reauthenticate)] action in Column widget.
  ApiCallResponse? reauthCode;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
