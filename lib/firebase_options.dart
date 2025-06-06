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
    apiKey: 'AIzaSyCLDSu1rom-gtFsAHwrBHwMYiQljHZ66Xs',
    appId: '1:367018147964:web:ea8406a7a413d71b25c9f9',
    messagingSenderId: '367018147964',
    projectId: 'chatapp-110ad',
    authDomain: 'chatapp-110ad.firebaseapp.com',
    storageBucket: 'chatapp-110ad.appspot.com',
    measurementId: 'G-DB5T8R0DC6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCk4pbmZvi6XN8MiQZd5MgM67Ql-JDBE3g',
    appId: '1:367018147964:android:1e80180e0d32045b25c9f9',
    messagingSenderId: '367018147964',
    projectId: 'chatapp-110ad',
    storageBucket: 'chatapp-110ad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDt6zCY7AEZ2Rh44DGqtIp0L2e2t1xNcMA',
    appId: '1:367018147964:ios:bfc6249afdd7976e25c9f9',
    messagingSenderId: '367018147964',
    projectId: 'chatapp-110ad',
    storageBucket: 'chatapp-110ad.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDt6zCY7AEZ2Rh44DGqtIp0L2e2t1xNcMA',
    appId: '1:367018147964:ios:ea59bbe0a07ab2a125c9f9',
    messagingSenderId: '367018147964',
    projectId: 'chatapp-110ad',
    storageBucket: 'chatapp-110ad.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
