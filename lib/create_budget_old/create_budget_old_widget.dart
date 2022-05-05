import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../create_budget_categories/create_budget_categories_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateBudgetOldWidget extends StatefulWidget {
  const CreateBudgetOldWidget({Key key}) : super(key: key);

  @override
  _CreateBudgetOldWidgetState createState() => _CreateBudgetOldWidgetState();
}

class _CreateBudgetOldWidgetState extends State<CreateBudgetOldWidget> {
  DateTime datePicked1;
  DateTime datePicked2;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  BudgetCategoriesRecord uncategorized;
  BudgetsRecord createdBudget;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CreateBudgetOld'});
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
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
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: TextFormField(
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Budget Name',
                              hintText: 'Input budget name',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: TextFormField(
                            controller: textController2,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              hintText: 'Input budget description',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            maxLines: 4,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: TextFormField(
                            controller: textController3,
                            onChanged: (_) => EasyDebounce.debounce(
                              'textController3',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Input target amount',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              suffixIcon: textController3.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () => setState(
                                        () => textController3.clear(),
                                      ),
                                      child: Icon(
                                        Icons.clear,
                                        color: Color(0xFF757575),
                                        size: 22,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('Button-ON_TAP');
                                logFirebaseEvent('Button-Date-Time-Picker');
                                await DatePicker.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  onConfirm: (date) {
                                    setState(() => datePicked1 = date);
                                  },
                                  currentTime: getCurrentTimestamp,
                                  minTime: DateTime(0, 0, 0),
                                );
                              },
                              text: 'Set Start Date',
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('Button-ON_TAP');
                                logFirebaseEvent('Button-Date-Time-Picker');
                                await DatePicker.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  onConfirm: (date) {
                                    setState(() => datePicked2 = date);
                                  },
                                  currentTime: getCurrentTimestamp,
                                  minTime: DateTime(0, 0, 0),
                                );
                              },
                              text: 'Set End Date',
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
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
                            logFirebaseEvent('Button-Backend-Call');

                            final budgetsCreateData = createBudgetsRecordData(
                              budgetName: textController1.text,
                              budgetOwner: currentUserReference,
                              budgetAmount: int.parse(textController3.text),
                              budgetDescription: textController2.text,
                              budgetDateCreated: getCurrentTimestamp,
                              budgetStart: datePicked1,
                              budgetEnd: datePicked2,
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
                            logFirebaseEvent('Button-Navigate-To');
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
