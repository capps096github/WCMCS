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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAH-JWnXtIktk7dHVTOYXR8c6weZtYirps',
    appId: '1:435986900921:web:48baa709038e0060553868',
    messagingSenderId: '435986900921',
    projectId: 'mukfpl',
    authDomain: 'mukfpl.firebaseapp.com',
    storageBucket: 'mukfpl.appspot.com',
    measurementId: 'G-1F7FQDLT6Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSRjAn5Z6I1edFUbNhL4fb0OSR6yWfb0M',
    appId: '1:435986900921:android:fe262fc095afb69b553868',
    messagingSenderId: '435986900921',
    projectId: 'mukfpl',
    storageBucket: 'mukfpl.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAH-JWnXtIktk7dHVTOYXR8c6weZtYirps',
    appId: '1:435986900921:web:32eec210e5eaa79c553868',
    messagingSenderId: '435986900921',
    projectId: 'mukfpl',
    authDomain: 'mukfpl.firebaseapp.com',
    storageBucket: 'mukfpl.appspot.com',
    measurementId: 'G-ZH2L7S5DL2',
  );
}