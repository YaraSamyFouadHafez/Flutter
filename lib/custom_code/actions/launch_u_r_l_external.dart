// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';

Future launchURLExternal(String url) async {
  // Add your function code here!

  final Uri _url = Uri.parse(url);
  await launchUrl(_url, mode: LaunchMode.externalApplication);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
