import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkMonoCopyWidget extends StatefulWidget {
  const LinkMonoCopyWidget({Key key}) : super(key: key);

  @override
  _LinkMonoCopyWidgetState createState() => _LinkMonoCopyWidgetState();
}

class _LinkMonoCopyWidgetState extends State<LinkMonoCopyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Link your bank account',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Spline Sans',
                color: Colors.white,
                fontSize: 22,
                useGoogleFonts: false,
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
          child: custom_widgets.MonoConnect(
            width: 375,
            height: 720,
          ),
        ),
      ),
    );
  }
}
