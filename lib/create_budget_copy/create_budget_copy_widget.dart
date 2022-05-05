import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../create_budget_categories/create_budget_categories_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
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
  bool switchListTileValue;
  BudgetCategoriesRecord uncategorized;
  BudgetsRecord createdBudget;
  DateTimeRange startEndRange;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CreateBudgetCopy'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        elevation: 0,
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
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12),
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
                            logFirebaseEvent('Button-ON_TAP');
                            // Action_CreateBudgetStep1
                            logFirebaseEvent('Button-Action_CreateBudgetStep1');

                            final budgetsCreateData = createBudgetsRecordData(
                              budgetOwner: currentUserReference,
                              budgetAmount: FFAppState().currencyTextField,
                              budgetDateCreated: getCurrentTimestamp,
                              isRecurring: switchListTileValue,
                              budgetID: random_data.randomString(
                                24,
                                24,
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
                            logFirebaseEvent('Button-Backend-Call');

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
                            logFirebaseEvent('Button-Custom-Action');
                            startEndRange = await actions.selectDateRange(
                              context,
                              createdBudget,
                            );
                            logFirebaseEvent('Button-Navigate-To');
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CreateBudgetCategoriesWidget(
                                  createdBudget: createdBudget,
                                  uncategorized: uncategorized,
                                  dateRange: startEndRange,
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
