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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

void main() async {
  runApp(MaterialApp(
    home: Builder(
      builder: (context) {
        checkConnectivityContinuously(context);
        return Container(); // Return any widget here if needed
      },
    ),
  ));
}

bool isConnectedPreviously = false;
bool _isDialogOpen = false; // Flag to track if a dialog is currently open

Future<void> checkConnectivityContinuously(BuildContext context) async {
  final listener = InternetConnection().onStatusChange.listen((status) {
    //   // +++++++++++++++++++++++++++++++++++++++++
    // Future<bool> checkInternetConnectivity() async {
    // final listener = InternetConnection().onStatusChange.listen((status) {
    //   // +++++++++++++++++++++++++++++++++++++++++

    // Dismiss the current dialog before showing a new one
    if (_isDialogOpen) {
      Navigator.of(context).pop();
      _isDialogOpen = false; // Reset flag when dialog is dismissed
    }

    switch (status) {
      case InternetStatus.connected:
        if (isConnectedPreviously) {
          print('You have internet connection.');
          showInternetAlertDialog(context, 'Internet Connection',
              'You have internet connection.', true);
        } else {
          isConnectedPreviously = true;
        }
        break;
      case InternetStatus.disconnected:
        print('You do not have internet connection.');
        showInternetAlertDialog(
            context, 'Connection failure.', 'Please try again.', false);
        break;
    }
  });
}

void showInternetAlertDialog(
    BuildContext context, String title, String message, bool isConnected) {
  if (!_isDialogOpen) {
    // Check if no dialog is currently open
    _isDialogOpen = true; // Set flag to indicate dialog is open
    showDialog<void>(
      context: context,
      barrierDismissible: false, // Disable tapping outside to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: isConnected
                  ? () {
                      Navigator.of(context).pop();
                      _isDialogOpen =
                          false; // Reset flag when dialog is dismissed
                    }
                  : null, // Disable button if not connected
            ),
          ],
        );
      },
    );
  }
}
