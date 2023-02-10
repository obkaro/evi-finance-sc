import '../auth/auth_util.dart';
import '../email_auth/email_auth_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for sign_in_email widget.
  TextEditingController? signInEmailController;
  String? Function(BuildContext, String?)? signInEmailControllerValidator;
  String? _signInEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    signInEmailControllerValidator = _signInEmailControllerValidator;
  }

  void dispose() {
    signInEmailController?.dispose();
  }

  /// Additional helper methods are added here.

}
