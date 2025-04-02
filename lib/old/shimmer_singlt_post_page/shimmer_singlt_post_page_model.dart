import '/components/shimmer_single_post_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shimmer_singlt_post_page_widget.dart' show ShimmerSingltPostPageWidget;
import 'package:flutter/material.dart';

class ShimmerSingltPostPageModel
    extends FlutterFlowModel<ShimmerSingltPostPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for shimmerSinglePostComponent component.
  late ShimmerSinglePostComponentModel shimmerSinglePostComponentModel;

  @override
  void initState(BuildContext context) {
    shimmerSinglePostComponentModel =
        createModel(context, () => ShimmerSinglePostComponentModel());
  }

  @override
  void dispose() {
    shimmerSinglePostComponentModel.dispose();
  }
}
