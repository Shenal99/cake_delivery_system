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
    apiKey: 'AIzaSyCmRd-8FAIB8bW70aDMliB500DINWx6df4',
    appId: '1:265428194604:web:c0ae27c7aa5eec44598889',
    messagingSenderId: '265428194604',
    projectId: 'cakedeliverysystem',
    authDomain: 'cakedeliverysystem.firebaseapp.com',
    storageBucket: 'cakedeliverysystem.appspot.com',
    measurementId: 'G-H6Y8Z5CF70',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCeDtQArCO9-K_2m7gag3I4fDoOo2AM26Y',
    appId: '1:265428194604:android:5f2b4356136b925c598889',
    messagingSenderId: '265428194604',
    projectId: 'cakedeliverysystem',
    storageBucket: 'cakedeliverysystem.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZyNB7W4wkeZHd155jBJe3qmgLCoHiNaM',
    appId: '1:265428194604:ios:4d508ca7cd291d79598889',
    messagingSenderId: '265428194604',
    projectId: 'cakedeliverysystem',
    storageBucket: 'cakedeliverysystem.appspot.com',
    iosClientId: '265428194604-qc512gilc0b9n2ecmpruba623ib8rolp.apps.googleusercontent.com',
    iosBundleId: 'com.example.cakeDeliverySystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZyNB7W4wkeZHd155jBJe3qmgLCoHiNaM',
    appId: '1:265428194604:ios:4d508ca7cd291d79598889',
    messagingSenderId: '265428194604',
    projectId: 'cakedeliverysystem',
    storageBucket: 'cakedeliverysystem.appspot.com',
    iosClientId: '265428194604-qc512gilc0b9n2ecmpruba623ib8rolp.apps.googleusercontent.com',
    iosBundleId: 'com.example.cakeDeliverySystem',
  );
}
