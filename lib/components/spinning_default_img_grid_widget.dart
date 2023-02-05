import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SpinningDefaultImgGridWidget extends StatefulWidget {
  const SpinningDefaultImgGridWidget({Key? key}) : super(key: key);

  @override
  _SpinningDefaultImgGridWidgetState createState() =>
      _SpinningDefaultImgGridWidgetState();
}

class _SpinningDefaultImgGridWidgetState
    extends State<SpinningDefaultImgGridWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GridView(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      scrollDirection: Axis.vertical,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: AuthUserStreamWidget(
              builder: (context) => Hero(
                tag: currentUserPhoto,
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/loading-gif.gif',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: AuthUserStreamWidget(
              builder: (context) => Hero(
                tag: currentUserPhoto,
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/loading-gif.gif',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: AuthUserStreamWidget(
              builder: (context) => Hero(
                tag: currentUserPhoto,
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/loading-gif.gif',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: AuthUserStreamWidget(
              builder: (context) => Hero(
                tag: currentUserPhoto,
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/loading-gif.gif',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
