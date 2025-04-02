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

import 'package:firebase_auth/firebase_auth.dart';

Future<void> linkEmailAndPassword(String email, String password) async {
  final FirebaseAuth auth = FirebaseAuth.instance;

  try {
    // Create an AuthCredential object with the email address and password
    AuthCredential emailCredential =
        EmailAuthProvider.credential(email: email, password: password);

    // Link email and password credential to the anonymous user
    await auth.currentUser!
        .linkWithCredential(emailCredential)
        .then((UserCredential cred) {
      print("Successfully linked email and password");
    }).catchError((error) {
      print("Failed to link email and password: $error");
    });
  } catch (e) {
    print("Error during account linking: $e");
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
