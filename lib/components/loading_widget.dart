import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<PaymentInfoRecord>(
        stream:
            PaymentInfoRecord.getDocument(currentUserDocument!.paymentInfo!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 36,
                height: 36,
                child: SpinKitThreeBounce(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 36,
                ),
              ),
            );
          }
          final containerPaymentInfoRecord = snapshot.data!;
          return Container(
            width: 1,
            height: 1,
            decoration: BoxDecoration(),
          );
        },
      ),
    );
  }
}
