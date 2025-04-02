import '/backend/api_requests/api_calls.dart';
import '/components/shimmer_posts_list_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:ff_commons/api_requests/api_paging_params.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'posts_category_page_model.dart';
export 'posts_category_page_model.dart';

class PostsCategoryPageWidget extends StatefulWidget {
  const PostsCategoryPageWidget({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.categoryDescription,
  });

  final String? categoryId;
  final String? categoryName;
  final String? categoryDescription;

  static String routeName = 'postsCategoryPage';
  static String routePath = 'postsCategoryPage';

  @override
  State<PostsCategoryPageWidget> createState() =>
      _PostsCategoryPageWidgetState();
}

class _PostsCategoryPageWidgetState extends State<PostsCategoryPageWidget> {
  late PostsCategoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostsCategoryPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'postsCategoryPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('POSTS_CATEGORY_postsCategoryPage_ON_INIT');
      logFirebaseEvent('postsCategoryPage_action_block');
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

    return FutureBuilder<ApiCallResponse>(
      future: StAthanasiusAPIGroup.getPostsVOneCall.call(
        jwt: FFAppState().token,
        limit: 1,
      ),
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
        final postsCategoryPageGetPostsVOneResponse = snapshot.data!;

        return GestureDetector(
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
                borderRadius: 16.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 32.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('POSTS_CATEGORY_arrow_back_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.safePop();
                  if (StAthanasiusAPIGroup.getPostsVOneCall.newTokenFromOldOne(
                        postsCategoryPageGetPostsVOneResponse.jsonBody,
                      ) !=
                      '') {
                    logFirebaseEvent('IconButton_update_app_state');
                    FFAppState().token = StAthanasiusAPIGroup.getPostsVOneCall
                        .newTokenFromOldOne(
                      postsCategoryPageGetPostsVOneResponse.jsonBody,
                    )!;
                    safeSetState(() {});
                  }
                },
              ),
              title: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: AutoSizeText(
                      valueOrDefault<String>(
                        widget.categoryName,
                        'Category Title',
                      ),
                      maxLines: 1,
                      minFontSize: 12.0,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                    ),
                  ),
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 770.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 56.0),
                        child: SafeArea(
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(),
                            child: RefreshIndicator(
                              color: FlutterFlowTheme.of(context).tertiary,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              onRefresh: () async {
                                logFirebaseEvent(
                                    'POSTS_CATEGORY_ListView_qr4c9xbz_ON_PULL');
                                logFirebaseEvent(
                                    'ListView_refresh_database_request');
                                safeSetState(() =>
                                    _model.listViewPagingController?.refresh());
                                await _model.waitForOnePageForListView();
                                if (StAthanasiusAPIGroup.getPostsVOneCall
                                        .newTokenFromOldOne(
                                      postsCategoryPageGetPostsVOneResponse
                                          .jsonBody,
                                    ) !=
                                    '') {
                                  logFirebaseEvent('ListView_update_app_state');
                                  FFAppState().token = StAthanasiusAPIGroup
                                      .getPostsVOneCall
                                      .newTokenFromOldOne(
                                    postsCategoryPageGetPostsVOneResponse
                                        .jsonBody,
                                  )!;
                                  safeSetState(() {});
                                }
                              },
                              child: PagedListView<ApiPagingParams,
                                  dynamic>.separated(
                                pagingController: _model.setListViewController(
                                  (nextPageMarker) => StAthanasiusAPIGroup
                                      .getPostsVOneCall
                                      .call(
                                    categoryId: widget.categoryId,
                                    page: nextPageMarker.nextPageNumber,
                                    limit: 10,
                                    sortBy: 'publishedAt',
                                    jwt: FFAppState().token,
                                  ),
                                ),
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  136.0,
                                  0,
                                  24.0,
                                ),
                                shrinkWrap: true,
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 16.0),
                                builderDelegate:
                                    PagedChildBuilderDelegate<dynamic>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      ShimmerPostsListComponentWidget(),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      ShimmerPostsListComponentWidget(),

                                  itemBuilder: (context, _, postsListIndex) {
                                    final postsListItem = _model
                                        .listViewPagingController!
                                        .itemList![postsListIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'POSTS_CATEGORY_Container_m2517uec_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                            SinglePostPageWidget.routeName,
                                            queryParameters: {
                                              'postId': serializeParam(
                                                getJsonField(
                                                  postsListItem,
                                                  r'''$.postId''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'postType': serializeParam(
                                                getJsonField(
                                                  postsListItem,
                                                  r'''$.type''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );

                                          if (StAthanasiusAPIGroup
                                                  .getPostsVOneCall
                                                  .newTokenFromOldOne(
                                                postsCategoryPageGetPostsVOneResponse
                                                    .jsonBody,
                                              ) !=
                                              '') {
                                            logFirebaseEvent(
                                                'Container_update_app_state');
                                            FFAppState().token =
                                                StAthanasiusAPIGroup
                                                    .getPostsVOneCall
                                                    .newTokenFromOldOne(
                                              postsCategoryPageGetPostsVOneResponse
                                                  .jsonBody,
                                            )!;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                offset: Offset(
                                                  1.0,
                                                  1.0,
                                                ),
                                                spreadRadius: 0.0,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: Container(
                                                    width: 133.0,
                                                    height: 100.0,
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
                                                            postsListItem,
                                                            r'''$.thumbnailUrl''',
                                                          ).toString(),
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.png',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Container(
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Flexible(
                                                              flex: 4,
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child:
                                                                    AutoSizeText(
                                                                  getJsonField(
                                                                    postsListItem,
                                                                    r'''$.title''',
                                                                  ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  maxLines: 3,
                                                                  minFontSize:
                                                                      8.0,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              flex: 1,
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        1.0),
                                                                child:
                                                                    AutoSizeText(
                                                                  FFLocalizations.of(context)
                                                                              .languageCode ==
                                                                          'ar'
                                                                      ? ((String
                                                                          isoTime) {
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
                                                                          postsListItem,
                                                                          r'''$.publishedAt''',
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
                                                                          postsListItem,
                                                                          r'''$.publishedAt''',
                                                                        ).toString())),
                                                                  maxLines: 1,
                                                                  minFontSize:
                                                                      6.0,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelSmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 0.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 1.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 120.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).secondaryBackground,
                              FlutterFlowTheme.of(context).accent4
                            ],
                            stops: [0.8, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: AutoSizeText(
                                valueOrDefault<String>(
                                  widget.categoryDescription,
                                  'Category Description',
                                ),
                                maxLines: 2,
                                minFontSize: 12.0,
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
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 24.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'h11fon59' /* Latest Posts */,
                                  ),
                                  minFontSize: 12.0,
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
                          ],
                        ),
                      ),
                    ],
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
