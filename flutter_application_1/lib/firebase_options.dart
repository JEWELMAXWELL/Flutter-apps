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
    apiKey: 'AIzaSyAVcmESo-dmjp6n7BR5KpBDnQx65hlvmuA',
    appId: '1:251985543063:web:c6e5e1947902df289f8ed2',
    messagingSenderId: '251985543063',
    projectId: 'ftftfgtg',
    authDomain: 'ftftfgtg.firebaseapp.com',
    storageBucket: 'ftftfgtg.appspot.com',
    measurementId: 'G-47Q81601LQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASKzRS7Zl3UF2OPhxPh8elJM14vTl-nlU',
    appId: '1:251985543063:android:495728c73055e9c09f8ed2',
    messagingSenderId: '251985543063',
    projectId: 'ftftfgtg',
    storageBucket: 'ftftfgtg.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjUiHmQaKXxYbo53horEc_tfIigEW1zyA',
    appId: '1:251985543063:ios:4888fe706d93615c9f8ed2',
    messagingSenderId: '251985543063',
    projectId: 'ftftfgtg',
    storageBucket: 'ftftfgtg.appspot.com',
    iosClientId: '251985543063-u03u36vj4odqcp52gtndjacdomatjqn7.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAjUiHmQaKXxYbo53horEc_tfIigEW1zyA',
    appId: '1:251985543063:ios:480a55d0387944a19f8ed2',
    messagingSenderId: '251985543063',
    projectId: 'ftftfgtg',
    storageBucket: 'ftftfgtg.appspot.com',
    iosClientId: '251985543063-vqv3lr84h9t3rhv6lvckcpme581uq8c3.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}
