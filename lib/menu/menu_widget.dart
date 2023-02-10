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
import 'menu_model.dart';
export 'menu_model.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> with TickerProviderStateMixin {
  late MenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'gridViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Menu'});
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: wrapWithModel(
                model: _model.mAppbarModel,
                updateCallback: () => setState(() {}),
                child: MAppbarWidget(
                  titleText: 'Menu',
                  icon: Icon(
                    Icons.apps_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                  bgColor: FlutterFlowTheme.of(context).secondaryColor,
                  fgColor: FlutterFlowTheme.of(context).primaryBackground,
                  textColor: FlutterFlowTheme.of(context).secondaryPrimary,
                  actionIcon: Icon(
                    Icons.settings_rounded,
                    color: FlutterFlowTheme.of(context).secondaryPrimary,
                    size: 20,
                  ),
                  iconAction: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsWidget(),
                      ),
                    );
                  },
                ),
              ),
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 0,
                height: 0,
                child: custom_widgets.BackButtonControl(
                  width: 0,
                  height: 0,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        childAspectRatio: 1,
                      ),
                      scrollDirection: Axis.vertical,
                      children: [
                        wrapWithModel(
                          model: _model.mGridMenuItemModel1,
                          updateCallback: () => setState(() {}),
                          child: MGridMenuItemWidget(
                            menuText: 'Subscriptions',
                            menuIcon: Icon(
                              Icons.credit_card_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 36,
                            ),
                            fgColor: FlutterFlowTheme.of(context).primaryText,
                            bgColor: Colors.transparent,
                            action: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RecurringPaymentsWidget(),
                                ),
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.mGridMenuItemModel2,
                          updateCallback: () => setState(() {}),
                          child: MGridMenuItemWidget(
                            menuText: 'Transactions',
                            menuIcon: Icon(
                              Icons.compare_arrows_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 36,
                            ),
                            fgColor: FlutterFlowTheme.of(context).primaryText,
                            bgColor: Colors.transparent,
                            action: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TransactionsWidget(),
                                ),
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.mGridMenuItemModel3,
                          updateCallback: () => setState(() {}),
                          child: MGridMenuItemWidget(
                            menuText: 'Accounts',
                            menuIcon: Icon(
                              Icons.account_balance_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 36,
                            ),
                            fgColor: FlutterFlowTheme.of(context).primaryText,
                            bgColor: Colors.transparent,
                            action: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AccountsWidget(),
                                ),
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.mGridMenuItemModel4,
                          updateCallback: () => setState(() {}),
                          child: MGridMenuItemWidget(
                            menuText: 'Budgets',
                            menuIcon: Icon(
                              Icons.pie_chart_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 36,
                            ),
                            fgColor: FlutterFlowTheme.of(context).primaryText,
                            bgColor: Colors.transparent,
                            action: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BudgetsWidget(),
                                ),
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.mGridMenuItemModel5,
                          updateCallback: () => setState(() {}),
                          child: MGridMenuItemWidget(
                            menuText: 'Income',
                            menuIcon: Icon(
                              Icons.attach_money_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 36,
                            ),
                            fgColor: FlutterFlowTheme.of(context).primaryText,
                            bgColor: Colors.transparent,
                            action: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditIncomeSourcesWidget(),
                                ),
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.mGridMenuItemModel6,
                          updateCallback: () => setState(() {}),
                          child: MGridMenuItemWidget(
                            menuText: 'Settings',
                            menuIcon: Icon(
                              Icons.settings_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 36,
                            ),
                            fgColor: FlutterFlowTheme.of(context).primaryText,
                            bgColor: Colors.transparent,
                            action: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SettingsWidget(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['gridViewOnPageLoadAnimation']!),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
