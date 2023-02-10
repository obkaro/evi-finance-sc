import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/spinning_default_img_grid_widget.dart';
import '../create_recurring/create_recurring_widget.dart';
import '../edit_subsciption/edit_subsciption_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddRecurringPaymentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  SubscriptionsRecord? newSub;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SubscriptionsRecord? newSub2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
