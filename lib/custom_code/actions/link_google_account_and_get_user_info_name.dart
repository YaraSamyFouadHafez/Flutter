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

Future<String?> linkGoogleAccountAndGetUserInfoName() async {
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

    // Get user display name
    final String? displayName = googleUser.displayName;

    // Step 3: Create a new Google AuthCredential
    final AuthCredential googleAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Return just the name
    return displayName ?? 'Anonymous';
  } catch (e) {
    print('Error during linking Google Account and fetching user info: $e');
    return null; // Return null if something went wrong
  }
}
