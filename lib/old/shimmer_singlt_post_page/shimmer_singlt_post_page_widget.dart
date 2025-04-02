import '/components/shimmer_single_post_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'shimmer_singlt_post_page_model.dart';
export 'shimmer_singlt_post_page_model.dart';

class ShimmerSingltPostPageWidget extends StatefulWidget {
  const ShimmerSingltPostPageWidget({super.key});

  static String routeName = 'shimmerSingltPostPage';
  static String routePath = 'ShimmerSinglePost';

  @override
  State<ShimmerSingltPostPageWidget> createState() =>
      _ShimmerSingltPostPageWidgetState();
}

class _ShimmerSingltPostPageWidgetState
    extends State<ShimmerSingltPostPageWidget> {
  late ShimmerSingltPostPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShimmerSingltPostPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'shimmerSingltPostPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SHIMMER_SINGLT_POST_shimmerSingltPostPag');
      logFirebaseEvent('shimmerSingltPostPage_action_block');
      await action_blocks.checkNetwork(context);
    });
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
            model: _model.shimmerSinglePostComponentModel,
            updateCallback: () => safeSetState(() {}),
            child: ShimmerSinglePostComponentWidget(),
          ),
        ),
      ),
    );
  }
}
