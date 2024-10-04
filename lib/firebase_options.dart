// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
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
    apiKey: 'AIzaSyAN8tzEudryPqAgFAUi2GH24pKTHLGRUzo',
    appId: '1:683986646240:web:ef5a6a1e51743231784c85',
    messagingSenderId: '683986646240',
    projectId: 'hotelease-e35c1',
    authDomain: 'hotelease-e35c1.firebaseapp.com',
    storageBucket: 'hotelease-e35c1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBTboXeZE2gV6S_e7aUfKAx56hue_XmKg',
    appId: '1:683986646240:android:a69a797a13f50799784c85',
    messagingSenderId: '683986646240',
    projectId: 'hotelease-e35c1',
    storageBucket: 'hotelease-e35c1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_Gi2nsZHGaRsRxEDHtoVUoZaeaA5-XiY',
    appId: '1:683986646240:ios:6d8347c1789c0877784c85',
    messagingSenderId: '683986646240',
    projectId: 'hotelease-e35c1',
    storageBucket: 'hotelease-e35c1.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_Gi2nsZHGaRsRxEDHtoVUoZaeaA5-XiY',
    appId: '1:683986646240:ios:6d8347c1789c0877784c85',
    messagingSenderId: '683986646240',
    projectId: 'hotelease-e35c1',
    storageBucket: 'hotelease-e35c1.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAN8tzEudryPqAgFAUi2GH24pKTHLGRUzo',
    appId: '1:683986646240:web:78a37b646a4d9144784c85',
    messagingSenderId: '683986646240',
    projectId: 'hotelease-e35c1',
    authDomain: 'hotelease-e35c1.firebaseapp.com',
    storageBucket: 'hotelease-e35c1.appspot.com',
  );
}
