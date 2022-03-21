import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/task_create_dialog_copy_widget.dart';
import '../components/task_create_dialog_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateBudgetCopyWidget extends StatefulWidget {
  const CreateBudgetCopyWidget({
    Key key,
    this.createdBudget,
  }) : super(key: key);

  final BudgetsRecord createdBudget;

  @override
  _CreateBudgetCopyWidgetState createState() => _CreateBudgetCopyWidgetState();
}

class _CreateBudgetCopyWidgetState extends State<CreateBudgetCopyWidget> {
  TextEditingController textController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Select Categories',
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Text(
                                  'Hello World',
                                  style: FlutterFlowTheme.of(context).title3,
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Text(
                                formatNumber(
                                  widget.createdBudget.budgetAmount,
                                  formatType: FormatType.custom,
                                  currency: '',
                                  format: '',
                                  locale: '',
                                ),
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: StreamBuilder<List<ConstBudgetCategoriesRecord>>(
                    stream: queryConstBudgetCategoriesRecord(),
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
                      List<ConstBudgetCategoriesRecord>
                          gridViewConstBudgetCategoriesRecordList =
                          snapshot.data;
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 3,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount:
                            gridViewConstBudgetCategoriesRecordList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewConstBudgetCategoriesRecord =
                              gridViewConstBudgetCategoriesRecordList[
                                  gridViewIndex];
                          return InkWell(
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: TaskCreateDialogWidget(
                                      constCategory:
                                          gridViewConstBudgetCategoriesRecord
                                              .reference,
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                child:
                                    StreamBuilder<ConstBudgetCategoriesRecord>(
                                  stream:
                                      ConstBudgetCategoriesRecord.getDocument(
                                          gridViewConstBudgetCategoriesRecord
                                              .reference),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    final rowConstBudgetCategoriesRecord =
                                        snapshot.data;
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.add_rounded,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        Text(
                                          rowConstBudgetCategoriesRecord
                                              .categoryName,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: TaskCreateDialogCopyWidget(),
                              );
                            },
                          );
                        },
                        child: Text(
                          '+ Add Custom Category',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<List<BudgetCategoriesRecord>>(
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
                        columnBudgetCategoriesRecordList = snapshot.data;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children:
                          List.generate(columnBudgetCategoriesRecordList.length,
                              (columnIndex) {
                        final columnBudgetCategoriesRecord =
                            columnBudgetCategoriesRecordList[columnIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: StreamBuilder<BudgetCategoriesRecord>(
                            stream: BudgetCategoriesRecord.getDocument(
                                columnBudgetCategoriesRecord.reference),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              final rowBudgetCategoriesRecord = snapshot.data;
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 10, 0),
                                          child: AutoSizeText(
                                            rowBudgetCategoriesRecord
                                                .categoryName,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 75,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        width: 1,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 5, 5),
                                      child: TextFormField(
                                        onFieldSubmitted: (_) async {
                                          final budgetCategoriesUpdateData =
                                              createBudgetCategoriesRecordData(
                                            allocatedAmount: int.parse(
                                                textController?.text ?? ''),
                                          );
                                          await rowBudgetCategoriesRecord
                                              .reference
                                              .update(
                                                  budgetCategoriesUpdateData);
                                        },
                                        controller: textController ??=
                                            TextEditingController(
                                          text: formatNumber(
                                            rowBudgetCategoriesRecord
                                                .allocatedAmount,
                                            formatType: FormatType.custom,
                                            currency: '',
                                            format: '',
                                            locale: '',
                                          ),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: '[Some hint text...]',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.delete_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title:
                                                        Text('Are you sure?'),
                                                    content: Text(
                                                        'This cannot be undone'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: Text('Confirm'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        await rowBudgetCategoriesRecord
                                            .reference
                                            .delete();
                                      } else {
                                        return;
                                      }
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      }),
                    );
                  },
                ),
                FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Create',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
