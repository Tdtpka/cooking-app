// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAnPcLH1RcJwxiosrnNPE8DvXdcqE1wGdk',
    appId: '1:35876415423:web:15d273628ac477f588a30a',
    messagingSenderId: '35876415423',
    projectId: 'cook-recipes-app-db',
    authDomain: 'cook-recipes-app-db.firebaseapp.com',
    storageBucket: 'cook-recipes-app-db.appspot.com',
    measurementId: 'G-5H2FF24NSC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJxM3LedUIDXO6d36dmwMJlR9tsjo57ew',
    appId: '1:35876415423:android:2b52557c9e66056288a30a',
    messagingSenderId: '35876415423',
    projectId: 'cook-recipes-app-db',
    storageBucket: 'cook-recipes-app-db.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCaw-S6EK16UvRM80pU13wh-b0jwihy__E',
    appId: '1:35876415423:ios:1acbc2cecf25d10688a30a',
    messagingSenderId: '35876415423',
    projectId: 'cook-recipes-app-db',
    storageBucket: 'cook-recipes-app-db.appspot.com',
    iosBundleId: 'com.example.nhom17',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCaw-S6EK16UvRM80pU13wh-b0jwihy__E',
    appId: '1:35876415423:ios:1acbc2cecf25d10688a30a',
    messagingSenderId: '35876415423',
    projectId: 'cook-recipes-app-db',
    storageBucket: 'cook-recipes-app-db.appspot.com',
    iosBundleId: 'com.example.nhom17',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAnPcLH1RcJwxiosrnNPE8DvXdcqE1wGdk',
    appId: '1:35876415423:web:303bdcaac260b9a888a30a',
    messagingSenderId: '35876415423',
    projectId: 'cook-recipes-app-db',
    authDomain: 'cook-recipes-app-db.firebaseapp.com',
    storageBucket: 'cook-recipes-app-db.appspot.com',
    measurementId: 'G-KLYM85259P',
  );
}
