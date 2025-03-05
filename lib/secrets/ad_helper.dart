import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-9834496240469765/4800884626';
    } else if (Platform.isIOS) {
      return '<YOUR_IOS_BANNER_AD_ID>';
    } else {
      print('unsupported platform');
      throw UnsupportedError('Unsupported Platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-9834496240469765/7639635101';
    } else if (Platform.isIOS) {
      return '<YOUR_IOS_BANNER_AD_ID>';
    } else {
      print('unsupported platform');
      throw UnsupportedError('Unsupported Platform');
    }
  }
}
