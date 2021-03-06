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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA2BwttbzFjv1v9U9VDO-zdNeqUGKt7OBw',
    appId: '1:119262863542:web:3210eed8a1f3342ce3c617',
    messagingSenderId: '119262863542',
    projectId: 'app-controle-de-gastos-49d04',
    authDomain: 'app-controle-de-gastos-49d04.firebaseapp.com',
    storageBucket: 'app-controle-de-gastos-49d04.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqVlP9cJebVNvNv87ggeUBLztAl5-Ytfg',
    appId: '1:119262863542:android:2d35a3ca64d548abe3c617',
    messagingSenderId: '119262863542',
    projectId: 'app-controle-de-gastos-49d04',
    storageBucket: 'app-controle-de-gastos-49d04.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_LmdZtYZVUwqVTuaXzOtcErbMs0i5iXs',
    appId: '1:119262863542:ios:898f643e7546208be3c617',
    messagingSenderId: '119262863542',
    projectId: 'app-controle-de-gastos-49d04',
    storageBucket: 'app-controle-de-gastos-49d04.appspot.com',
    iosClientId: '119262863542-ohkb0mo7s6n8ef345at6jeuqf901usu1.apps.googleusercontent.com',
    iosBundleId: 'com.example.projeto',
  );
}
