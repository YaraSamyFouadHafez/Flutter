import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pray_page_post_model.dart';
export 'pray_page_post_model.dart';

class PrayPagePostWidget extends StatefulWidget {
  const PrayPagePostWidget({
    super.key,
    required this.postId,
    required this.postType,
  });

  final String? postId;
  final String? postType;

  static String routeName = 'prayPagePost';
  static String routePath = 'prayPagePost';

  @override
  State<PrayPagePostWidget> createState() => _PrayPagePostWidgetState();
}

class _PrayPagePostWidgetState extends State<PrayPagePostWidget> {
  late PrayPagePostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrayPagePostModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'prayPagePost'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PRAY_POST_prayPagePost_ON_INIT_STATE');
      logFirebaseEvent('prayPagePost_action_block');
      await action_blocks.checkNetwork(context);
      if (!valueOrDefault<bool>(currentUserDocument?.prayUser, false)) {
        logFirebaseEvent('prayPagePost_navigate_to');

        context.pushNamed(HomePageWidget.routeName);
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

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(
                StAthanasiusVersionTwoGroup.getSinglePostVersionTwoCall.call(
              id: widget.postId,
              jwt: FFAppState().token,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final prayPagePostGetSinglePostVersionTwoResponse = snapshot.data!;

        return YoutubeFullScreenWrapper(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              appBar: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 16.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 32.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('PRAY_POST_arrow_back_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.pop();
                    if (StAthanasiusVersionTwoGroup.getSinglePostVersionTwoCall
                            .newTokenFromOldOne(
                          prayPagePostGetSinglePostVersionTwoResponse.jsonBody,
                        ) !=
                        '') {
                      logFirebaseEvent('IconButton_update_app_state');
                      FFAppState().token = StAthanasiusVersionTwoGroup
                          .getSinglePostVersionTwoCall
                          .newTokenFromOldOne(
                        prayPagePostGetSinglePostVersionTwoResponse.jsonBody,
                      )!;
                      safeSetState(() {});
                    }
                  },
                ),
                title: Text(
                  FFLocalizations.of(context).getText(
                    '4iwbq9jn' /* Post Details */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineMediumFamily),
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: SafeArea(
                top: true,
                child: RefreshIndicator(
                  color: FlutterFlowTheme.of(context).tertiary,
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  onRefresh: () async {
                    logFirebaseEvent(
                        'PRAY_POST_Column_aavdte9u_ON_PULL_TO_REF');
                    logFirebaseEvent('Column_refresh_database_request');
                    safeSetState(() => _model.apiRequestCompleter = null);
                    await _model.waitForApiRequestCompleted();
                    if (StAthanasiusVersionTwoGroup.getSinglePostVersionTwoCall
                            .newTokenFromOldOne(
                          prayPagePostGetSinglePostVersionTwoResponse.jsonBody,
                        ) !=
                        '') {
                      logFirebaseEvent('Column_update_app_state');
                      FFAppState().token = StAthanasiusVersionTwoGroup
                          .getSinglePostVersionTwoCall
                          .newTokenFromOldOne(
                        prayPagePostGetSinglePostVersionTwoResponse.jsonBody,
                      )!;
                      safeSetState(() {});
                    }
                  },
                  child: SingleChildScrollView(
                    primary: false,
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 770.0,
                            ),
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'PRAY_PAGE_POST_PAGE_Text_sr6jqn2s_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Text_navigate_to');

                                                    context.pushNamed(
                                                      PostsCategoryPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'categoryId':
                                                            serializeParam(
                                                          getJsonField(
                                                            prayPagePostGetSinglePostVersionTwoResponse
                                                                .jsonBody,
                                                            r'''$.data.categoryId._id''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'categoryName':
                                                            serializeParam(
                                                          () {
                                                            if (FFLocalizations.of(
                                                                        context)
                                                                    .languageCode ==
                                                                'es') {
                                                              return getJsonField(
                                                                prayPagePostGetSinglePostVersionTwoResponse
                                                                    .jsonBody,
                                                                r'''$.data.categoryId.name.es''',
                                                              ).toString();
                                                            } else if (FFLocalizations.of(
                                                                        context)
                                                                    .languageCode ==
                                                                'fr') {
                                                              return getJsonField(
                                                                prayPagePostGetSinglePostVersionTwoResponse
                                                                    .jsonBody,
                                                                r'''$.data.categoryId.name.fr''',
                                                              ).toString();
                                                            } else {
                                                              return getJsonField(
                                                                prayPagePostGetSinglePostVersionTwoResponse
                                                                    .jsonBody,
                                                                r'''$.data.categoryId.name.en''',
                                                              ).toString();
                                                            }
                                                          }(),
                                                          ParamType.String,
                                                        ),
                                                        'categoryDescription':
                                                            serializeParam(
                                                          () {
                                                            if (FFLocalizations.of(
                                                                        context)
                                                                    .languageCode ==
                                                                'es') {
                                                              return getJsonField(
                                                                prayPagePostGetSinglePostVersionTwoResponse
                                                                    .jsonBody,
                                                                r'''$.data.categoryId.description.es''',
                                                              ).toString();
                                                            } else if (FFLocalizations.of(
                                                                        context)
                                                                    .languageCode ==
                                                                'fr') {
                                                              return getJsonField(
                                                                prayPagePostGetSinglePostVersionTwoResponse
                                                                    .jsonBody,
                                                                r'''$.data.categoryId.description.fr''',
                                                              ).toString();
                                                            } else {
                                                              return getJsonField(
                                                                prayPagePostGetSinglePostVersionTwoResponse
                                                                    .jsonBody,
                                                                r'''$.data.categoryId.description.en''',
                                                              ).toString();
                                                            }
                                                          }(),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );

                                                    if (StAthanasiusVersionTwoGroup
                                                            .getSinglePostVersionTwoCall
                                                            .newTokenFromOldOne(
                                                          prayPagePostGetSinglePostVersionTwoResponse
                                                              .jsonBody,
                                                        ) !=
                                                        '') {
                                                      logFirebaseEvent(
                                                          'Text_update_app_state');
                                                      FFAppState().token =
                                                          StAthanasiusVersionTwoGroup
                                                              .getSinglePostVersionTwoCall
                                                              .newTokenFromOldOne(
                                                        prayPagePostGetSinglePostVersionTwoResponse
                                                            .jsonBody,
                                                      )!;
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  child: AutoSizeText(
                                                    () {
                                                      if (FFLocalizations.of(
                                                                  context)
                                                              .languageCode ==
                                                          'es') {
                                                        return getJsonField(
                                                          prayPagePostGetSinglePostVersionTwoResponse
                                                              .jsonBody,
                                                          r'''$.data.categoryId.name.es''',
                                                        ).toString();
                                                      } else if (FFLocalizations
                                                                  .of(context)
                                                              .languageCode ==
                                                          'fr') {
                                                        return getJsonField(
                                                          prayPagePostGetSinglePostVersionTwoResponse
                                                              .jsonBody,
                                                          r'''$.data.categoryId.name.fr''',
                                                        ).toString();
                                                      } else {
                                                        return getJsonField(
                                                          prayPagePostGetSinglePostVersionTwoResponse
                                                              .jsonBody,
                                                          r'''$.data.categoryId.name.en''',
                                                        ).toString();
                                                      }
                                                    }(),
                                                    maxLines: 1,
                                                    minFontSize: 8.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                16.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                                      context)
                                                                  .languageCode ==
                                                              'ar'
                                                          ? ((String isoTime) {
                                                              return "${DateTime.parse(isoTime).day} ${[
                                                                'يناير',
                                                                'فبراير',
                                                                'مارس',
                                                                'أبريل',
                                                                'مايو',
                                                                'يونيو',
                                                                'يوليو',
                                                                'أغسطس',
                                                                'سبتمبر',
                                                                'أكتوبر',
                                                                'نوفمبر',
                                                                'ديسمبر'
                                                              ][DateTime.parse(isoTime).month - 1]} ${DateTime.parse(isoTime).year}";
                                                            }(getJsonField(
                                                              prayPagePostGetSinglePostVersionTwoResponse
                                                                  .jsonBody,
                                                              r'''$.data.publishedAt''',
                                                            ).toString()))
                                                          : ((String isoTime) {
                                                              return "${DateTime.parse(isoTime).day} ${[
                                                                'January',
                                                                'February',
                                                                'March',
                                                                'April',
                                                                'May',
                                                                'June',
                                                                'July',
                                                                'August',
                                                                'September',
                                                                'October',
                                                                'November',
                                                                'December'
                                                              ][DateTime.parse(isoTime).month - 1]} ${DateTime.parse(isoTime).year}";
                                                            }(getJsonField(
                                                              prayPagePostGetSinglePostVersionTwoResponse
                                                                  .jsonBody,
                                                              r'''$.data.publishedAt''',
                                                            ).toString())),
                                                      textAlign: TextAlign.end,
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (widget.postType != 'video')
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 1.0, 0.0),
                                        child: Container(
                                          width: valueOrDefault<double>(
                                            () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 400.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 400.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 720.0;
                                              } else {
                                                return 720.0;
                                              }
                                            }(),
                                            400.0,
                                          ),
                                          height: valueOrDefault<double>(
                                            () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 225.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 225.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 405.0;
                                              } else {
                                                return 405.0;
                                              }
                                            }(),
                                            225.0,
                                          ),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -0.66),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 16.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        child: Image.network(
                                                          getJsonField(
                                                            prayPagePostGetSinglePostVersionTwoResponse
                                                                .jsonBody,
                                                            r'''$.data.thumbnailUrl''',
                                                          ).toString(),
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.png',
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          23.0, 0.0, 32.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                        sigmaX: 2.0,
                                                        sigmaY: 2.0,
                                                      ),
                                                      child: Container(
                                                        width: 64.0,
                                                        height: 64.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.0),
                                                          child: Image.asset(
                                                            Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? 'assets/images/ST_Logo_100_Sm_Dark.png'
                                                                : 'assets/images/ST_Logo_100_Sm.png',
                                                            width: 50.0,
                                                            height: 50.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (widget.postType == 'video')
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -0.66),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                            child: FlutterFlowYoutubePlayer(
                                              url: valueOrDefault<String>(
                                                () {
                                                  if (FFLocalizations.of(
                                                              context)
                                                          .languageCode ==
                                                      'es') {
                                                    return getJsonField(
                                                      prayPagePostGetSinglePostVersionTwoResponse
                                                          .jsonBody,
                                                      r'''$.data.videoUrl.es''',
                                                    ).toString();
                                                  } else if (FFLocalizations.of(
                                                              context)
                                                          .languageCode ==
                                                      'fr') {
                                                    return getJsonField(
                                                      prayPagePostGetSinglePostVersionTwoResponse
                                                          .jsonBody,
                                                      r'''$.data.videoUrl.fr''',
                                                    ).toString();
                                                  } else {
                                                    return getJsonField(
                                                      prayPagePostGetSinglePostVersionTwoResponse
                                                          .jsonBody,
                                                      r'''$.data.videoUrl.en''',
                                                    ).toString();
                                                  }
                                                }(),
                                                'https://youtu.be/lHLVZrDRTxg?si=_yZTLjftQvE3m8zS',
                                              ),
                                              autoPlay: false,
                                              looping: true,
                                              mute: false,
                                              showControls: true,
                                              showFullScreen: true,
                                              strictRelatedVideos: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        () {
                                          if (FFLocalizations.of(context)
                                                  .languageCode ==
                                              'es') {
                                            return getJsonField(
                                              prayPagePostGetSinglePostVersionTwoResponse
                                                  .jsonBody,
                                              r'''$.data.title.es''',
                                            ).toString();
                                          } else if (FFLocalizations.of(context)
                                                  .languageCode ==
                                              'fr') {
                                            return getJsonField(
                                              prayPagePostGetSinglePostVersionTwoResponse
                                                  .jsonBody,
                                              r'''$.data.title.fr''',
                                            ).toString();
                                          } else {
                                            return getJsonField(
                                              prayPagePostGetSinglePostVersionTwoResponse
                                                  .jsonBody,
                                              r'''$.data.title.en''',
                                            ).toString();
                                          }
                                        }(),
                                        'Post Title',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMediumFamily),
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 0.0)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 700.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                custom_widgets.CustomMarkDown(
                                  width: 50.0,
                                  height: 50.0,
                                  inputString: 'hello',
                                ),
                              ].addToEnd(SizedBox(height: 80.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
