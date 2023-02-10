import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_recurring_payment_widget.dart';
import '../components/create_custom_category_widget.dart';
import '../components/loading_empty_widget.dart';
import '../components/new_income_source_widget.dart';
import '../components/text_transaction_type_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransactionSingleModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for text_transaction_type component.
  late TextTransactionTypeModel textTransactionTypeModel;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textTransactionTypeModel =
        createModel(context, () => TextTransactionTypeModel());
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
