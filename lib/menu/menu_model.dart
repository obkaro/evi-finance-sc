import '../accounts/accounts_widget.dart';
import '../budgets/budgets_widget.dart';
import '../components/m_appbar_widget.dart';
import '../components/m_grid_menu_item_widget.dart';
import '../edit_income_sources/edit_income_sources_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../recurring_payments/recurring_payments_widget.dart';
import '../settings/settings_widget.dart';
import '../transactions/transactions_widget.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for m_gridMenuItem component.
  late MGridMenuItemModel mGridMenuItemModel1;
  // Model for m_gridMenuItem component.
  late MGridMenuItemModel mGridMenuItemModel2;
  // Model for m_gridMenuItem component.
  late MGridMenuItemModel mGridMenuItemModel3;
  // Model for m_gridMenuItem component.
  late MGridMenuItemModel mGridMenuItemModel4;
  // Model for m_gridMenuItem component.
  late MGridMenuItemModel mGridMenuItemModel5;
  // Model for m_gridMenuItem component.
  late MGridMenuItemModel mGridMenuItemModel6;
  // Model for m_appbar component.
  late MAppbarModel mAppbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mGridMenuItemModel1 = createModel(context, () => MGridMenuItemModel());
    mGridMenuItemModel2 = createModel(context, () => MGridMenuItemModel());
    mGridMenuItemModel3 = createModel(context, () => MGridMenuItemModel());
    mGridMenuItemModel4 = createModel(context, () => MGridMenuItemModel());
    mGridMenuItemModel5 = createModel(context, () => MGridMenuItemModel());
    mGridMenuItemModel6 = createModel(context, () => MGridMenuItemModel());
    mAppbarModel = createModel(context, () => MAppbarModel());
  }

  void dispose() {
    mGridMenuItemModel1.dispose();
    mGridMenuItemModel2.dispose();
    mGridMenuItemModel3.dispose();
    mGridMenuItemModel4.dispose();
    mGridMenuItemModel5.dispose();
    mGridMenuItemModel6.dispose();
    mAppbarModel.dispose();
  }

  /// Additional helper methods are added here.

}
