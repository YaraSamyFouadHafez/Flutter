import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/shimmer_category_slider_home_component_widget.dart';
import '/components/shimmer_recent_posts_grid_home_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_copy_model.dart';
export 'home_page_copy_model.dart';

class HomePageCopyWidget extends StatefulWidget {
  const HomePageCopyWidget({super.key});

  static String routeName = 'homePageCopy';
  static String routePath = 'shimmerHome';

  @override
  State<HomePageCopyWidget> createState() => _HomePageCopyWidgetState();
}

class _HomePageCopyWidgetState extends State<HomePageCopyWidget> {
  late HomePageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'homePageCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_COPY_homePageCopy_ON_INIT_STATE');
      logFirebaseEvent('homePageCopy_action_block');
      await action_blocks.checkNetwork(context);
      logFirebaseEvent('homePageCopy_custom_action');
      await actions.showUpdateDialog(
        context,
        'Please Update!',
        'Hey there!  We\'ve got some awesome updates for you.  Please update to the latest version of our app to get the most out of it.',
        true,
        false,
        () async {},
        () async {},
        () async {
          if (isiOS) {
            logFirebaseEvent('_launch_u_r_l');
            await launchURL(
                'https://apps.apple.com/us/app/christian-unity-mission/id6714478810');
          } else {
            logFirebaseEvent('_launch_u_r_l');
            await launchURL(
                'https://play.google.com/store/apps/details?id=com.christianunitymission.CU');
          }
        },
      );
      logFirebaseEvent('homePageCopy_action_block');
      await action_blocks.forceUpdate(context);
      logFirebaseEvent('homePageCopy_request_permissions');
      await requestPermission(notificationsPermission);
      if (await getPermissionStatus(notificationsPermission)) {
        logFirebaseEvent('homePageCopy_custom_action');
        _model.fCmtoken = await actions.getFCMToken();
        if (_model.fCmtoken != FFAppState().fcmAppState) {
          logFirebaseEvent('homePageCopy_backend_call');

          await currentUserReference!.update(createUsersRecordData(
            allowPushNotification: true,
          ));
          logFirebaseEvent('homePageCopy_update_app_state');
          FFAppState().fcmAppState = _model.fCmtoken!;
          FFAppState().update(() {});
          if (valueOrDefault<bool>(
              currentUserDocument?.allowPushNotification, false)) {
            logFirebaseEvent('homePageCopy_backend_call');

            await currentUserReference!.update(createUsersRecordData(
              fCMToken: _model.fCmtoken,
            ));
            if (isAndroid) {
              logFirebaseEvent('homePageCopy_backend_call');
              await StAthanasiusAPIGroup.fCMUpdateVOneCall.call(
                fireUserId: currentUserUid,
                fcmId: _model.fCmtoken,
                deviceType: 'Android',
              );
            } else {
              logFirebaseEvent('homePageCopy_backend_call');
              await StAthanasiusAPIGroup.fCMUpdateVOneCall.call(
                fireUserId: currentUserUid,
                fcmId: _model.fCmtoken,
                deviceType: 'IOS',
              );
            }
          }
        }
      } else {
        logFirebaseEvent('homePageCopy_backend_call');

        await currentUserReference!.update(createUsersRecordData(
          allowPushNotification: false,
        ));
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 770.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '6mohwcew' /* Categories */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: Container(
                                width: double.infinity,
                                height: 168.0,
                                decoration: BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model
                                      .shimmerCategorySliderHomeComponentModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child:
                                      ShimmerCategorySliderHomeComponentWidget(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '608tf35w' /* Recent Posts */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 600.0,
                                decoration: BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model
                                      .shimmerRecentPostsGridHomeComponentModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child:
                                      ShimmerRecentPostsGridHomeComponentWidget(),
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 8.0))
                                .addToStart(SizedBox(height: 16.0))
                                .addToEnd(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ].addToEnd(SizedBox(height: 80.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
