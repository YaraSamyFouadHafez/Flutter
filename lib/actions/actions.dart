import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future checkNetwork(BuildContext context) async {
  bool? internetConnection;

  logFirebaseEvent('checkNetwork_custom_action');
  internetConnection = await actions.checkInternetConnection();
  if (internetConnection == true) {
    logFirebaseEvent('checkNetwork_hide_snack_bar');
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  } else {
    logFirebaseEvent('checkNetwork_show_snack_bar');
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Your Connection Is Lost',
          style: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
                useGoogleFonts: GoogleFonts.asMap().containsKey(
                    FlutterFlowTheme.of(context).titleMediumFamily),
              ),
          textAlign: TextAlign.start,
        ),
        duration: Duration(milliseconds: 8800),
        backgroundColor: FlutterFlowTheme.of(context).error,
      ),
    );
  }
}

Future forceUpdate(BuildContext context) async {
  if (getRemoteConfigInt('Latest_Release') > FFAppState().AppVersionNumber) {
    if (!((getRemoteConfigInt('Minimum_Version') <=
            FFAppState().AppVersionNumber) &&
        FFAppState().SkipUpdate)) {
      logFirebaseEvent('forceUpdate_navigate_to');

      context.goNamed(ForceUpdateWidget.routeName);
    }
  }
}
