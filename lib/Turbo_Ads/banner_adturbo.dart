import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdTurbo {
  /// The standard banner (320x50) size.
  static const AdSize banner = AdSize(width: 320, height: 50);

  /// The large banner (320x100) size.
  static const AdSize largeBanner = AdSize(width: 320, height: 100);

  /// The medium rectangle (300x250) size.
  static const AdSize mediumRectangle = AdSize(width: 300, height: 250);

  /// The full banner (468x60) size.
  static const AdSize fullBanner = AdSize(width: 468, height: 60);

  /// The leaderboard (728x90) size.
  static const AdSize leaderboard = AdSize(width: 728, height: 90);

  /// A dynamically sized banner that matches its parent's width and expands/contracts its height to match the ad's content after loading completes.
  static const AdSize fluid = FluidAdSize();

  static AdSize custom({required int width, required int height}) {
    return AdSize(width: width, height: height);
  }

  ///----------------------- BannerAdTurbo ----------------------///
  late BannerAd bannerAd;

  Future<void> loadBannerAdTurbo({
    required String adUnitId,
    required AdSize adSize,
    List<String>? keywords,
    String? contentUrl,
    List<String>? neighboringContentUrls,
    bool? nonPersonalizedAds,
    int? httpTimeoutMillis,
    LocationParams? location,
    String? mediationExtrasIdentifier,
    Map<String, String>? extras,
    AdEventCallback? onAdLoaded,
    AdLoadErrorCallback? onAdFailedToLoad,
    AdEventCallback? onAdOpened,
    AdEventCallback? onAdClosed,
    AdEventCallback? onAdWillDismissScreen,
    AdEventCallback? onAdImpression,
    OnPaidEventCallback? onPaidEvent,
    AdEventCallback? onAdClicked,
  }) async {
    bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: AdRequest(
        keywords: keywords,
        contentUrl: contentUrl,
        neighboringContentUrls: neighboringContentUrls,
        nonPersonalizedAds: nonPersonalizedAds,
        httpTimeoutMillis: httpTimeoutMillis,
        location: location,
        mediationExtrasIdentifier: mediationExtrasIdentifier,
        extras: extras,
      ),
      size: adSize, /// bannerAd size as per need
      listener: BannerAdListener(
        onAdClicked: onAdClicked,
        onPaidEvent: onPaidEvent,
        /// Called when an BannerAd is successfully received.
        onAdLoaded: onAdLoaded,
        /// Called when an BannerAd request failed.
        onAdFailedToLoad: onAdFailedToLoad,
        /// Called when an BannerAd opens an overlay that covers the screen.
        onAdOpened: onAdOpened,
        /// Called when an BannerAd removes an overlay that covers the screen.
        onAdClosed: onAdClosed,
        /// Called when an impression occurs on the BannerAd.
        onAdImpression: onAdImpression,

        /// For iOS only. Called before dismissing a full screen view.
        onAdWillDismissScreen: onAdWillDismissScreen,
      ),
    );
    bannerAd.load();
  }

  Widget? getBannerAdTurbo() {
    return AdWidget(ad: bannerAd);
  }
}
