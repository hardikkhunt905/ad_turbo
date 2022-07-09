
import 'dart:io' show Platform;

class AdTurboAdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/6300978111";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/2934735716";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get appOpenAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/3419835294";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/5662855259";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialVideoAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/8691691433";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/5135589807";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/5224354917";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedInterstitial {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/5354046379";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/6978759866";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get nativeAdvancedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/2247696110";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/3986624511";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get nativeAdvancedVideoAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1044960115";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/2521693316";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}