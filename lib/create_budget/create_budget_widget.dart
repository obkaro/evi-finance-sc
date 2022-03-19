import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateBudgetWidget extends StatefulWidget {
  const CreateBudgetWidget({Key key}) : super(key: key);

  @override
  _CreateBudgetWidgetState createState() => _CreateBudgetWidgetState();
}

class _CreateBudgetWidgetState extends State<CreateBudgetWidget> {
  ApiCallResponse trasactionJsonResponse;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
                fontFamily: 'Poppins',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextFormField(
                        controller: textController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Budget Name',
                          hintText: 'Input budget name',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      TextFormField(
                        controller: textController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          hintText: 'Input budget description',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 30, 0, 40),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1,
                        keyboardType: TextInputType.multiline,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: TextFormField(
                          controller: textController3,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Input total amount',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<List<BudgetCategoriesRecord>>(
                  stream: queryBudgetCategoriesRecord(
                    queryBuilder: (budgetCategoriesRecord) =>
                        budgetCategoriesRecord.where('budgetOwner',
                            isEqualTo: currentUserReference),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<BudgetCategoriesRecord>
                        gridViewBudgetCategoriesRecordList = snapshot.data;
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      primary: false,
                      scrollDirection: Axis.vertical,
                      itemCount: gridViewBudgetCategoriesRecordList.length,
                      itemBuilder: (context, gridViewIndex) {
                        final gridViewBudgetCategoriesRecord =
                            gridViewBudgetCategoriesRecordList[gridViewIndex];
                        return Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                gridViewBudgetCategoriesRecord.categoryName,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              TextFormField(
                                controller: textController4 ??=
                                    TextEditingController(
                                  text: formatNumber(
                                    gridViewBudgetCategoriesRecord
                                        .allocatedAmount,
                                    formatType: FormatType.custom,
                                    currency: '',
                                    format: '',
                                    locale: '',
                                  ),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'amount',
                                  hintText: '[Some hint text...]',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: StreamBuilder<List<AccountsRecord>>(
                  stream: queryAccountsRecord(
                    queryBuilder: (accountsRecord) => accountsRecord
                        .where('accountOwner', isEqualTo: currentUserReference),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
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
                        trasactionJsonResponse = await GetTransactionsCall.call(
                          authID: buttonAccountsRecord.authID,
                        );
                        await actions.writeTransactions(
                          (trasactionJsonResponse?.jsonBody ?? ''),
                        );

                        final transactionsCreateData =
                            createTransactionsRecordData(
                          account: buttonAccountsRecord.reference,
                          trasactionDate: getCurrentTimestamp,
                          monoCategory: getJsonField(
                            (trasactionJsonResponse?.jsonBody ?? ''),
                            r'''$.data.category''',
                          ).toString(),
                          transactionOwner: currentUserReference,
                          balanceAfter: getJsonField(
                            (trasactionJsonResponse?.jsonBody ?? ''),
                            r'''$.data.balance''',
                          ),
                          transactionAmount: getJsonField(
                            (trasactionJsonResponse?.jsonBody ?? ''),
                            r'''$.data.amount''',
                          ),
                        );
                        await TransactionsRecord.collection
                            .doc()
                            .set(transactionsCreateData);

                        setState(() {});
                      },
                      text: 'Create',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
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
    );
  }
}
