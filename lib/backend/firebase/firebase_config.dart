import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA2Cc0ttRg7GltB0eWavR9KK3bFFczkG7s",
            authDomain: "evi-finance-prod.firebaseapp.com",
            projectId: "evi-finance-prod",
            storageBucket: "evi-finance-prod.appspot.com",
            messagingSenderId: "1086289327978",
            appId: "1:1086289327978:web:b30d6de25411ab20e5d713",
            measurementId: "G-R4HNMVNJ6M"));
  } else {
    await Firebase.initializeApp();
  }
}
