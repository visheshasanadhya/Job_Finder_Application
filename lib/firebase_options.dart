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
    apiKey: 'AIzaSyDtA-Fcx8gd0kzYSYBroar0es8un-XyNCk',
    appId: '1:475841814007:web:5f28f48ba3bcfd8385e2f2',
    messagingSenderId: '475841814007',
    projectId: 'job-finder-app-45a09',
    authDomain: 'job-finder-app-45a09.firebaseapp.com',
    storageBucket: 'job-finder-app-45a09.appspot.com',
    measurementId: 'G-J45F54FYQT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOBVTnuJDW7_lhYZYQ8FjkEynmnf_6ijI',
    appId: '1:475841814007:android:be07504b943bd21b85e2f2',
    messagingSenderId: '475841814007',
    projectId: 'job-finder-app-45a09',
    storageBucket: 'job-finder-app-45a09.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtqDCjx3UG6vRRy6NT9Zsq6Wb9Ma8TPv4',
    appId: '1:475841814007:ios:78e8dcaa6fcd36ac85e2f2',
    messagingSenderId: '475841814007',
    projectId: 'job-finder-app-45a09',
    storageBucket: 'job-finder-app-45a09.appspot.com',
    iosBundleId: 'com.example.jobFinderApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBtqDCjx3UG6vRRy6NT9Zsq6Wb9Ma8TPv4',
    appId: '1:475841814007:ios:78e8dcaa6fcd36ac85e2f2',
    messagingSenderId: '475841814007',
    projectId: 'job-finder-app-45a09',
    storageBucket: 'job-finder-app-45a09.appspot.com',
    iosBundleId: 'com.example.jobFinderApplication',
  );
}
