import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/dialog_box_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_const_category_model.dart';
export 'create_const_category_model.dart';

class CreateConstCategoryWidget extends StatefulWidget {
  const CreateConstCategoryWidget({
    Key? key,
    this.constCategory,
    this.budget,
  }) : super(key: key);

  final ConstBudgetCategoriesRecord? constCategory;
  final BudgetsRecord? budget;

  @override
  _CreateConstCategoryWidgetState createState() =>
      _CreateConstCategoryWidgetState();
}

class _CreateConstCategoryWidgetState extends State<CreateConstCategoryWidget> {
  late CreateConstCategoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateConstCategoryModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 14,
              color: FlutterFlowTheme.of(context).shadowGray,
            )
          ],
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Text(
                              widget.constCategory!.categoryName!,
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Left to allocate: ',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                              Text(
                                '${functions.formatTransCurrency(widget.budget!.unallocatedAmount)}',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: custom_widgets.CurrencyTextField(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    amount: 0,
                    labelText: 'Amount',
                    hintText: 'Enter amount',
                    bgcolor: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: FlutterFlowTheme.of(context).fadedDivider,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Cancel',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context).subtitle2,
                            elevation: 0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      Container(
                        width: 20,
                        decoration: BoxDecoration(),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (FFAppState().currencyTextField <=
                                widget.budget!.unallocatedAmount!) {
                              final budgetsUpdateData = {
                                'unallocatedAmount': FieldValue.increment(
                                    -(FFAppState().currencyTextField)),
                              };
                              await widget.budget!.reference
                                  .update(budgetsUpdateData);

                              final categoriesCreateData =
                                  createCategoriesRecordData(
                                categoryName:
                                    widget.constCategory!.categoryName,
                                categoryAmount: FFAppState().currencyTextField,
                                categoryBudget: widget.budget!.reference,
                                categoryId: random_data.randomString(
                                  24,
                                  24,
                                  true,
                                  true,
                                  true,
                                ),
                                spentAmount: 0,
                                categoryOwner: currentUserReference,
                                createdDate: getCurrentTimestamp,
                              );
                              await CategoriesRecord.createDoc(
                                      widget.budget!.reference)
                                  .set(categoriesCreateData);
                              Navigator.pop(context);
                            } else {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: DialogBoxWidget(
                                      heading: 'Budget Amount Exceeded',
                                      body:
                                          'Please enter a value lower than the target budget, or increase the target budget value',
                                      buttonYes: 'Okay',
                                      buttonNo: 'n',
                                      information: true,
                                      yesAction: () async {},
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            }
                          },
                          text: 'Save',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .subtitle2Family,
                                  color: Colors.white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .subtitle2Family),
                                ),
                            elevation: 2,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
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
      ),
    );
  }
}
