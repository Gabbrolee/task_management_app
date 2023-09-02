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
    apiKey: 'AIzaSyBYymGtvIg0LJqQ9ouHBZQxyVRc6PoYdUo',
    appId: '1:487798574199:web:a3f82502fcb07f9cacca72',
    messagingSenderId: '487798574199',
    projectId: 'task-management-app-7b85f',
    authDomain: 'task-management-app-7b85f.firebaseapp.com',
    storageBucket: 'task-management-app-7b85f.appspot.com',
    measurementId: 'G-X8SB1RMGX1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCb3pFFY8KDTerwbhSpu20NpmSOgR4hlH0',
    appId: '1:487798574199:android:6ecc62b78004dd28acca72',
    messagingSenderId: '487798574199',
    projectId: 'task-management-app-7b85f',
    storageBucket: 'task-management-app-7b85f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlqsUGtfZlThKvo91NHSqjjGodBpEw5CU',
    appId: '1:487798574199:ios:34ccff203174ca5bacca72',
    messagingSenderId: '487798574199',
    projectId: 'task-management-app-7b85f',
    storageBucket: 'task-management-app-7b85f.appspot.com',
    iosClientId: '487798574199-rq6ourguhokm7p4vumu9h57cnitrbm1t.apps.googleusercontent.com',
    iosBundleId: 'com.example.taskManagementApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBlqsUGtfZlThKvo91NHSqjjGodBpEw5CU',
    appId: '1:487798574199:ios:34ccff203174ca5bacca72',
    messagingSenderId: '487798574199',
    projectId: 'task-management-app-7b85f',
    storageBucket: 'task-management-app-7b85f.appspot.com',
    iosClientId: '487798574199-rq6ourguhokm7p4vumu9h57cnitrbm1t.apps.googleusercontent.com',
    iosBundleId: 'com.example.taskManagementApp',
  );
}
