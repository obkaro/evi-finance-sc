import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'm_grid_menu_item_model.dart';
export 'm_grid_menu_item_model.dart';

class MGridMenuItemWidget extends StatefulWidget {
  const MGridMenuItemWidget({
    Key? key,
    this.menuText,
    this.menuIcon,
    this.fgColor,
    this.bgColor,
    this.action,
  }) : super(key: key);

  final String? menuText;
  final Widget? menuIcon;
  final Color? fgColor;
  final Color? bgColor;
  final Future<dynamic> Function()? action;

  @override
  _MGridMenuItemWidgetState createState() => _MGridMenuItemWidgetState();
}

class _MGridMenuItemWidgetState extends State<MGridMenuItemWidget> {
  late MGridMenuItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MGridMenuItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      onTap: () async {
        await widget.action?.call();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: widget.bgColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
              child: widget.menuIcon!,
            ),
            Text(
              widget.menuText!,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                    color: widget.fgColor,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyText1Family),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
