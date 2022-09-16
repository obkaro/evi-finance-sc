import '../accounts/accounts_widget.dart';
import '../budgets/budgets_widget.dart';
import '../components/m_appbar_widget.dart';
import '../components/m_grid_menu_item_widget.dart';
import '../edit_income_sources/edit_income_sources_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../recurring_payments/recurring_payments_widget.dart';
import '../settings/settings_widget.dart';
import '../transactions/transactions_widget.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Menu'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(132),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: MAppbarWidget(
            titleText: 'Menu',
            icon: Icon(
              Icons.featured_play_list_rounded,
              color: Colors.white,
              size: 24,
            ),
            bgColor: FlutterFlowTheme.of(context).secondaryColor,
            fgColor: FlutterFlowTheme.of(context).primaryBackground,
            textColor: FlutterFlowTheme.of(context).secondaryPrimary,
            actionIcon: Icon(
              Icons.settings_rounded,
              color: FlutterFlowTheme.of(context).secondaryPrimary,
              size: 24,
            ),
            iconAction: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavBarPage(initialPage: 'Menu'),
                ),
              );
            },
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      MGridMenuItemWidget(
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
                              builder: (context) => RecurringPaymentsWidget(),
                            ),
                          );
                        },
                      ),
                      MGridMenuItemWidget(
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
                      MGridMenuItemWidget(
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
                      MGridMenuItemWidget(
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
                      MGridMenuItemWidget(
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
                              builder: (context) => EditIncomeSourcesWidget(),
                            ),
                          );
                        },
                      ),
                      MGridMenuItemWidget(
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
                    ],
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
