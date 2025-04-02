import '/components/shimmer_posts_list_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shimmer_posts_category_page_widget.dart'
    show ShimmerPostsCategoryPageWidget;
import 'package:flutter/material.dart';

class ShimmerPostsCategoryPageModel
    extends FlutterFlowModel<ShimmerPostsCategoryPageWidget> {
  ///  Local state fields for this page.

  String? categorySlugState;

  ///  State fields for stateful widgets in this page.

  // Model for shimmerPostsListComponent component.
  late ShimmerPostsListComponentModel shimmerPostsListComponentModel;

  @override
  void initState(BuildContext context) {
    shimmerPostsListComponentModel =
        createModel(context, () => ShimmerPostsListComponentModel());
  }

  @override
  void dispose() {
    shimmerPostsListComponentModel.dispose();
  }
}
