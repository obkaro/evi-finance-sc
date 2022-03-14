// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:mono_flutter/mono_flutter.dart';
//import '../backend/backend.dart';

class MonoConnect extends StatefulWidget {
  const MonoConnect({
    Key key,
    this.width,
    this.height,
    this.code,
  }) : super(key: key);

  final double width;
  final double height;
  final String code;

  @override
  _MonoConnectState createState() => _MonoConnectState();
}

class _MonoConnectState extends State<MonoConnect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MonoWebView(
        apiKey: 'test_pk_8MSZBepR1V75hvZ2bPlu',
        onClosed: () {
          print('Modal closed');
        },
        onSuccess: (code) {
          print('Mono Success $code');
          final testCreateData = createTestRecordData(
            auth: 'Are you happy?',
            masdf: '$code',
          );
          TestRecord.collection.doc().set(testCreateData);

          //Navigator.pop(context, code);
          //final aMono = code;
        },
      ),
    );
  }
}
