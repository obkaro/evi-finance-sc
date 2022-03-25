import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/select_account_widget.dart';
import '../components/set_budget_comp_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTransactionWidget extends StatefulWidget {
  const AddTransactionWidget({Key key}) : super(key: key);

  @override
  _AddTransactionWidgetState createState() => _AddTransactionWidgetState();
}

class _AddTransactionWidgetState extends State<AddTransactionWidget> {
  String choiceChipsValue;
  TextEditingController textController1;
  TextEditingController textController2;
  TransactionsRecord createdTransaction;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final transactionsCreateData = createTransactionsRecordData();
      var transactionsRecordReference = TransactionsRecord.collection.doc();
      await transactionsRecordReference.set(transactionsCreateData);
      createdTransaction = TransactionsRecord.getDocumentFromData(
          transactionsCreateData, transactionsRecordReference);
    });

    textController1 = TextEditingController();
    textController2 = TextEditingController();
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
                            child: TextFormField(
                              controller: textController1,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Amount (N)',
                                hintText: 'Transaction amount',
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
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Select Account',
                            style: FlutterFlowTheme.of(context).subtitle1,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: FutureBuilder<List<AccountsRecord>>(
                              future: queryAccountsRecordOnce(
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
                                      child: SpinKitFadingFour(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<AccountsRecord>
                                    gridViewAccountsRecordList = snapshot.data;
                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 1,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: gridViewAccountsRecordList.length,
                                  itemBuilder: (context, gridViewIndex) {
                                    final gridViewAccountsRecord =
                                        gridViewAccountsRecordList[
                                            gridViewIndex];
                                    return Stack(
                                      alignment: AlignmentDirectional(0, 0),
                                      children: [
                                        if ((gridViewAccountsRecord
                                                .reference) ==
                                            (createdTransaction.account))
                                          Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        StreamBuilder<List<AccountsRecord>>(
                                          stream: queryAccountsRecord(
                                            queryBuilder: (accountsRecord) =>
                                                accountsRecord
                                                    .where('accountOwner',
                                                        isEqualTo:
                                                            currentUserReference)
                                                    .where('institutionName',
                                                        isEqualTo:
                                                            gridViewAccountsRecord
                                                                .institutionName),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: SpinKitFadingFour(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AccountsRecord>
                                                circleImageAccountsRecordList =
                                                snapshot.data;
                                            return InkWell(
                                              onTap: () async {
                                                if ((circleImageAccountsRecordList
                                                        .length) >
                                                    1) {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child:
                                                            SelectAccountWidget(
                                                          accountsList:
                                                              gridViewAccountsRecord,
                                                          transaction:
                                                              createdTransaction,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                } else {
                                                  final transactionsUpdateData =
                                                      createTransactionsRecordData(
                                                    account:
                                                        gridViewAccountsRecord
                                                            .reference,
                                                  );
                                                  await createdTransaction
                                                      .reference
                                                      .update(
                                                          transactionsUpdateData);
                                                }
                                              },
                                              child: Container(
                                                width: 65,
                                                height: 65,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  'https://picsum.photos/seed/34/600',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
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
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: FlutterFlowChoiceChips(
                              initiallySelected: [choiceChipsValue],
                              options: [
                                ChipData('Credit', Icons.add_circle_outlined),
                                ChipData('Debit', Icons.do_disturb_on_rounded)
                              ],
                              onChanged: (val) =>
                                  setState(() => choiceChipsValue = val.first),
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
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
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF323B45),
                                    ),
                                iconColor: Color(0xFF323B45),
                                iconSize: 18,
                                elevation: 2,
                              ),
                              chipSpacing: 10,
                              multiselect: false,
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
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: TextFormField(
                              controller: textController2,
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
                              style: FlutterFlowTheme.of(context).bodyText1,
                              maxLines: 4,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (createdTransaction.account != null) {
                            final transactionsUpdateData =
                                createTransactionsRecordData(
                              trasactionDate: getCurrentTimestamp,
                              transactionOwner: currentUserReference,
                              transactionAmount:
                                  int.parse(textController1.text),
                              transactionNarration: textController2.text,
                              transactionType: choiceChipsValue,
                            );
                            await createdTransaction.reference
                                .update(transactionsUpdateData);
                          } else {
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

                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: SetBudgetCompWidget(
                                  transaction: createdTransaction,
                                ),
                              );
                            },
                          );
                        },
                        text: 'Save',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50,
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
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
