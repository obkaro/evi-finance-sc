import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class CircularIndicatorBigWidget extends StatefulWidget {
  const CircularIndicatorBigWidget({
    Key? key,
    this.totalAmount,
    this.spentAmount,
    this.centerText,
  }) : super(key: key);

  final int? totalAmount;
  final int? spentAmount;
  final String? centerText;

  @override
  _CircularIndicatorBigWidgetState createState() =>
      _CircularIndicatorBigWidgetState();
}

class _CircularIndicatorBigWidgetState
    extends State<CircularIndicatorBigWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 180,
          height: 180,
          child: Stack(
            children: [
              if (widget.spentAmount! >= widget.totalAmount!)
                CircularPercentIndicator(
                  percent: functions.calcChartPercent(
                      widget.totalAmount!, widget.spentAmount!)!,
                  radius: 90,
                  lineWidth: 20,
                  animation: false,
                  progressColor: Color(0xFFFF0000),
                  backgroundColor: Color(0xFFFF0000),
                  center: Text(
                    widget.centerText!,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).subtitle2Family,
                          color: FlutterFlowTheme.of(context).primaryText,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).subtitle2Family),
                        ),
                  ),
                  startAngle: 0,
                ),
              if (functions.chartDisplay(
                  widget.totalAmount!, 0.0, widget.spentAmount!, 0.35))
                CircularPercentIndicator(
                  percent: functions.calcChartPercent(
                      widget.totalAmount!, widget.spentAmount!)!,
                  radius: 90,
                  lineWidth: 20,
                  animation: false,
                  progressColor: FlutterFlowTheme.of(context).tertiaryColor,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  center: Text(
                    widget.centerText!,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).subtitle2Family,
                          color: FlutterFlowTheme.of(context).primaryText,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).subtitle2Family),
                        ),
                  ),
                  startAngle: 0,
                ),
              if (functions.chartDisplay(
                  widget.totalAmount!, 0.35, widget.spentAmount!, 0.65))
                CircularPercentIndicator(
                  percent: functions.calcChartPercent(
                      widget.totalAmount!, widget.spentAmount!)!,
                  radius: 90,
                  lineWidth: 20,
                  animation: false,
                  progressColor: FlutterFlowTheme.of(context).alternate,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  center: Text(
                    widget.centerText!,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).subtitle2Family,
                          color: FlutterFlowTheme.of(context).primaryText,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).subtitle2Family),
                        ),
                  ),
                  startAngle: 0,
                ),
              if (functions.chartDisplay(
                  widget.totalAmount!, 0.65, widget.spentAmount!, 1.0))
                CircularPercentIndicator(
                  percent: functions.calcChartPercent(
                      widget.totalAmount!, widget.spentAmount!)!,
                  radius: 90,
                  lineWidth: 20,
                  animation: false,
                  progressColor: Color(0xFFFF0000),
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  center: Text(
                    widget.centerText!,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).subtitle2Family,
                          color: FlutterFlowTheme.of(context).primaryText,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).subtitle2Family),
                        ),
                  ),
                  startAngle: 0,
                ),
              if (widget.spentAmount == 0)
                CircularPercentIndicator(
                  percent: functions.calcChartPercent(
                      widget.totalAmount!, widget.spentAmount!)!,
                  radius: 90,
                  lineWidth: 20,
                  animation: false,
                  progressColor: FlutterFlowTheme.of(context).tertiaryColor,
                  backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
                  center: Text(
                    widget.centerText!,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).subtitle2Family,
                          color: FlutterFlowTheme.of(context).primaryText,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).subtitle2Family),
                        ),
                  ),
                  startAngle: 0,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
