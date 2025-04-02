import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/shimmer_category_slider_home_component_widget.dart';
import '/components/shimmer_recent_posts_grid_home_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'dart:async';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'homePage';
  static String routePath = 'homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool textFieldFocusListenerRegistered = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'homePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_homePage_ON_INIT_STATE');
      logFirebaseEvent('homePage_action_block');
      await action_blocks.checkNetwork(context);
      logFirebaseEvent('homePage_custom_action');
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
      logFirebaseEvent('homePage_action_block');
      await action_blocks.forceUpdate(context);
      logFirebaseEvent('homePage_request_permissions');
      await requestPermission(notificationsPermission);
      if (await getPermissionStatus(notificationsPermission)) {
        logFirebaseEvent('homePage_custom_action');
        _model.fCmtoken = await actions.getFCMToken();
        if (_model.fCmtoken != FFAppState().fcmAppState) {
          logFirebaseEvent('homePage_backend_call');

          await currentUserReference!.update(createUsersRecordData(
            allowPushNotification: true,
          ));
          logFirebaseEvent('homePage_update_app_state');
          FFAppState().fcmAppState = _model.fCmtoken!;
          FFAppState().update(() {});
          if (valueOrDefault<bool>(
              currentUserDocument?.allowPushNotification, false)) {
            logFirebaseEvent('homePage_backend_call');

            await currentUserReference!.update(createUsersRecordData(
              fCMToken: _model.fCmtoken,
            ));
            if (isAndroid) {
              logFirebaseEvent('homePage_backend_call');
              await StAthanasiusAPIGroup.fCMUpdateVOneCall.call(
                fireUserId: currentUserUid,
                fcmId: _model.fCmtoken,
                deviceType: 'Android',
              );
            } else {
              logFirebaseEvent('homePage_backend_call');
              await StAthanasiusAPIGroup.fCMUpdateVOneCall.call(
                fireUserId: currentUserUid,
                fcmId: _model.fCmtoken,
                deviceType: 'IOS',
              );
            }
          }
        }
      } else {
        logFirebaseEvent('homePage_backend_call');

        await currentUserReference!.update(createUsersRecordData(
          allowPushNotification: false,
        ));
      }
    });

    _model.textController ??= TextEditingController();
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
        final homePageGetPostsVOneResponse = snapshot.data!;

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
                      child: RefreshIndicator(
                        color: FlutterFlowTheme.of(context).tertiary,
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        onRefresh: () async {
                          logFirebaseEvent(
                              'HOME_Column_ayszd5za_ON_PULL_TO_REFRESH');
                          logFirebaseEvent('Column_clear_query_cache');
                          FFAppState().clearCatQueryCache();
                          logFirebaseEvent('Column_clear_query_cache');
                          FFAppState().clearLatestPostsCache();
                          logFirebaseEvent('Column_refresh_database_request');
                          safeSetState(() {
                            FFAppState().clearCatQueryCache();
                            _model.apiRequestCompleted4 = false;
                          });
                          logFirebaseEvent('Column_refresh_database_request');
                          safeSetState(
                              () => _model.apiRequestCompleter3 = null);
                          logFirebaseEvent('Column_refresh_database_request');
                          safeSetState(() {
                            FFAppState().clearLatestPostsCache();
                            _model.apiRequestCompleted2 = false;
                          });
                          logFirebaseEvent('Column_refresh_database_request');
                          safeSetState(() {
                            FFAppState().clearTodayBreadOfLifeCache();
                            _model.apiRequestCompleted1 = false;
                          });
                        },
                        child: SingleChildScrollView(
                          primary: false,
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 8.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? 'assets/images/ST_Logo_100_Sm_Dark.png'
                                              : 'assets/images/ST_Logo_100_Sm.png',
                                          width: 50.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: AutoSizeText(
                                        FFLocalizations.of(context).getText(
                                          '2b2w7jqg' /* St. Athanasius Church */,
                                        ),
                                        maxLines: 1,
                                        minFontSize: 12.0,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(FlutterFlowTheme
                                                          .of(context)
                                                      .headlineMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              StickyHeader(
                                overlapHeaders: false,
                                header: Container(
                                  width: double.infinity,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        FlutterFlowTheme.of(context).accent4
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(0.0, -1.0),
                                      end: AlignmentDirectional(0, 1.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 12.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              1.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(16.0),
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
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
                                                              'HOME_TextField_6mrpl7ql_ON_FOCUS_CHANGE');
                                                          if (StAthanasiusAPIGroup
                                                                  .getPostsVOneCall
                                                                  .newTokenFromOldOne(
                                                                homePageGetPostsVOneResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              '') {
                                                            logFirebaseEvent(
                                                                'TextField_update_app_state');
                                                            FFAppState().token =
                                                                StAthanasiusAPIGroup
                                                                    .getPostsVOneCall
                                                                    .newTokenFromOldOne(
                                                              homePageGetPostsVOneResponse
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
                                                      focusNode: _model
                                                          .textFieldFocusNode,
                                                      onFieldSubmitted:
                                                          (_) async {
                                                        logFirebaseEvent(
                                                            'HOME_TextField_6mrpl7ql_ON_TEXTFIELD_SUB');
                                                        logFirebaseEvent(
                                                            'TextField_navigate_to');

                                                        context.pushNamed(
                                                          PostsSearchPageWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'searchText':
                                                                serializeParam(
                                                              _model
                                                                  .textController
                                                                  .text,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );

                                                        logFirebaseEvent(
                                                            'TextField_clear_text_fields_pin_codes');
                                                        safeSetState(() {
                                                          _model.textController
                                                              ?.clear();
                                                        });
                                                        if (StAthanasiusAPIGroup
                                                                .getPostsVOneCall
                                                                .newTokenFromOldOne(
                                                              homePageGetPostsVOneResponse
                                                                  .jsonBody,
                                                            ) !=
                                                            '') {
                                                          logFirebaseEvent(
                                                              'TextField_update_app_state');
                                                          FFAppState().token =
                                                              StAthanasiusAPIGroup
                                                                  .getPostsVOneCall
                                                                  .newTokenFromOldOne(
                                                            homePageGetPostsVOneResponse
                                                                .jsonBody,
                                                          )!;
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                      autofocus: false,
                                                      textInputAction:
                                                          TextInputAction
                                                              .search,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        labelText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '0qrjcu9b' /* Search... */,
                                                        ),
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
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
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_search_rounded_ICN_ON_TAP');
                                                logFirebaseEvent(
                                                    'IconButton_navigate_to');

                                                context.pushNamed(
                                                  PostsSearchPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'searchText':
                                                        serializeParam(
                                                      _model
                                                          .textController.text,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                logFirebaseEvent(
                                                    'IconButton_clear_text_fields_pin_codes');
                                                safeSetState(() {
                                                  _model.textController
                                                      ?.clear();
                                                });
                                                if (StAthanasiusAPIGroup
                                                        .getPostsVOneCall
                                                        .newTokenFromOldOne(
                                                      homePageGetPostsVOneResponse
                                                          .jsonBody,
                                                    ) !=
                                                    '') {
                                                  logFirebaseEvent(
                                                      'IconButton_update_app_state');
                                                  FFAppState().token =
                                                      StAthanasiusAPIGroup
                                                          .getPostsVOneCall
                                                          .newTokenFromOldOne(
                                                    homePageGetPostsVOneResponse
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
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '6b0mjakk' /* Categories */,
                                                ),
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 4.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 168.0,
                                              decoration: BoxDecoration(),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: FFAppState()
                                                    .catQuery(
                                                  requestFn: () =>
                                                      StAthanasiusAPIGroup
                                                          .getCategoriesHomeVOneCall
                                                          .call(
                                                    includeSubcategories: false,
                                                    root: true,
                                                    sortBy: 'publishedAt',
                                                    jwt: FFAppState().token,
                                                  ),
                                                )
                                                    .then((result) {
                                                  _model.apiRequestCompleted4 =
                                                      true;
                                                  return result;
                                                }),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return ShimmerCategorySliderHomeComponentWidget();
                                                  }
                                                  final listViewGetCategoriesHomeVOneResponse =
                                                      snapshot.data!;

                                                  return Builder(
                                                    builder: (context) {
                                                      final categories =
                                                          getJsonField(
                                                        listViewGetCategoriesHomeVOneResponse
                                                            .jsonBody,
                                                        r'''$.data[:]''',
                                                      ).toList();
                                                      if (categories.isEmpty) {
                                                        return ShimmerCategorySliderHomeComponentWidget();
                                                      }

                                                      return ListView.separated(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    16.0),
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            categories.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                width: 16.0),
                                                        itemBuilder: (context,
                                                            categoriesIndex) {
                                                          final categoriesItem =
                                                              categories[
                                                                  categoriesIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'HOME_PAGE_PAGE_Container_zbtk23q5_ON_TAP');
                                                                if (StAthanasiusAPIGroup
                                                                        .getCategoriesHomeVOneCall
                                                                        .newTokenFromOldOne(
                                                                      listViewGetCategoriesHomeVOneResponse
                                                                          .jsonBody,
                                                                    ) !=
                                                                    '') {
                                                                  logFirebaseEvent(
                                                                      'Container_update_app_state');
                                                                  FFAppState()
                                                                          .token =
                                                                      StAthanasiusAPIGroup
                                                                          .getCategoriesHomeVOneCall
                                                                          .newTokenFromOldOne(
                                                                    listViewGetCategoriesHomeVOneResponse
                                                                        .jsonBody,
                                                                  )!;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                                if (true ==
                                                                    getJsonField(
                                                                      categoriesItem,
                                                                      r'''$.hasSubCategories''',
                                                                    )) {
                                                                  logFirebaseEvent(
                                                                      'Container_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    SubCategoriesPageWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'categoryId':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          categoriesItem,
                                                                          r'''$.id''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'categoryName':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          categoriesItem,
                                                                          r'''$.name''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'categoryDescription':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          categoriesItem,
                                                                          r'''$.description''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Container_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    PostsCategoryPageWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'categoryId':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          categoriesItem,
                                                                          r'''$.id''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'categoryName':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          categoriesItem,
                                                                          r'''$.name''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'categoryDescription':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          categoriesItem,
                                                                          r'''$.description''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                }
                                                              },
                                                              child: Container(
                                                                width: 140.0,
                                                                height: 200.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    width: 2.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                120.0,
                                                                            height:
                                                                                67.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              shape: BoxShape.rectangle,
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                child: CachedNetworkImage(
                                                                                  fadeInDuration: Duration(milliseconds: 500),
                                                                                  fadeOutDuration: Duration(milliseconds: 500),
                                                                                  imageUrl: getJsonField(
                                                                                    categoriesItem,
                                                                                    r'''$.thumbnailUrl''',
                                                                                  ).toString(),
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  fit: BoxFit.cover,
                                                                                  errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                    'assets/images/error_image.png',
                                                                                    width: double.infinity,
                                                                                    height: double.infinity,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            getJsonField(
                                                                              categoriesItem,
                                                                              r'''$.name''',
                                                                            ).toString(),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            maxLines:
                                                                                3,
                                                                            minFontSize:
                                                                                10.0,
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  't0s5cmp9' /* Recent Posts */,
                                                ),
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 270.0,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: (_model
                                                                .apiRequestCompleter3 ??=
                                                            Completer<
                                                                ApiCallResponse>()
                                                              ..complete(
                                                                  StAthanasiusAPIGroup
                                                                      .getPostsVOneCall
                                                                      .call(
                                                                excludeCategories:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                type: '10',
                                                                categoryId: '1',
                                                                publishedBefore:
                                                                    '67044c2b09151bf53642ed83',
                                                              )))
                                                        .future,
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child: SpinKitRing(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final listViewGetPostsVOneResponse =
                                                          snapshot.data!;

                                                      return Builder(
                                                        builder: (context) {
                                                          final recentPosts =
                                                              getJsonField(
                                                            listViewGetPostsVOneResponse
                                                                .jsonBody,
                                                            r'''$.data.posts[:]''',
                                                          ).toList();

                                                          return ListView
                                                              .separated(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        16.0),
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                                recentPosts
                                                                    .length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                SizedBox(
                                                                    width:
                                                                        16.0),
                                                            itemBuilder: (context,
                                                                recentPostsIndex) {
                                                              final recentPostsItem =
                                                                  recentPosts[
                                                                      recentPostsIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'HOME_PAGE_PAGE_Container_3ckpavzr_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Container_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      SinglePostPageWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'postId':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            recentPostsItem,
                                                                            r'''$.postId''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'postType':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            recentPostsItem,
                                                                            r'''$.type''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        300.0,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  child: Image.network(
                                                                                    valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        recentPostsItem,
                                                                                        r'''$.thumbnailUrl''',
                                                                                      )?.toString(),
                                                                                      'https://images.unsplash.com/photo-1558518665-aa41dba55e2c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxOXx8Y3Jvc3N8ZW58MHx8fHwxNzI1MTgzMzY4fDA&ixlib=rb-4.0.3&q=80&w=1080',
                                                                                    ),
                                                                                    width: double.infinity,
                                                                                    height: double.infinity,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          AutoSizeText(
                                                                            () {
                                                                              if (FFLocalizations.of(context).languageCode == 'es') {
                                                                                return getJsonField(
                                                                                  recentPostsItem,
                                                                                  r'''$.title.es''',
                                                                                ).toString();
                                                                              } else if (FFLocalizations.of(context).languageCode == 'fr') {
                                                                                return getJsonField(
                                                                                  recentPostsItem,
                                                                                  r'''$.title.fr''',
                                                                                ).toString();
                                                                              } else {
                                                                                return getJsonField(
                                                                                  recentPostsItem,
                                                                                  r'''$.title.en''',
                                                                                ).toString();
                                                                              }
                                                                            }(),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            maxLines:
                                                                                2,
                                                                            minFontSize:
                                                                                16.0,
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    dateTimeFormat(
                                                                                      "MMM d, y",
                                                                                      dateTimeFromSecondsSinceEpoch(getJsonField(
                                                                                        recentPostsItem,
                                                                                        r'''$.createdAt''',
                                                                                      )),
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    'date',
                                                                                  ),
                                                                                  textAlign: TextAlign.end,
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(1.0, 1.0),
                                                                                child: Text(
                                                                                  () {
                                                                                    if (FFLocalizations.of(context).languageCode == 'es') {
                                                                                      return getJsonField(
                                                                                        recentPostsItem,
                                                                                        r'''$.categoryId.name.es''',
                                                                                      ).toString();
                                                                                    } else if (FFLocalizations.of(context).languageCode == 'fr') {
                                                                                      return getJsonField(
                                                                                        recentPostsItem,
                                                                                        r'''$.categoryId.name.fr''',
                                                                                      ).toString();
                                                                                    } else {
                                                                                      return getJsonField(
                                                                                        recentPostsItem,
                                                                                        r'''$.categoryId.name.en''',
                                                                                      ).toString();
                                                                                    }
                                                                                  }(),
                                                                                  textAlign: TextAlign.end,
                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(height: 8.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ou3lzuls' /* Recent Posts */,
                                                ),
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
                                            Container(
                                              width: double.infinity,
                                              height: 600.0,
                                              decoration: BoxDecoration(),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: FFAppState()
                                                    .latestPosts(
                                                  requestFn: () =>
                                                      StAthanasiusAPIGroup
                                                          .getPostsVOneCall
                                                          .call(
                                                    sortBy: 'publishedAt',
                                                    page: 0,
                                                    limit: 10,
                                                    jwt: FFAppState().token,
                                                  ),
                                                )
                                                    .then((result) {
                                                  _model.apiRequestCompleted2 =
                                                      true;
                                                  return result;
                                                }),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return ShimmerRecentPostsGridHomeComponentWidget();
                                                  }
                                                  final gridViewGetPostsVOneResponse =
                                                      snapshot.data!;

                                                  return Builder(
                                                    builder: (context) {
                                                      final recentPosts1 =
                                                          getJsonField(
                                                        gridViewGetPostsVOneResponse
                                                            .jsonBody,
                                                        r'''$.data.posts[:]''',
                                                      ).toList();
                                                      if (recentPosts1
                                                          .isEmpty) {
                                                        return ShimmerRecentPostsGridHomeComponentWidget();
                                                      }

                                                      return GridView.builder(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                          16.0,
                                                          0,
                                                          16.0,
                                                          0,
                                                        ),
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing:
                                                              24.0,
                                                          mainAxisSpacing: 24.0,
                                                          childAspectRatio:
                                                              0.95,
                                                        ),
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            recentPosts1.length,
                                                        itemBuilder: (context,
                                                            recentPosts1Index) {
                                                          final recentPosts1Item =
                                                              recentPosts1[
                                                                  recentPosts1Index];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'HOME_PAGE_PAGE_Container_ow232zm7_ON_TAP');
                                                              if (StAthanasiusAPIGroup
                                                                      .getPostsVOneCall
                                                                      .newTokenFromOldOne(
                                                                    gridViewGetPostsVOneResponse
                                                                        .jsonBody,
                                                                  ) !=
                                                                  '') {
                                                                logFirebaseEvent(
                                                                    'Container_update_app_state');
                                                                FFAppState()
                                                                        .token =
                                                                    StAthanasiusAPIGroup
                                                                        .getPostsVOneCall
                                                                        .newTokenFromOldOne(
                                                                  gridViewGetPostsVOneResponse
                                                                      .jsonBody,
                                                                )!;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                              logFirebaseEvent(
                                                                  'Container_navigate_to');

                                                              context.pushNamed(
                                                                SinglePostPageWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'postId':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      recentPosts1Item,
                                                                      r'''$.postId''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'postType':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      recentPosts1Item,
                                                                      r'''$.type''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              fadeInDuration: Duration(milliseconds: 500),
                                                                              fadeOutDuration: Duration(milliseconds: 500),
                                                                              imageUrl: getJsonField(
                                                                                recentPosts1Item,
                                                                                r'''$.thumbnailUrl''',
                                                                              ).toString(),
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              fit: BoxFit.cover,
                                                                              errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                'assets/images/error_image.png',
                                                                                width: double.infinity,
                                                                                height: double.infinity,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        getJsonField(
                                                                          recentPosts1Item,
                                                                          r'''$.title''',
                                                                        ).toString(),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        maxLines:
                                                                            2,
                                                                        minFontSize:
                                                                            14.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Flexible(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                              child: AutoSizeText(
                                                                                getJsonField(
                                                                                  recentPosts1Item,
                                                                                  r'''$.categoryId.name''',
                                                                                ).toString(),
                                                                                textAlign: TextAlign.end,
                                                                                maxLines: 1,
                                                                                minFontSize: 8.0,
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                AutoSizeText(
                                                                              FFLocalizations.of(context).languageCode == 'ar'
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
                                                                                      recentPosts1Item,
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
                                                                                      recentPosts1Item,
                                                                                      r'''$.publishedAt''',
                                                                                    ).toString())),
                                                                              textAlign: TextAlign.end,
                                                                              maxLines: 1,
                                                                              minFontSize: 6.0,
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ]
                                                                      .divide(SizedBox(
                                                                          height:
                                                                              8.0))
                                                                      .addToEnd(SizedBox(
                                                                          height:
                                                                              8.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 8.0))
                                              .addToStart(
                                                  SizedBox(height: 16.0))
                                              .addToEnd(SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    ),
                                    if ((FFLocalizations.of(context)
                                                .languageCode ==
                                            'en') &&
                                        getRemoteConfigBool(
                                            'Show_Bread_Section'))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 32.0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: FFAppState()
                                              .todayBreadOfLife(
                                            requestFn: () =>
                                                StAthanasiusAPIGroup
                                                    .getTheBreadOfLifeCall
                                                    .call(
                                              date: getCurrentTimestamp
                                                  .secondsSinceEpoch
                                                  .toString(),
                                            ),
                                          )
                                              .then((result) {
                                            _model.apiRequestCompleted1 = true;
                                            return result;
                                          }),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitRing(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final breadComponentGetTheBreadOfLifeResponse =
                                                snapshot.data!;

                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'beqr8vnk' /* Our Daily Bread */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: InkWell(
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
                                                            'HOME_PAGE_PAGE_Container_auf3oylc_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Container_navigate_to');

                                                        context.pushNamed(
                                                          SinglePostPageWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'postId':
                                                                serializeParam(
                                                              getJsonField(
                                                                breadComponentGetTheBreadOfLifeResponse
                                                                    .jsonBody,
                                                                r'''$.data.postId''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'postType':
                                                                serializeParam(
                                                              getJsonField(
                                                                breadComponentGetTheBreadOfLifeResponse
                                                                    .jsonBody,
                                                                r'''$.data.type''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 375.0,
                                                        height: 290.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                2.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        355.0,
                                                                    height:
                                                                        200.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            child:
                                                                                Image.network(
                                                                              getJsonField(
                                                                                breadComponentGetTheBreadOfLifeResponse.jsonBody,
                                                                                r'''$.data.thumbnailUrl''',
                                                                              ).toString(),
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              fit: BoxFit.cover,
                                                                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                'assets/images/error_image.png',
                                                                                width: double.infinity,
                                                                                height: double.infinity,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                child: BackdropFilter(
                                                                                  filter: ImageFilter.blur(
                                                                                    sigmaX: 5.0,
                                                                                    sigmaY: 2.0,
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 32.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).accent4,
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                          child: Text(
                                                                                            dateTimeFormat(
                                                                                              "MMM d, y",
                                                                                              getCurrentTimestamp,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
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
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                child:
                                                                    Container(
                                                                  height: 55.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        () {
                                                                          if (FFLocalizations.of(context).languageCode ==
                                                                              'es') {
                                                                            return getJsonField(
                                                                              breadComponentGetTheBreadOfLifeResponse.jsonBody,
                                                                              r'''$.data.title.es''',
                                                                            ).toString();
                                                                          } else if (FFLocalizations.of(context).languageCode ==
                                                                              'fr') {
                                                                            return getJsonField(
                                                                              breadComponentGetTheBreadOfLifeResponse.jsonBody,
                                                                              r'''$.data.title.fr''',
                                                                            ).toString();
                                                                          } else {
                                                                            return getJsonField(
                                                                              breadComponentGetTheBreadOfLifeResponse.jsonBody,
                                                                              r'''$.data.title.en''',
                                                                            ).toString();
                                                                          }
                                                                        }(),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        maxLines:
                                                                            2,
                                                                        minFontSize:
                                                                            16.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
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
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 32.0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: FFAppState().todayBreadOfLife(
                                            requestFn: () =>
                                                StAthanasiusAPIGroup
                                                    .getTheBreadOfLifeCall
                                                    .call(
                                              date: getCurrentTimestamp
                                                  .secondsSinceEpoch
                                                  .toString(),
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitRing(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final breadComponent2GetTheBreadOfLifeResponse =
                                                snapshot.data!;

                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '3kxhadva' /* Our Daily Bread */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: InkWell(
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
                                                            'HOME_PAGE_PAGE_Container_hb3iqnxs_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Container_navigate_to');

                                                        context.pushNamed(
                                                            BreadOfLifePageWidget
                                                                .routeName);
                                                      },
                                                      child: Container(
                                                        width: 375.0,
                                                        height: 290.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                2.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        355.0,
                                                                    height:
                                                                        200.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            child:
                                                                                Image.network(
                                                                              getJsonField(
                                                                                breadComponent2GetTheBreadOfLifeResponse.jsonBody,
                                                                                r'''$.data.thumbnailUrl''',
                                                                              ).toString(),
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              fit: BoxFit.cover,
                                                                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                'assets/images/error_image.png',
                                                                                width: double.infinity,
                                                                                height: double.infinity,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                child: BackdropFilter(
                                                                                  filter: ImageFilter.blur(
                                                                                    sigmaX: 5.0,
                                                                                    sigmaY: 2.0,
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 32.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).accent4,
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                          child: Text(
                                                                                            dateTimeFormat(
                                                                                              "MMM d, y",
                                                                                              getCurrentTimestamp,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
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
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                child:
                                                                    Container(
                                                                  height: 55.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        () {
                                                                          if (FFLocalizations.of(context).languageCode ==
                                                                              'es') {
                                                                            return getJsonField(
                                                                              breadComponent2GetTheBreadOfLifeResponse.jsonBody,
                                                                              r'''$.data.title.es''',
                                                                            ).toString();
                                                                          } else if (FFLocalizations.of(context).languageCode ==
                                                                              'fr') {
                                                                            return getJsonField(
                                                                              breadComponent2GetTheBreadOfLifeResponse.jsonBody,
                                                                              r'''$.data.title.fr''',
                                                                            ).toString();
                                                                          } else {
                                                                            return getJsonField(
                                                                              breadComponent2GetTheBreadOfLifeResponse.jsonBody,
                                                                              r'''$.data.title.en''',
                                                                            ).toString();
                                                                          }
                                                                        }(),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        maxLines:
                                                                            2,
                                                                        minFontSize:
                                                                            16.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
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
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '14rm87l0' /* Our Services */,
                                                ),
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
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Wrap(
                                              spacing: 16.0,
                                              runSpacing: 0.0,
                                              alignment: WrapAlignment.center,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment:
                                                  WrapAlignment.center,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: InkWell(
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
                                                          'HOME_PAGE_PAGE_Container_8m3uump5_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_navigate_to');

                                                      context.pushNamed(
                                                          AuthCreateWidget
                                                              .routeName);

                                                      if (StAthanasiusAPIGroup
                                                              .getPostsVOneCall
                                                              .newTokenFromOldOne(
                                                            homePageGetPostsVOneResponse
                                                                .jsonBody,
                                                          ) !=
                                                          '') {
                                                        logFirebaseEvent(
                                                            'Container_update_app_state');
                                                        FFAppState().token =
                                                            StAthanasiusAPIGroup
                                                                .getPostsVOneCall
                                                                .newTokenFromOldOne(
                                                          homePageGetPostsVOneResponse
                                                              .jsonBody,
                                                        )!;
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 112.0,
                                                      height: 160.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 96.0,
                                                                  height: 96.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/ST_Logo_1000_XL_Dark.png',
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '03yujghr' /* Christ The Healer */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    maxLines: 3,
                                                                    minFontSize:
                                                                        10.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
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
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: InkWell(
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
                                                          'HOME_PAGE_PAGE_Container_tbw9la25_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_navigate_to');

                                                      context.pushNamed(
                                                          RadioWidget
                                                              .routeName);

                                                      if (StAthanasiusAPIGroup
                                                              .getPostsVOneCall
                                                              .newTokenFromOldOne(
                                                            homePageGetPostsVOneResponse
                                                                .jsonBody,
                                                          ) !=
                                                          '') {
                                                        logFirebaseEvent(
                                                            'Container_update_app_state');
                                                        FFAppState().token =
                                                            StAthanasiusAPIGroup
                                                                .getPostsVOneCall
                                                                .newTokenFromOldOne(
                                                          homePageGetPostsVOneResponse
                                                              .jsonBody,
                                                        )!;
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 112.0,
                                                      height: 160.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 96.0,
                                                                  height: 96.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/ST_Logo_1000_XL_Dark.png',
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'bln219dd' /* Radio */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    maxLines: 3,
                                                                    minFontSize:
                                                                        10.0,
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
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: InkWell(
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
                                                          'HOME_PAGE_PAGE_Container_ye7380mb_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_launch_u_r_l');
                                                      await launchURL(
                                                          'https://saiusa.org/app/index.php');
                                                      if (StAthanasiusAPIGroup
                                                              .getPostsVOneCall
                                                              .newTokenFromOldOne(
                                                            homePageGetPostsVOneResponse
                                                                .jsonBody,
                                                          ) !=
                                                          '') {
                                                        logFirebaseEvent(
                                                            'Container_update_app_state');
                                                        FFAppState().token =
                                                            StAthanasiusAPIGroup
                                                                .getPostsVOneCall
                                                                .newTokenFromOldOne(
                                                          homePageGetPostsVOneResponse
                                                              .jsonBody,
                                                        )!;
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 112.0,
                                                      height: 160.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 96.0,
                                                                  height: 96.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/ST_Logo_1000_XL_Dark.png',
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'cgc03e6l' /* ST. Athanasius Institute */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    maxLines: 3,
                                                                    minFontSize:
                                                                        10.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].addToEnd(SizedBox(height: 80.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
