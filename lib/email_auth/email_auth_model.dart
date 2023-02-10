import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/notification_prompt_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../forgot_password/forgot_password_widget.dart';
import '../main.dart';
import '../sign_up_paywall/sign_up_paywall_widget.dart';
import '../welcome_to_evi/welcome_to_evi_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmailAuthModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
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

  // State field(s) for sign_in_password widget.
  TextEditingController? signInPasswordController;
  late bool signInPasswordVisibility;
  String? Function(BuildContext, String?)? signInPasswordControllerValidator;
  String? _signInPasswordControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for sign_up_email widget.
  TextEditingController? signUpEmailController;
  String? Function(BuildContext, String?)? signUpEmailControllerValidator;
  String? _signUpEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for new_password widget.
  TextEditingController? newPasswordController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordControllerValidator;
  String? _newPasswordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    if (!RegExp(
            '^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@\$!%*#?&])[A-Za-z\\d@\$!%*#?&]{8,}\$')
        .hasMatch(val)) {
      return 'Password must contain a minimum of eight characters, at least one letter, one number and one special character';
    }
    return null;
  }

  // State field(s) for confirm_password widget.
  TextEditingController? confirmPasswordController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)? confirmPasswordControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    signInEmailControllerValidator = _signInEmailControllerValidator;
    signInPasswordVisibility = false;
    signInPasswordControllerValidator = _signInPasswordControllerValidator;
    signUpEmailControllerValidator = _signUpEmailControllerValidator;
    newPasswordVisibility = false;
    newPasswordControllerValidator = _newPasswordControllerValidator;
    confirmPasswordVisibility = false;
  }

  void dispose() {
    signInEmailController?.dispose();
    signInPasswordController?.dispose();
    signUpEmailController?.dispose();
    newPasswordController?.dispose();
    confirmPasswordController?.dispose();
  }

  /// Additional helper methods are added here.

}
