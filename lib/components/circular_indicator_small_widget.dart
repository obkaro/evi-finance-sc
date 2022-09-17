import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularIndicatorSmallWidget extends StatefulWidget {
  const CircularIndicatorSmallWidget({
    Key? key,
    this.totalAmount,
    this.spentAmount,
  }) : super(key: key);

  final int? totalAmount;
  final int? spentAmount;

  @override
  _CircularIndicatorSmallWidgetState createState() =>
      _CircularIndicatorSmallWidgetState();
}

class _CircularIndicatorSmallWidgetState
    extends State<CircularIndicatorSmallWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.spentAmount! >= widget.totalAmount!)
          CircularPercentIndicator(
            percent: functions.calcChartPercent(
                widget.totalAmount!, widget.spentAmount!)!,
            radius: 32,
            lineWidth: 12,
            animation: false,
            progressColor: Color(0xFFFF0000),
            backgroundColor: Color(0xFFFF0000),
            startAngle: 0,
          ),
        if (functions.chartDisplay(
            widget.totalAmount!, 0.0, widget.spentAmount!, 0.35))
          CircularPercentIndicator(
            percent: functions.calcChartPercent(
                widget.totalAmount!, widget.spentAmount!)!,
            radius: 32,
            lineWidth: 12,
            animation: true,
            progressColor: FlutterFlowTheme.of(context).tertiaryColor,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            startAngle: 0,
          ),
        if (functions.chartDisplay(
            widget.totalAmount!, 0.35, widget.spentAmount!, 0.65))
          CircularPercentIndicator(
            percent: functions.calcChartPercent(
                widget.totalAmount!, widget.spentAmount!)!,
            radius: 32,
            lineWidth: 12,
            animation: true,
            progressColor: FlutterFlowTheme.of(context).alternate,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            startAngle: 0,
          ),
        if (functions.chartDisplay(
            widget.totalAmount!, 0.65, widget.spentAmount!, 1.0))
          CircularPercentIndicator(
            percent: functions.calcChartPercent(
                widget.totalAmount!, widget.spentAmount!)!,
            radius: 32,
            lineWidth: 12,
            animation: true,
            progressColor: Color(0xFFFF0000),
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            startAngle: 0,
          ),
        if (widget.spentAmount == 0)
          CircularPercentIndicator(
            percent: functions.calcChartPercent(
                widget.totalAmount!, widget.spentAmount!)!,
            radius: 32,
            lineWidth: 12,
            animation: false,
            progressColor: FlutterFlowTheme.of(context).tertiaryColor,
            backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
            startAngle: 0,
          ),
      ],
    );
  }
}
