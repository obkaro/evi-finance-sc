import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/circular_indicator_big_widget.dart';
import '../components/edit_category_widget.dart';
import '../components/loading_empty_widget.dart';
import '../components/loading_transaction_widget.dart';
import '../components/transaction_list_item_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategorySingleModel extends FlutterFlowModel {
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
