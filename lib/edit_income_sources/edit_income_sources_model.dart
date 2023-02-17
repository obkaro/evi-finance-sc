import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/c_button_filled_copy_widget.dart';
import '../components/loading_empty_widget.dart';
import '../components/new_income_source_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditIncomeSourcesModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for c_buttonFilledCopy component.
  late CButtonFilledCopyModel cButtonFilledCopyModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cButtonFilledCopyModel =
        createModel(context, () => CButtonFilledCopyModel());
  }

  void dispose() {
    cButtonFilledCopyModel.dispose();
  }

  /// Additional helper methods are added here.

}
