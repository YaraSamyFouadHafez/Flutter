import '/backend/api_requests/api_calls.dart';
import '/components/shimmer_single_post_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'dart:async';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bread_of_life_page_model.dart';
export 'bread_of_life_page_model.dart';

class BreadOfLifePageWidget extends StatefulWidget {
  const BreadOfLifePageWidget({super.key});

  static String routeName = 'breadOfLifePage';
  static String routePath = 'breadOfLifePage';

  @override
  State<BreadOfLifePageWidget> createState() => _BreadOfLifePageWidgetState();
}

class _BreadOfLifePageWidgetState extends State<BreadOfLifePageWidget> {
  late BreadOfLifePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreadOfLifePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'breadOfLifePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BREAD_OF_LIFE_breadOfLifePage_ON_INIT_ST');
      logFirebaseEvent('breadOfLifePage_action_block');
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
    context.watch<FFAppState>();

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
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                logFirebaseEvent('BREAD_OF_LIFE_arrow_back_ICN_ON_TAP');
                logFirebaseEvent('IconButton_navigate_back');
                context.pop();
              },
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                't09zt3h5' /* Our Daily Bread */,
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
            child: FutureBuilder<ApiCallResponse>(
              future: (_model
                      .apiRequestCompleter ??= Completer<ApiCallResponse>()
                    ..complete(StAthanasiusVersionTwoGroup
                        .getTheBreadOfLifeVersionTwoCall
                        .call(
                      date: getCurrentTimestamp.secondsSinceEpoch.toString(),
                      jwt: FFAppState().token,
                    )))
                  .future,
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return ShimmerSinglePostComponentWidget();
                }
                final columnGetTheBreadOfLifeVersionTwoResponse =
                    snapshot.data!;

                return RefreshIndicator(
                  color: FlutterFlowTheme.of(context).tertiary,
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  onRefresh: () async {
                    logFirebaseEvent(
                        'BREAD_OF_LIFE_Column_jf1rz1ft_ON_PULL_TO');
                    logFirebaseEvent('Column_refresh_database_request');
                    safeSetState(() => _model.apiRequestCompleter = null);
                    await _model.waitForApiRequestCompleted();
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                dateTimeFormat(
                                                  "EEEE MMM d, y",
                                                  dateTimeFromSecondsSinceEpoch(
                                                      getJsonField(
                                                    columnGetTheBreadOfLifeVersionTwoResponse
                                                        .jsonBody,
                                                    r'''$.data.publishedAt''',
                                                  )),
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                'Published At',
                                              ),
                                              textAlign: TextAlign.end,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'BREAD_OF_LIFE_SEE_PAST_DAYS_BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_navigate_to');

                                                context.pushNamed(
                                                  PostsCategoryPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'categoryId':
                                                        serializeParam(
                                                      getJsonField(
                                                        columnGetTheBreadOfLifeVersionTwoResponse
                                                            .jsonBody,
                                                        r'''$.data.categoryId._id''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'categoryName':
                                                        serializeParam(
                                                      valueOrDefault<String>(
                                                        () {
                                                          if (FFLocalizations.of(
                                                                      context)
                                                                  .languageCode ==
                                                              'es') {
                                                            return getJsonField(
                                                              columnGetTheBreadOfLifeVersionTwoResponse
                                                                  .jsonBody,
                                                              r'''$.data.categoryId.name.es''',
                                                            ).toString();
                                                          } else if (FFLocalizations
                                                                      .of(context)
                                                                  .languageCode ==
                                                              'fr') {
                                                            return getJsonField(
                                                              columnGetTheBreadOfLifeVersionTwoResponse
                                                                  .jsonBody,
                                                              r'''$.data.categoryId.name.fr''',
                                                            ).toString();
                                                          } else {
                                                            return getJsonField(
                                                              columnGetTheBreadOfLifeVersionTwoResponse
                                                                  .jsonBody,
                                                              r'''$.data.categoryId.name.en''',
                                                            ).toString();
                                                          }
                                                        }(),
                                                        'Post Title',
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                    'categoryDescription':
                                                        serializeParam(
                                                      valueOrDefault<String>(
                                                        () {
                                                          if (FFLocalizations.of(
                                                                      context)
                                                                  .languageCode ==
                                                              'es') {
                                                            return getJsonField(
                                                              columnGetTheBreadOfLifeVersionTwoResponse
                                                                  .jsonBody,
                                                              r'''$.data.categoryId.description.es''',
                                                            ).toString();
                                                          } else if (FFLocalizations
                                                                      .of(context)
                                                                  .languageCode ==
                                                              'fr') {
                                                            return getJsonField(
                                                              columnGetTheBreadOfLifeVersionTwoResponse
                                                                  .jsonBody,
                                                              r'''$.data.categoryId.description.fr''',
                                                            ).toString();
                                                          } else {
                                                            return getJsonField(
                                                              columnGetTheBreadOfLifeVersionTwoResponse
                                                                  .jsonBody,
                                                              r'''$.data.categoryId.description.en''',
                                                            ).toString();
                                                          }
                                                        }(),
                                                        'Post Title',
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'kgvyrsah' /* See Past Days */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -0.66),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 8.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
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
                                                if (FFLocalizations.of(context)
                                                        .languageCode ==
                                                    'es') {
                                                  return getJsonField(
                                                    columnGetTheBreadOfLifeVersionTwoResponse
                                                        .jsonBody,
                                                    r'''$.data.videoUrl.es''',
                                                  ).toString();
                                                } else if (FFLocalizations.of(
                                                            context)
                                                        .languageCode ==
                                                    'fr') {
                                                  return getJsonField(
                                                    columnGetTheBreadOfLifeVersionTwoResponse
                                                        .jsonBody,
                                                    r'''$.data.videoUrl.fr''',
                                                  ).toString();
                                                } else {
                                                  return getJsonField(
                                                    columnGetTheBreadOfLifeVersionTwoResponse
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
                                              columnGetTheBreadOfLifeVersionTwoResponse
                                                  .jsonBody,
                                              r'''$.data.title.es''',
                                            ).toString();
                                          } else if (FFLocalizations.of(context)
                                                  .languageCode ==
                                              'fr') {
                                            return getJsonField(
                                              columnGetTheBreadOfLifeVersionTwoResponse
                                                  .jsonBody,
                                              r'''$.data.title.fr''',
                                            ).toString();
                                          } else {
                                            return getJsonField(
                                              columnGetTheBreadOfLifeVersionTwoResponse
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
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 700.0,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsets.all(24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[]
                                              .addToEnd(SizedBox(height: 80.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
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
                                              inputString: 'heloo',
                                            ),
                                          ].addToEnd(SizedBox(height: 80.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
