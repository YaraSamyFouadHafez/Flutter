import '/components/shimmer_category_slider_home_component_widget.dart';
import '/components/shimmer_recent_posts_grid_home_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_copy_widget.dart' show HomePageCopyWidget;
import 'package:flutter/material.dart';

class HomePageCopyModel extends FlutterFlowModel<HomePageCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getFCMToken] action in homePageCopy widget.
  String? fCmtoken;
  // Model for shimmerCategorySliderHomeComponent component.
  late ShimmerCategorySliderHomeComponentModel
      shimmerCategorySliderHomeComponentModel;
  // Model for shimmerRecentPostsGridHomeComponent component.
  late ShimmerRecentPostsGridHomeComponentModel
      shimmerRecentPostsGridHomeComponentModel;

  @override
  void initState(BuildContext context) {
    shimmerCategorySliderHomeComponentModel =
        createModel(context, () => ShimmerCategorySliderHomeComponentModel());
    shimmerRecentPostsGridHomeComponentModel =
        createModel(context, () => ShimmerRecentPostsGridHomeComponentModel());
  }

  @override
  void dispose() {
    shimmerCategorySliderHomeComponentModel.dispose();
    shimmerRecentPostsGridHomeComponentModel.dispose();
  }
}
