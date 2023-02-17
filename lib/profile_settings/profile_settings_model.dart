import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/c_button_filled_copy_widget.dart';
import '../edit_income_sources/edit_income_sources_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileSettingsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Model for c_buttonFilledCopy component.
  late CButtonFilledCopyModel cButtonFilledCopyModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cButtonFilledCopyModel =
        createModel(context, () => CButtonFilledCopyModel());
  }

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    cButtonFilledCopyModel.dispose();
  }

  /// Additional helper methods are added here.

}
