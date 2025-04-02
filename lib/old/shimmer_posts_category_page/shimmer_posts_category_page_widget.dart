import '/components/shimmer_posts_list_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'shimmer_posts_category_page_model.dart';
export 'shimmer_posts_category_page_model.dart';

class ShimmerPostsCategoryPageWidget extends StatefulWidget {
  const ShimmerPostsCategoryPageWidget({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.categoryDescription,
  });

  final String? categoryId;
  final String? categoryName;
  final String? categoryDescription;

  static String routeName = 'shimmerPostsCategoryPage';
  static String routePath = 'shimmerPostsCategoryPage';

  @override
  State<ShimmerPostsCategoryPageWidget> createState() =>
      _ShimmerPostsCategoryPageWidgetState();
}

class _ShimmerPostsCategoryPageWidgetState
    extends State<ShimmerPostsCategoryPageWidget> {
  late ShimmerPostsCategoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShimmerPostsCategoryPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'shimmerPostsCategoryPage'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.shimmerPostsListComponentModel,
            updateCallback: () => safeSetState(() {}),
            child: ShimmerPostsListComponentWidget(),
          ),
        ),
      ),
    );
  }
}
