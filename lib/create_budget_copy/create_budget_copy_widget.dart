import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../create_budget_categories/create_budget_categories_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateBudgetCopyWidget extends StatefulWidget {
  const CreateBudgetCopyWidget({Key key}) : super(key: key);

  @override
  _CreateBudgetCopyWidgetState createState() => _CreateBudgetCopyWidgetState();
}

class _CreateBudgetCopyWidgetState extends State<CreateBudgetCopyWidget> {
  BudgetCategoriesRecord uncategorized;
  BudgetsRecord createdBudget;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Create A Budget',
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
                    autovalidateMode: AutovalidateMode.always,
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
                              amount: 0,
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
                              value: switchListTileValue ??= true,
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
                            final budgetsCreateData = createBudgetsRecordData(
                              budgetOwner: currentUserReference,
                              budgetAmount: FFAppState().currencyTextField,
                              budgetDateCreated: getCurrentTimestamp,
                              budgetStart: calendarDateStartSelectedDay.start,
                              budgetEnd: calendarDateEndSelectedDay.start,
                              isRecurring: switchListTileValue,
                              budgetID: random_data.randomString(
                                10,
                                10,
                                true,
                                true,
                                true,
                              ),
                            );
                            var budgetsRecordReference =
                                BudgetsRecord.collection.doc();
                            await budgetsRecordReference.set(budgetsCreateData);
                            createdBudget = BudgetsRecord.getDocumentFromData(
                                budgetsCreateData, budgetsRecordReference);

                            final budgetCategoriesCreateData =
                                createBudgetCategoriesRecordData(
                              categoryName: 'Uncategorized',
                              categoryBudget: createdBudget.reference,
                              budgetOwner: currentUserReference,
                            );
                            var budgetCategoriesRecordReference =
                                BudgetCategoriesRecord.collection.doc();
                            await budgetCategoriesRecordReference
                                .set(budgetCategoriesCreateData);
                            uncategorized =
                                BudgetCategoriesRecord.getDocumentFromData(
                                    budgetCategoriesCreateData,
                                    budgetCategoriesRecordReference);
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CreateBudgetCategoriesWidget(
                                  createdBudget: createdBudget,
                                  uncategorized: uncategorized,
                                ),
                              ),
                              (r) => false,
                            );

                            setState(() {});
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
