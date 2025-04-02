import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDsxWroA35Oskvvgwk9O92Yc7TWAVPlWnw",
            authDomain: "christian-unity-mission.firebaseapp.com",
            projectId: "christian-unity-mission",
            storageBucket: "christian-unity-mission.appspot.com",
            messagingSenderId: "497035206886",
            appId: "1:497035206886:web:38716d74ec39d21d649b27",
            measurementId: "G-9466Z9EDT5"));
  } else {
    await Firebase.initializeApp();
  }
}
