import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/loading_gridlogos_widget.dart';
import '../create_recurring/create_recurring_widget.dart';
import '../edit_subsciption/edit_subsciption_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddRecurringPaymentWidget extends StatefulWidget {
  const AddRecurringPaymentWidget({Key? key}) : super(key: key);

  @override
  _AddRecurringPaymentWidgetState createState() =>
      _AddRecurringPaymentWidgetState();
}

class _AddRecurringPaymentWidgetState extends State<AddRecurringPaymentWidget> {
  SubscriptionsRecord? newSub2;
  SubscriptionsRecord? newSub;

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: FutureBuilder<List<ConstMerchantsRecord>>(
                      future: queryConstMerchantsRecordOnce(
                        queryBuilder: (constMerchantsRecord) =>
                            constMerchantsRecord.where('tags',
                                arrayContains: 'subscription'),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: LoadingGridlogosWidget(),
                          );
                        }
                        List<ConstMerchantsRecord>
                            gridViewConstMerchantsRecordList = snapshot.data!;
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
                          itemCount: gridViewConstMerchantsRecordList.length,
                          itemBuilder: (context, gridViewIndex) {
                            final gridViewConstMerchantsRecord =
                                gridViewConstMerchantsRecordList[gridViewIndex];
                            return InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                  'app_create_subscription',
                                  parameters: {
                                    'user_email': currentUserEmail,
                                  },
                                );

                                final subscriptionsCreateData =
                                    createSubscriptionsRecordData(
                                  name: gridViewConstMerchantsRecord.name,
                                  icon: gridViewConstMerchantsRecord.logo,
                                  owner: currentUserReference,
                                );
                                var subscriptionsRecordReference =
                                    SubscriptionsRecord.collection.doc();
                                await subscriptionsRecordReference
                                    .set(subscriptionsCreateData);
                                newSub =
                                    SubscriptionsRecord.getDocumentFromData(
                                        subscriptionsCreateData,
                                        subscriptionsRecordReference);
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CreateRecurringWidget(
                                      subscriptionRecord: newSub!.reference,
                                    ),
                                  ),
                                );
                                Navigator.pop(context);

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
                                      10, 10, 10, 10),
                                  child: Hero(
                                    tag: gridViewConstMerchantsRecord.logo!,
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            gridViewConstMerchantsRecord.logo!,
                                        fit: BoxFit.scaleDown,
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
            FFButtonWidget(
              onPressed: () async {
                final subscriptionsCreateData = createSubscriptionsRecordData(
                  owner: currentUserReference,
                );
                var subscriptionsRecordReference =
                    SubscriptionsRecord.collection.doc();
                await subscriptionsRecordReference.set(subscriptionsCreateData);
                newSub2 = SubscriptionsRecord.getDocumentFromData(
                    subscriptionsCreateData, subscriptionsRecordReference);
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditSubsciptionWidget(
                      subscriptionRecord: newSub2!.reference,
                    ),
                  ),
                );
                Navigator.pop(context);

                setState(() {});
              },
              text: 'Custom',
              icon: Icon(
                Icons.add_rounded,
                size: 18,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 48,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).subtitle2Family),
                    ),
                elevation: 0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).fadedDivider,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              showLoadingIndicator: false,
            ),
          ],
        ),
      ),
    );
  }
}
