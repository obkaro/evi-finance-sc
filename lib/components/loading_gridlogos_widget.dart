import '../components/gray_circle_container_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_gridlogos_model.dart';
export 'loading_gridlogos_model.dart';

class LoadingGridlogosWidget extends StatefulWidget {
  const LoadingGridlogosWidget({Key? key}) : super(key: key);

  @override
  _LoadingGridlogosWidgetState createState() => _LoadingGridlogosWidgetState();
}

class _LoadingGridlogosWidgetState extends State<LoadingGridlogosWidget> {
  late LoadingGridlogosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingGridlogosModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
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
        wrapWithModel(
          model: _model.grayCircleContainerModel1,
          updateCallback: () => setState(() {}),
          child: GrayCircleContainerWidget(),
        ),
        wrapWithModel(
          model: _model.grayCircleContainerModel2,
          updateCallback: () => setState(() {}),
          child: GrayCircleContainerWidget(),
        ),
        wrapWithModel(
          model: _model.grayCircleContainerModel3,
          updateCallback: () => setState(() {}),
          child: GrayCircleContainerWidget(),
        ),
        wrapWithModel(
          model: _model.grayCircleContainerModel4,
          updateCallback: () => setState(() {}),
          child: GrayCircleContainerWidget(),
        ),
        wrapWithModel(
          model: _model.grayCircleContainerModel5,
          updateCallback: () => setState(() {}),
          child: GrayCircleContainerWidget(),
        ),
        wrapWithModel(
          model: _model.grayCircleContainerModel6,
          updateCallback: () => setState(() {}),
          child: GrayCircleContainerWidget(),
        ),
        wrapWithModel(
          model: _model.grayCircleContainerModel7,
          updateCallback: () => setState(() {}),
          child: GrayCircleContainerWidget(),
        ),
        wrapWithModel(
          model: _model.grayCircleContainerModel8,
          updateCallback: () => setState(() {}),
          child: GrayCircleContainerWidget(),
        ),
        wrapWithModel(
          model: _model.grayCircleContainerModel9,
          updateCallback: () => setState(() {}),
          child: GrayCircleContainerWidget(),
        ),
        wrapWithModel(
          model: _model.grayCircleContainerModel10,
          updateCallback: () => setState(() {}),
          child: GrayCircleContainerWidget(),
        ),
        wrapWithModel(
          model: _model.grayCircleContainerModel11,
          updateCallback: () => setState(() {}),
          child: GrayCircleContainerWidget(),
        ),
        wrapWithModel(
          model: _model.grayCircleContainerModel12,
          updateCallback: () => setState(() {}),
          child: GrayCircleContainerWidget(),
        ),
        wrapWithModel(
          model: _model.grayCircleContainerModel13,
          updateCallback: () => setState(() {}),
          child: GrayCircleContainerWidget(),
        ),
        wrapWithModel(
          model: _model.grayCircleContainerModel14,
          updateCallback: () => setState(() {}),
          child: GrayCircleContainerWidget(),
        ),
        wrapWithModel(
          model: _model.grayCircleContainerModel15,
          updateCallback: () => setState(() {}),
          child: GrayCircleContainerWidget(),
        ),
        wrapWithModel(
          model: _model.grayCircleContainerModel16,
          updateCallback: () => setState(() {}),
          child: GrayCircleContainerWidget(),
        ),
      ],
    );
  }
}
