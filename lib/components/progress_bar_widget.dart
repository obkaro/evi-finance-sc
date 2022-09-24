import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressBarWidget extends StatefulWidget {
  const ProgressBarWidget({
    Key? key,
    this.totalAmount,
    this.spentAmount,
  }) : super(key: key);

  final int? totalAmount;
  final int? spentAmount;

  @override
  _ProgressBarWidgetState createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      child: Stack(
        children: [
          if (widget.spentAmount! >= widget.totalAmount!)
            LinearPercentIndicator(
              percent: 1,
              width: MediaQuery.of(context).size.width * 0.81,
              lineHeight: 8,
              animation: false,
              progressColor: Color(0xFFFF0000),
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              barRadius: Radius.circular(12),
              padding: EdgeInsets.zero,
            ),
          if (functions.chartDisplay(
              widget.totalAmount!, 0.0, widget.spentAmount!, 0.35))
            LinearPercentIndicator(
              percent: functions.calcChartPercent(
                  widget.totalAmount!, widget.spentAmount!)!,
              width: MediaQuery.of(context).size.width * 0.81,
              lineHeight: 8,
              animation: false,
              progressColor: FlutterFlowTheme.of(context).tertiaryColor,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              barRadius: Radius.circular(12),
              padding: EdgeInsets.zero,
            ),
          if (functions.chartDisplay(
              widget.totalAmount!, 0.35, widget.spentAmount!, 0.65))
            LinearPercentIndicator(
              percent: functions.calcChartPercent(
                  widget.totalAmount!, widget.spentAmount!)!,
              width: MediaQuery.of(context).size.width * 0.81,
              lineHeight: 8,
              animation: false,
              progressColor: FlutterFlowTheme.of(context).alternate,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              barRadius: Radius.circular(12),
              padding: EdgeInsets.zero,
            ),
          if (functions.chartDisplay(
              widget.totalAmount!, 0.65, widget.spentAmount!, 1.0))
            LinearPercentIndicator(
              percent: functions.calcChartPercent(
                  widget.totalAmount!, widget.spentAmount!)!,
              width: MediaQuery.of(context).size.width * 0.81,
              lineHeight: 8,
              animation: false,
              progressColor: Color(0xFFFF0000),
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              barRadius: Radius.circular(12),
              padding: EdgeInsets.zero,
            ),
          if (widget.spentAmount == 0)
            LinearPercentIndicator(
              percent: 1,
              width: MediaQuery.of(context).size.width * 0.81,
              lineHeight: 8,
              animation: false,
              progressColor: FlutterFlowTheme.of(context).tertiaryColor,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              barRadius: Radius.circular(12),
              padding: EdgeInsets.zero,
            ),
        ],
      ),
    );
  }
}
