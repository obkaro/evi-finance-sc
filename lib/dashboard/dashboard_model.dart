import '../account_single/account_single_widget.dart';
import '../assign_transactions/assign_transactions_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../biometric_auth/biometric_auth_widget.dart';
import '../components/circular_indicator_small_widget.dart';
import '../components/empty_list_widget.dart';
import '../components/loading_budget_summary_widget.dart';
import '../components/loading_dash_accounts_widget.dart';
import '../components/loading_empty_widget.dart';
import '../components/loading_nothingtext_title1_widget.dart';
import '../components/loading_test_widget.dart';
import '../components/loading_transaction_widget.dart';
import '../components/transaction_list_item_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../sign_up_paywall/sign_up_paywall_widget.dart';
import '../transactions/transactions_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for circularIndicatorSmall component.
  late CircularIndicatorSmallModel circularIndicatorSmallModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    circularIndicatorSmallModel =
        createModel(context, () => CircularIndicatorSmallModel());
  }

  void dispose() {
    circularIndicatorSmallModel.dispose();
  }

  /// Additional helper methods are added here.

}
