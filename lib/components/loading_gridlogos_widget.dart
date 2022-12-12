import '../components/gray_circle_container_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoadingGridlogosWidget extends StatefulWidget {
  const LoadingGridlogosWidget({Key? key}) : super(key: key);

  @override
  _LoadingGridlogosWidgetState createState() => _LoadingGridlogosWidgetState();
}

class _LoadingGridlogosWidgetState extends State<LoadingGridlogosWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

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
        GrayCircleContainerWidget(),
        GrayCircleContainerWidget(),
        GrayCircleContainerWidget(),
        GrayCircleContainerWidget(),
        GrayCircleContainerWidget(),
        GrayCircleContainerWidget(),
        GrayCircleContainerWidget(),
        GrayCircleContainerWidget(),
        GrayCircleContainerWidget(),
        GrayCircleContainerWidget(),
        GrayCircleContainerWidget(),
        GrayCircleContainerWidget(),
        GrayCircleContainerWidget(),
        GrayCircleContainerWidget(),
        GrayCircleContainerWidget(),
        GrayCircleContainerWidget(),
      ],
    );
  }
}
