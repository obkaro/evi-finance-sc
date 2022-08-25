import '../backend/backend.dart';
import '../components/c_button_filled_copy_widget.dart';
import '../create_recurring/create_recurring_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRecurringPaymentWidget extends StatefulWidget {
  const AddRecurringPaymentWidget({
    Key? key,
    this.recurringPayment,
  }) : super(key: key);

  final SubscriptionsRecord? recurringPayment;

  @override
  _AddRecurringPaymentWidgetState createState() =>
      _AddRecurringPaymentWidgetState();
}

class _AddRecurringPaymentWidgetState extends State<AddRecurringPaymentWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConstRecurringPaymentsRecord>>(
      stream: queryConstRecurringPaymentsRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitRing(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<ConstRecurringPaymentsRecord>
            containerConstRecurringPaymentsRecordList = snapshot.data!;
        return Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add new payment',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 350,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Builder(
                            builder: (context) {
                              final subsfromcontainer =
                                  containerConstRecurringPaymentsRecordList
                                      .toList();
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: subsfromcontainer.length,
                                itemBuilder: (context, subsfromcontainerIndex) {
                                  final subsfromcontainerItem =
                                      subsfromcontainer[subsfromcontainerIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 10, 0),
                                    child: Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        subsfromcontainerItem.icon!,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateRecurringWidget(
                          subscriptionRecord:
                              widget.recurringPayment!.reference,
                        ),
                      ),
                    );
                  },
                  child: CButtonFilledCopyWidget(
                    text: 'Custom',
                    icon: Icon(
                      Icons.add_rounded,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
