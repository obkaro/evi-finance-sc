import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/set_budget_comp_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTransactionWidget extends StatefulWidget {
  const AddTransactionWidget({
    Key key,
    this.defaultAccount,
  }) : super(key: key);

  final DocumentReference defaultAccount;

  @override
  _AddTransactionWidgetState createState() => _AddTransactionWidgetState();
}

class _AddTransactionWidgetState extends State<AddTransactionWidget> {
  String choiceChipsValue;
  TextEditingController textController;
  TransactionsRecord createdTransaction;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('AddTransaction-ON_PAGE_LOAD');
      logFirebaseEvent('AddTransaction-Update-Local-State');
      setState(() => FFAppState().currencyTextField = 0);
      logFirebaseEvent('AddTransaction-Backend-Call');

      final transactionsCreateData = createTransactionsRecordData(
        account: widget.defaultAccount,
      );
      var transactionsRecordReference = TransactionsRecord.collection.doc();
      await transactionsRecordReference.set(transactionsCreateData);
      createdTransaction = TransactionsRecord.getDocumentFromData(
          transactionsCreateData, transactionsRecordReference);
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AddTransaction'});
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Add Transaction',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: custom_widgets.CurrencyTextField(
                                width: double.infinity,
                                height: 60,
                                amount: FFAppState().currencyTextField,
                                labelText: 'Amount',
                                hintText: 'Input transaction amount',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Selected Account No:',
                              style: FlutterFlowTheme.of(context).subtitle1,
                            ),
                            Text(
                              FFAppState().selectedAcctName,
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: StreamBuilder<List<AccountsRecord>>(
                              stream: queryAccountsRecord(
                                queryBuilder: (accountsRecord) =>
                                    accountsRecord.where('accountOwner',
                                        isEqualTo: currentUserReference),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitRing(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<AccountsRecord> columnAccountsRecordList =
                                    snapshot.data;
                                return SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        columnAccountsRecordList.length,
                                        (columnIndex) {
                                      final columnAccountsRecord =
                                          columnAccountsRecordList[columnIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'Container-ON_TAP');
                                            logFirebaseEvent(
                                                'Container-Update-Local-State');
                                            setState(() =>
                                                FFAppState().selectedAcctName =
                                                    columnAccountsRecord
                                                        .accountNumber);
                                            logFirebaseEvent(
                                                'Container-Backend-Call');

                                            final transactionsUpdateData =
                                                createTransactionsRecordData(
                                              account: columnAccountsRecord
                                                  .reference,
                                            );
                                            await createdTransaction.reference
                                                .update(transactionsUpdateData);
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 1,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 10, 20, 10),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FutureBuilder<
                                                        List<
                                                            ConstInstitutionLogosRecord>>(
                                                      future:
                                                          queryConstInstitutionLogosRecordOnce(
                                                        queryBuilder: (constInstitutionLogosRecord) =>
                                                            constInstitutionLogosRecord.where(
                                                                'institutionCode',
                                                                isEqualTo: columnAccountsRecord
                                                                            .bankCode !=
                                                                        ''
                                                                    ? columnAccountsRecord
                                                                        .bankCode
                                                                    : null),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  SpinKitRing(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<ConstInstitutionLogosRecord>
                                                            stackConstInstitutionLogosRecordList =
                                                            snapshot.data;
                                                        // Return an empty Container when the document does not exist.
                                                        if (snapshot
                                                            .data.isEmpty) {
                                                          return Container();
                                                        }
                                                        final stackConstInstitutionLogosRecord =
                                                            stackConstInstitutionLogosRecordList
                                                                    .isNotEmpty
                                                                ? stackConstInstitutionLogosRecordList
                                                                    .first
                                                                : null;
                                                        return Container(
                                                          width: 70,
                                                          height: 70,
                                                          child: Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            300),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                ),
                                                              ),
                                                              Image.network(
                                                                stackConstInstitutionLogosRecord
                                                                    .institutionLogo,
                                                                width: 45,
                                                                height: 45,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 0,
                                                                    0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          10),
                                                              child: Text(
                                                                columnAccountsRecord
                                                                    .institutionName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1,
                                                              ),
                                                            ),
                                                            Text(
                                                              functions.formatTransCurrency(
                                                                  columnAccountsRecord
                                                                      .accountBalance),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 6, 0, 16),
                              child: FlutterFlowChoiceChips(
                                initiallySelected: [choiceChipsValue],
                                options: [
                                  ChipData('Credit', Icons.add_circle_outlined),
                                  ChipData('Debit', Icons.do_disturb_on_rounded)
                                ],
                                onChanged: (val) => setState(
                                    () => choiceChipsValue = val.first),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                      ),
                                  iconColor: Colors.white,
                                  iconSize: 18,
                                  elevation: 0,
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF323B45),
                                      ),
                                  iconColor: Color(0xFF323B45),
                                  iconSize: 18,
                                  elevation: 1,
                                ),
                                chipSpacing: 10,
                                multiselect: false,
                                alignment: WrapAlignment.start,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                              child: TextFormField(
                                controller: textController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Narration',
                                  hintText: 'Enter narration',
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
                                style: FlutterFlowTheme.of(context).subtitle1,
                                maxLines: 4,
                              ),
                            ),
                          ),
                        ],
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('Button-ON_TAP');
                          if ((createdTransaction.account != null)) {
                            if ((choiceChipsValue != null) &&
                                (choiceChipsValue != '')) {
                              if ((FFAppState().currencyTextField) > 0) {
                                // Action_SaveNewTransaction
                                logFirebaseEvent(
                                    'Button-Action_SaveNewTransaction');

                                final transactionsUpdateData =
                                    createTransactionsRecordData(
                                  trasactionDate: getCurrentTimestamp,
                                  transactionOwner: currentUserReference,
                                  transactionAmount:
                                      FFAppState().currencyTextField,
                                  transactionNarration: textController.text,
                                  transactionType: choiceChipsValue,
                                );
                                await createdTransaction.reference
                                    .update(transactionsUpdateData);
                                logFirebaseEvent('Button-Bottom-Sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: SetBudgetCompWidget(
                                        transaction: createdTransaction,
                                      ),
                                    );
                                  },
                                );
                              } else {
                                logFirebaseEvent('Button-Alert-Dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('No Account Selected'),
                                      content: Text(
                                          'Please enter an amount for this transaction'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Okay'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            } else {
                              logFirebaseEvent('Button-Alert-Dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Credit or Debit'),
                                    content: Text(
                                        'Please select credit or debit for this transaction'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Okay'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            logFirebaseEvent('Button-Alert-Dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('No Account Selected'),
                                  content: Text(
                                      'Please select an account from the list'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Okay'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        text: 'Save',
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
