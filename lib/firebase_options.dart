import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return const FirebaseOptions(
        apiKey: "AIzaSyAB3FERxtDHebyYGBj17kV3nw-RrTyzWEI",
        authDomain: "project-61cc9.firebaseapp.com",
        databaseURL: "https://project-61cc9-default-rtdb.firebaseio.com",
        projectId: "project-61cc9",
        storageBucket: "project-61cc9.appspot.com",
        messagingSenderId: "118914551340",
        appId: "1:118914551340:web:3dd9957a4c02574c678b89",
        measurementId: "G-B7G3DPQXNM",
      );
    } else {
      // Use Android options

      return const FirebaseOptions(
        apiKey: "AIzaSyAB3FERxtDHebyYGBj17kV3nw-RrTyzWEI",
        authDomain: "project-61cc9.firebaseapp.com",
        databaseURL: "https://project-61cc9-default-rtdb.firebaseio.com",
        projectId: "project-61cc9",
        storageBucket: "project-61cc9.appspot.com",
        messagingSenderId: "118914551340",
        appId: "1:118914551340:web:3dd9957a4c02574c678b89",
        measurementId: "G-B7G3DPQXNM",
      );
    }
  }
}