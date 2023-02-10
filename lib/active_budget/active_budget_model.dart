import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../category_single/category_single_widget.dart';
import '../components/circular_indicator_big_widget.dart';
import '../components/create_custom_category_widget.dart';
import '../components/edit_category_widget.dart';
import '../components/empty_list_widget.dart';
import '../components/loading_catlist_widget.dart';
import '../components/loading_empty_widget.dart';
import '../components/m_appbar_widget.dart';
import '../components/progress_bar_widget.dart';
import '../create_budget/create_budget_widget.dart';
import '../edit_budget/edit_budget_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActiveBudgetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in ActiveBudget widget.
  BudgetsRecord? newcreatedBudget;
  // Model for m_appbar component.
  late MAppbarModel mAppbarModel;
  // Model for circularIndicatorBig component.
  late CircularIndicatorBigModel circularIndicatorBigModel;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  BudgetsRecord? createdBudget;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  BudgetsRecord? createdBudget2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mAppbarModel = createModel(context, () => MAppbarModel());
    circularIndicatorBigModel =
        createModel(context, () => CircularIndicatorBigModel());
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
