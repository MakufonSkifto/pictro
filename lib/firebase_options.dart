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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFhULZXuYHYejdWxmKvtROBbXYSyHuHY0',
    appId: '1:229616784662:android:b0369934301cd2696cec37',
    messagingSenderId: '229616784662',
    projectId: 'scribble-98cba',
    databaseURL: 'https://scribble-98cba-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'scribble-98cba.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBACWpW9Dt5fw1GrfCoEAfrT6thCR--Jps',
    appId: '1:229616784662:ios:75f7167dd106332f6cec37',
    messagingSenderId: '229616784662',
    projectId: 'scribble-98cba',
    databaseURL: 'https://scribble-98cba-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'scribble-98cba.appspot.com',
    iosClientId: '229616784662-4bnlmop2bunnk368vstc1m5rigi17vuj.apps.googleusercontent.com',
    iosBundleId: 'com.emirs.pictro',
  );
}
