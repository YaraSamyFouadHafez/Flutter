import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'radio_model.dart';
export 'radio_model.dart';

/// welcome
class RadioWidget extends StatefulWidget {
  const RadioWidget({super.key});

  static String routeName = 'Radio';
  static String routePath = 'Radio';

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget>
    with TickerProviderStateMixin {
  late RadioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Radio'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('RADIO_PAGE_Radio_ON_INIT_STATE');
      logFirebaseEvent('Radio_action_block');
      await action_blocks.checkNetwork(context);
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(3.0, 3.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.6, 0.6),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 350.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 350.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 350.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.6, 0.6),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.6, 0.6),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      future: StAthanasiusAPIGroup.radioUrlCall.call(
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
        final radioRadioUrlResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 500.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).error,
                          FlutterFlowTheme.of(context).tertiary
                        ],
                        stops: [0.0, 0.5, 1.0],
                        begin: AlignmentDirectional(-1.0, -1.0),
                        end: AlignmentDirectional(1.0, 1.0),
                      ),
                    ),
                    child: Container(
                      height: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 600.0,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x00FFFFFF),
                            FlutterFlowTheme.of(context).secondaryBackground
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 24.0, 16.0, 24.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'RADIO_PAGE_BackIcon_ON_TAP');
                                    logFirebaseEvent('BackIcon_navigate_back');
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 32.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 32.0, 0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                      spreadRadius: 5.0,
                                    )
                                  ],
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).tertiary,
                                      FlutterFlowTheme.of(context).accent3
                                    ],
                                    stops: [0.5, 1.0],
                                    begin: AlignmentDirectional(0.5, -1.0),
                                    end: AlignmentDirectional(-0.5, 1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Image.asset(
                                    Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? 'assets/images/ST_Logo_250_Med_Dark.png'
                                        : 'assets/images/ST_Logo_250_Med.png',
                                    width: 150.0,
                                    height: 150.0,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation2']!),
                            ),
                            FlutterFlowTimer(
                              initialTime: _model.timerInitialTimeMs,
                              getDisplayTime: (value) =>
                                  StopWatchTimer.getDisplayTime(
                                value,
                                hours: false,
                                milliSecond: false,
                              ),
                              controller: _model.timerController,
                              updateStateInterval: Duration(milliseconds: 1000),
                              onChanged: (value, displayTime, shouldUpdate) {
                                _model.timerMilliseconds = value;
                                _model.timerValue = displayTime;
                                if (shouldUpdate) safeSetState(() {});
                              },
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineSmallFamily),
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'q9m2973d' /* St. Athanasius Church
Radio */
                                  ,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineLargeFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineLargeFamily),
                                    ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation']!),
                            ),
                            Container(
                              width: double.infinity,
                              height: 700.0,
                              child: custom_widgets.AdvanceMusicPlayer(
                                width: double.infinity,
                                height: 700.0,
                                initialUrl:
                                    StAthanasiusAPIGroup.radioUrlCall.radioUrl(
                                  radioRadioUrlResponse.jsonBody,
                                )!,
                                sliderContainerColor:
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                sliderContainerBorderRadius: 12.0,
                                sliderContainerWidth: 300.0,
                                sliderContainerHeight: 75.0,
                                sliderActiveTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                sliderInactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                sliderThumbColor:
                                    FlutterFlowTheme.of(context).primary,
                                sliderTrackHeight: 8.0,
                                sliderThumbRadius: 8.0,
                                playPauseButtonSize: 104.0,
                                playPauseFillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                playPauseBorderColor:
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                playPauseBorderWidth: 0.0,
                                playPauseBorderRadius: 12.0,
                                playPauseIconSize: 88.0,
                                playPauseIconColor:
                                    FlutterFlowTheme.of(context).primary,
                                sliderContainerPaddingAll: 18.0,
                                sliderContainerMarginAll: 20.0,
                                sliderOverlayColor: Color(0x4EB94848),
                                playPauseButtonMarginAll: 20.0,
                                playPauseButtonPaddingAll: 12.0,
                                switchActiveColor:
                                    FlutterFlowTheme.of(context).primary,
                                switchTrackColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                tileColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                tileRadius: 12.0,
                                timerTitleText:
                                    FFLocalizations.of(context).getText(
                                  'lxkt6kyt' /* Sleep Timer */,
                                ),
                                timerTitleColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                timerTitleFontSize: 18.0,
                                timerTextColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                timerFontSize: 16.0,
                                timerActiveColor:
                                    FlutterFlowTheme.of(context).secondary,
                                timerInactiveColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                tileContainerColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                tileContainerMarginAll: 16.0,
                                tileContainerPaddingAll: 8.0,
                                tileContainerBorderRadius: 12.0,
                                tileContainerBorderColor:
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                tileContainerBorderWidth: 2.0,
                                tileContainerWidth: 300.0,
                                tileContainerHeight: 75.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue ??= '',
                                ),
                                options: List<String>.from([
                                  '10 min',
                                  'Option 2',
                                  'Option 3',
                                  '3',
                                  '4',
                                  '5',
                                  '6',
                                  '7'
                                ]),
                                optionLabels: [
                                  FFLocalizations.of(context).getText(
                                    'v11ifdfa' /* 10 */,
                                  )
                                ],
                                onChanged: (val) => safeSetState(
                                    () => _model.dropDownValue = val),
                                width: 300.0,
                                height: 60.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelLargeFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily),
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'rv8bv6nx' /* Sleep Icon */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 32.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 1.0,
                                borderRadius: 12.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: Container(
                                  width: 300.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: SwitchListTile.adaptive(
                                      value: _model.switchListTileValue ??=
                                          true,
                                      onChanged: (newValue) async {
                                        safeSetState(() => _model
                                            .switchListTileValue = newValue);
                                        if (newValue) {
                                          logFirebaseEvent(
                                              'RADIO_SwitchListTile_x95qt0su_ON_TOGGLE_');
                                          logFirebaseEvent(
                                              'SwitchListTile_date_time_picker');

                                          final _datePickedTime =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                getCurrentTimestamp),
                                          );
                                          if (_datePickedTime != null) {
                                            safeSetState(() {
                                              _model.datePicked = DateTime(
                                                getCurrentTimestamp.year,
                                                getCurrentTimestamp.month,
                                                getCurrentTimestamp.day,
                                                _datePickedTime.hour,
                                                _datePickedTime.minute,
                                              );
                                            });
                                          } else if (_model.datePicked !=
                                              null) {
                                            safeSetState(() {
                                              _model.datePicked =
                                                  getCurrentTimestamp;
                                            });
                                          }
                                        }
                                      },
                                      title: Text(
                                        FFLocalizations.of(context).getText(
                                          'bwo4dmn0' /* Sleep Timer */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily),
                                            ),
                                      ),
                                      subtitle: Text(
                                        _model.timerValue,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
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
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).primary,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation3']!),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: Container(
                                  width: 300.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.volume_up,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      Slider(
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        min: 0.0,
                                        max: 100.0,
                                        value: _model.sliderValue ??= 50.0,
                                        label: _model.sliderValue
                                            ?.toStringAsFixed(6),
                                        divisions: 100,
                                        onChanged: (newValue) {
                                          newValue = double.parse(
                                              newValue.toStringAsFixed(6));
                                          safeSetState(() =>
                                              _model.sliderValue = newValue);
                                        },
                                      ),
                                      Icon(
                                        Icons.volume_mute,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation4']!),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 700.0,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      custom_widgets.HtmlDirct(
                                        width: double.infinity,
                                        height: 50.0,
                                        htmlContent:
                                            '# تجربه h1\n## تجربه 2\n### تجربه 3\n#### تجربه 4\n##### تجربه 5\n###### تجربه 6\n\n> رصد تقرير لموقع \"سمارت شيت\" (Smartsheet) أسباب فشل المشروعات الناشئة وكيف يمكن أن تتعافى من الفشل بعد مشروعك الأول، وأشار إلى أن أكثر عباقرة ريادة الأعمال فشلوا في العديد من المشروعات، ولم يمنعهم هذا من مواصلة العمل والنجاح لاحقا.\n\n> وذكر التقرير أن والت ديزني أحد أكثر العباقرة إبداعا في القرن العشرين طرد بحجة افتقاره إلى الإبداع، وفشلت شركته الأولى \"لاف أو-غرام فيلم\" (Laugh-O-Gram Films)، ونفد ماله. ولكنه استطاع بعد عامين من المثابرة إنشاء شركة \"والت ديزني\" الحالية الأكبر والأشهر في العالم للرسوم المتحركة.\n\n> وتفاجأ ستيف جوبز مؤسس شركة آبل، في الثلاثين من عمره بقرار مجلس إدارة الشركة عزله، ولكنه قرر مواجهة الفشل وأسس شركة جديدة هي \"نكست\" (NeXT) التي استحوذت على شركة \"آبل\" في النهاية، وبمجرد عودته أثبت جوبز قدرته على التحدي من خلال إعادة الابتكار والارتقاء بشركة \"آبل\" إلى آفاق جديدة.\n\n---\n\n### استخلاص الدروس وقرار التغيير\n\n> أشار التقرير إلى أنه إذا وصلت إلى طريق مسدود يجب عليك الاستفادة من الدروس الكامنة وراء خسارة  \n> **\"فَتَمَّ خَلْقُ السَّماواتِ والأرضِ وجميعِ ما فيها.\" (تك 2: 1). الترجمة العربية المشتركة**  \n> مشروعك، فلا بد أن هناك أخطاء وقرارات أدت إلى ذلك، وما عليك فعله الآن إلا أن تحدد أسباب الفشل وتدرك بدقة الأخطاء التي وقعت فيها كي لا تكررها ثانية.\n\n---\n\n### تغيير طريقة التفكير\n\n> الخطوة الثانية في التعافي هي تغيير طريقة التفكير والتعاطي مع الأشياء. فهذه هي الطريقة الوحيدة التي تعينك على تطوير ذاتك، وعلى الدفع بك للأمام من جديد وجعلك أكثر صلابة.\n\n---\n\n### التخطيط للعودة من جديد\n\n> لا تبك على اللبن المسكوب، طالما تعلمت الدرس، واستخلصت الفوائد والعبر من خسارة مشروعك، فما عليك سوى التخطيط للبدء من جديد. وتأكد أن خبرة الفشل ستهون عليك العديد من الأخطاء في المستقبل، إذ إنك خضت تجربة من قبل، وبالتالي لن يكون البدء من جديد بالأمر العسير بالنسبة لك.\n\n> وفي تقرير آخر نشره موقع \"فوربس\" (Forbes) الأميركي، قدم مجموعة من الخبراء خطوات عملية للتعافي من فشلك في مشروعك من أهمها ما يلي:\n\n---\n\n### استعِنْ بالمستشارين والخبراء\n\n> التعامل مع الفشل ليس أمرا سهلا تحديدا إذا كنت مفتقدا للخبرة، إذ لا بد من الاستعانة بالخبراء للوقوف على أهم أسباب الفشل والحصول على التوجيه الكافي قبل الانطلاق في أي من مشا\n',
                                        isMarkdown: true,
                                        h1Color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        h2Color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        h3Color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        h4Color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        h5Color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        h6Color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        pColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        spanColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        blockquoteTextColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        blockquoteBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        blockquoteBorderColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        textAlign: 'right',
                                      ),
                                    ].addToEnd(SizedBox(height: 80.0)),
                                  ),
                                ),
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 56.0)),
                        ),
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation1']!),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
