import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_budget_categories/edit_budget_categories_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EditBudgetWidget extends StatefulWidget {
  const EditBudgetWidget({
    Key key,
    this.createdbudget,
    this.uncategorized,
  }) : super(key: key);

  final BudgetsRecord createdbudget;
  final BudgetCategoriesRecord uncategorized;

  @override
  _EditBudgetWidgetState createState() => _EditBudgetWidgetState();
}

class _EditBudgetWidgetState extends State<EditBudgetWidget> {
  DateTimeRange calendarDateEndSelectedDay;
  DateTimeRange calendarDateStartSelectedDay;
  bool switchListTileValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarDateEndSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calendarDateStartSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'EditBudget'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0x7F000000),
        automaticallyImplyLeading: true,
        title: Text(
          'Edit Budget',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: custom_widgets.CurrencyTextField(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              amount: widget.createdbudget.budgetAmount,
                              labelText: 'Budget Amount',
                              hintText: 'Enter budget amount',
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Text(
                                    'Select Start and End Dates',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 8, 10, 10),
                                child: FlutterFlowCalendar(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  weekFormat: false,
                                  weekStartsMonday: false,
                                  initialDate: widget.createdbudget.budgetStart,
                                  onChange: (DateTimeRange newSelectedDate) {
                                    setState(() =>
                                        calendarDateStartSelectedDay =
                                            newSelectedDate);
                                  },
                                  titleStyle:
                                      FlutterFlowTheme.of(context).subtitle1,
                                  dayOfWeekStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  dateStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  selectedDateStyle:
                                      FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                          ),
                                  inactiveDateStyle: TextStyle(),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 8, 10, 10),
                                child: FlutterFlowCalendar(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  weekFormat: false,
                                  weekStartsMonday: false,
                                  initialDate: widget.createdbudget.budgetEnd,
                                  onChange: (DateTimeRange newSelectedDate) {
                                    setState(() => calendarDateEndSelectedDay =
                                        newSelectedDate);
                                  },
                                  titleStyle:
                                      FlutterFlowTheme.of(context).subtitle1,
                                  dayOfWeekStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  dateStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  selectedDateStyle:
                                      FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                          ),
                                  inactiveDateStyle: TextStyle(),
                                ),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SwitchListTile(
                              value: switchListTileValue ??=
                                  widget.createdbudget.isRecurring,
                              onChanged: (newValue) => setState(
                                  () => switchListTileValue = newValue),
                              title: Text(
                                'Repeating',
                                style: FlutterFlowTheme.of(context).subtitle1,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              activeColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: StreamBuilder<List<AccountsRecord>>(
                      stream: queryAccountsRecord(
                        queryBuilder: (accountsRecord) => accountsRecord.where(
                            'accountOwner',
                            isEqualTo: currentUserReference),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitRing(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<AccountsRecord> buttonAccountsRecordList =
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final buttonAccountsRecord =
                            buttonAccountsRecordList.isNotEmpty
                                ? buttonAccountsRecordList.first
                                : null;
                        return FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('Button-ON_TAP');
                            // Action_EditBudgetStep1
                            logFirebaseEvent('Button-Action_EditBudgetStep1');

                            final budgetsUpdateData = createBudgetsRecordData(
                              budgetAmount: FFAppState().currencyTextField,
                              budgetStart: calendarDateStartSelectedDay.start,
                              budgetEnd: calendarDateEndSelectedDay.end,
                              isRecurring: switchListTileValue,
                            );
                            await widget.createdbudget.reference
                                .update(budgetsUpdateData);
                            logFirebaseEvent('Button-Navigate-To');
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditBudgetCategoriesWidget(
                                  createdBudget: widget.createdbudget,
                                  uncategorized: widget.uncategorized,
                                ),
                              ),
                              (r) => false,
                            );
                          },
                          text: 'Next',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
