// File: firebase_options.dart
// GENERATED FILE - DO NOT EDIT MANUALLY

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions không hỗ trợ platform này.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD2RchU9GqNCzSN8LMYYrL4e51Wre2MnFo',
    appId: '1:700852601090:web:5490f69213cb5c72e9c21b',
    messagingSenderId: '700852601090',
    projectId: 'elearning-21de1',
    authDomain: 'elearning-21de1.firebaseapp.com',
    storageBucket: 'elearning-21de1.firebasestorage.app',
    measurementId: 'G-QYQ2WJ5GRK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuddcNH6KBkebGfBeGEgTmqjG6irl9jxM',
    appId: '1:700852601090:android:63bf2737c3705c0de9c21b',
    messagingSenderId: '700852601090',
    projectId: 'elearning-21de1',
    storageBucket: 'elearning-21de1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'YOUR_IOS_API_KEY',
    appId: 'YOUR_IOS_APP_ID',
    messagingSenderId: 'YOUR_SENDER_ID',
    projectId: 'YOUR_PROJECT_ID',
    storageBucket: 'YOUR_BUCKET',
    iosBundleId: 'YOUR_BUNDLE_ID',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'YOUR_MACOS_API_KEY',
    appId: 'YOUR_MACOS_APP_ID',
    messagingSenderId: 'YOUR_SENDER_ID',
    projectId: 'YOUR_PROJECT_ID',
    storageBucket: 'YOUR_BUCKET',
    iosBundleId: 'YOUR_BUNDLE_ID',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD2RchU9GqNCzSN8LMYYrL4e51Wre2MnFo',
    appId: '1:700852601090:web:5ae3978a2275e4b3e9c21b',
    messagingSenderId: '700852601090',
    projectId: 'elearning-21de1',
    authDomain: 'elearning-21de1.firebaseapp.com',
    storageBucket: 'elearning-21de1.firebasestorage.app',
    measurementId: 'G-0FTHQGY8M5',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'YOUR_LINUX_API_KEY',
    appId: 'YOUR_LINUX_APP_ID',
    messagingSenderId: 'YOUR_SENDER_ID',
    projectId: 'YOUR_PROJECT_ID',
    storageBucket: 'YOUR_BUCKET',
  );
}