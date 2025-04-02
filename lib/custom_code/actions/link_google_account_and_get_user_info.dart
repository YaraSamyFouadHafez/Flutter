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
import 'package:google_sign_in/google_sign_in.dart';

Future<String?> linkGoogleAccountAndGetUserInfo() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  try {
    // Step 1: Trigger the Google Sign In process
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      // The user canceled the sign-in
      return null;
    }

    // Step 2: Obtain the GoogleSignInAuthentication object
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Get user email address
    final String email = googleUser.email;

    // Step 3: Create a new Google AuthCredential
    final AuthCredential googleAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Step 4: Link Google AuthCredential to the current anonymous user
    UserCredential userCredential =
        await _auth.currentUser!.linkWithCredential(googleAuthCredential);
    print('Successfully linked Google Account with Anonymous User.');

    // If the process reaches here, the linking was successful
    // You can add any other code you want to execute on successful linking here

    return email;
  } catch (e) {
    print('Error during linking Google Account and fetching user info: $e');
    return null; // Return null if something went wrong
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
