import '/backend/api_requests/api_calls.dart';
import '/components/shimmer_posts_list_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:ff_commons/api_requests/api_paging_params.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'posts_search_page_model.dart';
export 'posts_search_page_model.dart';

class PostsSearchPageWidget extends StatefulWidget {
  const PostsSearchPageWidget({
    super.key,
    this.searchText,
  });

  final String? searchText;

  static String routeName = 'postsSearchPage';
  static String routePath = 'postsSearchPage';

  @override
  State<PostsSearchPageWidget> createState() => _PostsSearchPageWidgetState();
}

class _PostsSearchPageWidgetState extends State<PostsSearchPageWidget> {
  late PostsSearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool textFieldFocusListenerRegistered = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostsSearchPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'postsSearchPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('POSTS_SEARCH_postsSearchPage_ON_INIT_STA');
      logFirebaseEvent('postsSearchPage_action_block');
      await action_blocks.checkNetwork(context);
    });

    _model.textController ??= TextEditingController(text: widget.searchText);
    _model.textFieldFocusNode ??= FocusNode();
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
        limit: 1,
        jwt: FFAppState().token,
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
        final postsSearchPageGetPostsVOneResponse = snapshot.data!;

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
                  logFirebaseEvent('POSTS_SEARCH_arrow_back_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(HomePageWidget.routeName);

                  if (StAthanasiusAPIGroup.getPostsVOneCall.newTokenFromOldOne(
                        postsSearchPageGetPostsVOneResponse.jsonBody,
                      ) !=
                      '') {
                    logFirebaseEvent('IconButton_update_app_state');
                    FFAppState().token = StAthanasiusAPIGroup.getPostsVOneCall
                        .newTokenFromOldOne(
                      postsSearchPageGetPostsVOneResponse.jsonBody,
                    )!;
                    safeSetState(() {});
                  }
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'hihgy9hn' /* Search... */,
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
                                    'POSTS_SEARCH_ListView_6wm33o80_ON_PULL_T');
                                logFirebaseEvent(
                                    'ListView_refresh_database_request');
                                safeSetState(() =>
                                    _model.listViewPagingController?.refresh());
                                await _model.waitForOnePageForListView();
                                if (StAthanasiusAPIGroup.getPostsVOneCall
                                        .newTokenFromOldOne(
                                      postsSearchPageGetPostsVOneResponse
                                          .jsonBody,
                                    ) !=
                                    '') {
                                  logFirebaseEvent('ListView_update_app_state');
                                  FFAppState().token = StAthanasiusAPIGroup
                                      .getPostsVOneCall
                                      .newTokenFromOldOne(
                                    postsSearchPageGetPostsVOneResponse
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
                                    search: widget.searchText,
                                    page: nextPageMarker.nextPageNumber,
                                    limit: 10,
                                  ),
                                ),
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  136.0,
                                  0,
                                  32.0,
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
                                              'POSTS_SEARCH_Container_1kkq1hlm_ON_TAP');
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
                                                postsSearchPageGetPostsVOneResponse
                                                    .jsonBody,
                                              ) !=
                                              '') {
                                            logFirebaseEvent(
                                                'Container_update_app_state');
                                            FFAppState().token =
                                                StAthanasiusAPIGroup
                                                    .getPostsVOneCall
                                                    .newTokenFromOldOne(
                                              postsSearchPageGetPostsVOneResponse
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
                                                                  getJsonField(
                                                                    postsListItem,
                                                                    r'''$.categoryId.name''',
                                                                  ).toString(),
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
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle:
                                                                            FontStyle.italic,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
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
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          width: double.infinity,
                          height: 120.0,
                          constraints: BoxConstraints(
                            maxWidth: double.infinity,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                FlutterFlowTheme.of(context).accent4
                              ],
                              stops: [0.8, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 200.0,
                                              child: Builder(builder: (_) {
                                                if (!textFieldFocusListenerRegistered) {
                                                  textFieldFocusListenerRegistered =
                                                      true;
                                                  _model.textFieldFocusNode!
                                                      .addListener(
                                                    () async {
                                                      logFirebaseEvent(
                                                          'POSTS_SEARCH_TextField_8ogmx6cl_ON_FOCUS');
                                                      if (StAthanasiusAPIGroup
                                                              .getPostsVOneCall
                                                              .newTokenFromOldOne(
                                                            postsSearchPageGetPostsVOneResponse
                                                                .jsonBody,
                                                          ) !=
                                                          '') {
                                                        logFirebaseEvent(
                                                            'TextField_update_app_state');
                                                        FFAppState().token =
                                                            StAthanasiusAPIGroup
                                                                .getPostsVOneCall
                                                                .newTokenFromOldOne(
                                                          postsSearchPageGetPostsVOneResponse
                                                              .jsonBody,
                                                        )!;
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                  );
                                                }
                                                return TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () => safeSetState(() {}),
                                                  ),
                                                  onFieldSubmitted: (_) async {
                                                    logFirebaseEvent(
                                                        'POSTS_SEARCH_TextField_8ogmx6cl_ON_TEXTF');
                                                    logFirebaseEvent(
                                                        'TextField_refresh_database_request');
                                                    safeSetState(() => _model
                                                        .listViewPagingController
                                                        ?.refresh());
                                                    await _model
                                                        .waitForOnePageForListView(
                                                            minWait: 100,
                                                            maxWait: 5000);
                                                    if (StAthanasiusAPIGroup
                                                            .getPostsVOneCall
                                                            .newTokenFromOldOne(
                                                          postsSearchPageGetPostsVOneResponse
                                                              .jsonBody,
                                                        ) !=
                                                        '') {
                                                      logFirebaseEvent(
                                                          'TextField_update_app_state');
                                                      FFAppState().token =
                                                          StAthanasiusAPIGroup
                                                              .getPostsVOneCall
                                                              .newTokenFromOldOne(
                                                        postsSearchPageGetPostsVOneResponse
                                                            .jsonBody,
                                                      )!;
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  autofocus: false,
                                                  textInputAction:
                                                      TextInputAction.search,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: false,
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '53w8eytz' /* Search... */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
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
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
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
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  validator: _model
                                                      .textControllerValidator
                                                      .asValidator(context),
                                                );
                                              }),
                                            ),
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderRadius: 12.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          icon: Icon(
                                            Icons.search_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'POSTS_SEARCH_search_rounded_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_refresh_database_request');
                                            safeSetState(() => _model
                                                .listViewPagingController
                                                ?.refresh());
                                            await _model
                                                .waitForOnePageForListView(
                                                    minWait: 50, maxWait: 5000);
                                            if (StAthanasiusAPIGroup
                                                    .getPostsVOneCall
                                                    .newTokenFromOldOne(
                                                  postsSearchPageGetPostsVOneResponse
                                                      .jsonBody,
                                                ) !=
                                                '') {
                                              logFirebaseEvent(
                                                  'IconButton_update_app_state');
                                              FFAppState().token =
                                                  StAthanasiusAPIGroup
                                                      .getPostsVOneCall
                                                      .newTokenFromOldOne(
                                                postsSearchPageGetPostsVOneResponse
                                                    .jsonBody,
                                              )!;
                                              safeSetState(() {});
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 16.0),
                                    child: AutoSizeText(
                                      FFLocalizations.of(context).getText(
                                        '2nfn0pdz' /* Posts Results */,
                                      ),
                                      minFontSize: 12.0,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
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
                              ),
                            ],
                          ),
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
