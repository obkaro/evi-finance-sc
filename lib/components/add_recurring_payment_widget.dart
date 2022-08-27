import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/c_button_filled_copy_widget.dart';
import '../create_recurring/create_recurring_widget.dart';
import '../edit_subsciption/edit_subsciption_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

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
  SubscriptionsRecord? newSub2;
  SubscriptionsRecord? newSub;

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
          height: 480,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 372,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
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
                                  child: InkWell(
                                    onTap: () async {
                                      Navigator.pop(context);

                                      final subscriptionsCreateData =
                                          createSubscriptionsRecordData(
                                        name: subsfromcontainerItem.name,
                                        icon: subsfromcontainerItem.icon,
                                      );
                                      var subscriptionsRecordReference =
                                          SubscriptionsRecord.collection.doc();
                                      await subscriptionsRecordReference
                                          .set(subscriptionsCreateData);
                                      newSub = SubscriptionsRecord
                                          .getDocumentFromData(
                                              subscriptionsCreateData,
                                              subscriptionsRecordReference);
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CreateRecurringWidget(
                                            subscriptionRecord:
                                                newSub!.reference,
                                          ),
                                        ),
                                      );

                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: CachedNetworkImage(
                                                    imageUrl:
                                                        subsfromcontainerItem
                                                            .icon!,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: subsfromcontainerItem
                                                      .icon!,
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: subsfromcontainerItem.icon!,
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    subsfromcontainerItem.icon!,
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      Navigator.pop(context);

                      final subscriptionsCreateData =
                          createSubscriptionsRecordData();
                      var subscriptionsRecordReference =
                          SubscriptionsRecord.collection.doc();
                      await subscriptionsRecordReference
                          .set(subscriptionsCreateData);
                      newSub2 = SubscriptionsRecord.getDocumentFromData(
                          subscriptionsCreateData,
                          subscriptionsRecordReference);
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditSubsciptionWidget(
                            subscriptionRecord: newSub2!.reference,
                          ),
                        ),
                      );

                      setState(() {});
                    },
                    child: CButtonFilledCopyWidget(
                      text: 'Custom',
                      icon: Icon(
                        Icons.add_rounded,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 20,
                      ),
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
