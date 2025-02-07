import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../category_single/category_single_widget.dart';
import '../components/circular_indicator_big_widget.dart';
import '../components/edit_category_widget.dart';
import '../components/empty_list_widget.dart';
import '../components/loading_catlist_widget.dart';
import '../components/loading_empty_widget.dart';
import '../components/progress_bar_widget.dart';
import '../edit_budget/edit_budget_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SingleBudgetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for circularIndicatorBig component.
  late CircularIndicatorBigModel circularIndicatorBigModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    circularIndicatorBigModel =
        createModel(context, () => CircularIndicatorBigModel());
  }

  void dispose() {
    circularIndicatorBigModel.dispose();
  }

  /// Additional helper methods are added here.

}
