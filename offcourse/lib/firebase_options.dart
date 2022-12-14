// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA1lZRwsE6RB-GNYCg3H41GZMdcYw-hjq8',
    appId: '1:71337050623:web:82a72bc8191327cf1be7ca',
    messagingSenderId: '71337050623',
    projectId: 'offcourse-62eae',
    authDomain: 'offcourse-62eae.firebaseapp.com',
    storageBucket: 'offcourse-62eae.appspot.com',
    measurementId: 'G-1H3C5WFNVR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEF8rQbHny8i8-_-POLQjjFZSZOl88LQo',
    appId: '1:71337050623:android:dff2ce62705e58c91be7ca',
    messagingSenderId: '71337050623',
    projectId: 'offcourse-62eae',
    storageBucket: 'offcourse-62eae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdUwsPNwMjMa-XFrDaCPUuNfgaGG3uwDI',
    appId: '1:71337050623:ios:9b86841a3a92c91d1be7ca',
    messagingSenderId: '71337050623',
    projectId: 'offcourse-62eae',
    storageBucket: 'offcourse-62eae.appspot.com',
    iosClientId: '71337050623-1b09ihegbaalgvtda6jqt1997dskh61s.apps.googleusercontent.com',
    iosBundleId: 'com.example.offcourse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAdUwsPNwMjMa-XFrDaCPUuNfgaGG3uwDI',
    appId: '1:71337050623:ios:9b86841a3a92c91d1be7ca',
    messagingSenderId: '71337050623',
    projectId: 'offcourse-62eae',
    storageBucket: 'offcourse-62eae.appspot.com',
    iosClientId: '71337050623-1b09ihegbaalgvtda6jqt1997dskh61s.apps.googleusercontent.com',
    iosBundleId: 'com.example.offcourse',
  );
}
