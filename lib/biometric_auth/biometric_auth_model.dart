import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../email_auth/email_auth_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../sign_up_paywall/sign_up_paywall_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class BiometricAuthModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for sign_in_email widget.
  TextEditingController? signInEmailController;
  String? Function(BuildContext, String?)? signInEmailControllerValidator;
  // State field(s) for sign_in_password widget.
  TextEditingController? signInPasswordController;
  String? Function(BuildContext, String?)? signInPasswordControllerValidator;
  bool auth2 = false;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    signInEmailController?.dispose();
    signInPasswordController?.dispose();
  }

  /// Additional helper methods are added here.

}
