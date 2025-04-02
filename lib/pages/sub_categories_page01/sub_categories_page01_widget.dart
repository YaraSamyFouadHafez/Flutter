import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sub_categories_page01_model.dart';
export 'sub_categories_page01_model.dart';

class SubCategoriesPage01Widget extends StatefulWidget {
  const SubCategoriesPage01Widget({
    super.key,
    required this.subCategoryId,
    required this.subCategoryName,
    required this.subCategoryDescription,
  });

  final String? subCategoryId;
  final String? subCategoryName;
  final String? subCategoryDescription;

  static String routeName = 'subCategoriesPage01';
  static String routePath = 'subCategoriesPage01';

  @override
  State<SubCategoriesPage01Widget> createState() =>
      _SubCategoriesPage01WidgetState();
}

class _SubCategoriesPage01WidgetState extends State<SubCategoriesPage01Widget> {
  late SubCategoriesPage01Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubCategoriesPage01Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'subCategoriesPage01'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SUB_CATEGORIES_PAGE01_subCategoriesPage0');
      logFirebaseEvent('subCategoriesPage01_action_block');
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
        final subCategoriesPage01GetPostsVOneResponse = snapshot.data!;

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
                  logFirebaseEvent('SUB_CATEGORIES_PAGE01_arrow_back_ICN_ON_');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.safePop();
                  if (StAthanasiusAPIGroup.getPostsVOneCall.newTokenFromOldOne(
                        subCategoriesPage01GetPostsVOneResponse.jsonBody,
                      ) !=
                      '') {
                    logFirebaseEvent('IconButton_update_app_state');
                    FFAppState().token = StAthanasiusAPIGroup.getPostsVOneCall
                        .newTokenFromOldOne(
                      subCategoriesPage01GetPostsVOneResponse.jsonBody,
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
                        widget.subCategoryName,
                        'Category Name',
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
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  FutureBuilder<ApiCallResponse>(
                                    future: StAthanasiusAPIGroup
                                        .getCategoriesVOneCall
                                        .call(
                                      parentCategory: widget.subCategoryId,
                                      includeSubcategories: false,
                                      root: false,
                                      jwt: FFAppState().token,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitRing(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      final wrapGetCategoriesVOneResponse =
                                          snapshot.data!;

                                      return Builder(
                                        builder: (context) {
                                          final subCategories2 = getJsonField(
                                            wrapGetCategoriesVOneResponse
                                                .jsonBody,
                                            r'''$.data''',
                                          ).toList();

                                          return Wrap(
                                            spacing: 32.0,
                                            runSpacing: 16.0,
                                            alignment: WrapAlignment.center,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.center,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: List.generate(
                                                subCategories2.length,
                                                (subCategories2Index) {
                                              final subCategories2Item =
                                                  subCategories2[
                                                      subCategories2Index];
                                              return Padding(
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
                                                        'SUB_CATEGORIES_PAGE01_Container_126iaf3x');
                                                    if (StAthanasiusAPIGroup
                                                            .getPostsVOneCall
                                                            .newTokenFromOldOne(
                                                          subCategoriesPage01GetPostsVOneResponse
                                                              .jsonBody,
                                                        ) !=
                                                        '') {
                                                      logFirebaseEvent(
                                                          'Container_update_app_state');
                                                      FFAppState().token =
                                                          StAthanasiusAPIGroup
                                                              .getPostsVOneCall
                                                              .newTokenFromOldOne(
                                                        subCategoriesPage01GetPostsVOneResponse
                                                            .jsonBody,
                                                      )!;
                                                      safeSetState(() {});
                                                    }
                                                    if (true ==
                                                        getJsonField(
                                                          subCategories2Item,
                                                          r'''$.hasSubCategories''',
                                                        )) {
                                                      logFirebaseEvent(
                                                          'Container_navigate_to');

                                                      context.pushNamed(
                                                        SubCategoriesPage01Widget
                                                            .routeName,
                                                        queryParameters: {
                                                          'subCategoryId':
                                                              serializeParam(
                                                            getJsonField(
                                                              subCategories2Item,
                                                              r'''$.id''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'subCategoryName':
                                                              serializeParam(
                                                            getJsonField(
                                                              subCategories2Item,
                                                              r'''$.name''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'subCategoryDescription':
                                                              serializeParam(
                                                            getJsonField(
                                                              subCategories2Item,
                                                              r'''$.description''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Container_navigate_to');

                                                      context.pushNamed(
                                                        PostsCategoryPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'categoryId':
                                                              serializeParam(
                                                            getJsonField(
                                                              subCategories2Item,
                                                              r'''$.id''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'categoryName':
                                                              serializeParam(
                                                            getJsonField(
                                                              subCategories2Item,
                                                              r'''$.name''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'categoryDescription':
                                                              serializeParam(
                                                            getJsonField(
                                                              subCategories2Item,
                                                              r'''$.description''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 140.0,
                                                    height: 152.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                              child: Container(
                                                                width: 120.0,
                                                                height: 67.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
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
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      fadeInDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      fadeOutDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      imageUrl:
                                                                          getJsonField(
                                                                        subCategories2Item,
                                                                        r'''$.thumbnailUrl''',
                                                                      ).toString(),
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      errorWidget: (context,
                                                                              error,
                                                                              stackTrace) =>
                                                                          Image
                                                                              .asset(
                                                                        'assets/images/error_image.png',
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
                                                          ),
                                                          Flexible(
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                getJsonField(
                                                                  subCategories2Item,
                                                                  r'''$.name''',
                                                                ).toString(),
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
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
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
                                            }),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ]
                                    .addToStart(SizedBox(height: 136.0))
                                    .addToEnd(SizedBox(height: 24.0)),
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
                                  widget.subCategoryDescription,
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
                                    'rhccrfht' /* Latest Posts */,
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
