
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppOpenAdTurbo{

  AppOpenAd? appOpenAd;

  /// Portrait orientation.
  static const int orientationPortrait = 1;
  /// Landscape orientation left.
  ///
  /// Android does not distinguish between left/right, and will treat this
  /// the same way as [orientationLandscapeRight].
  static const int orientationLandscapeLeft = 2;
  /// Landscape orientation right.
  ///
  /// Android does not distinguish between left/right, and will treat this
  /// the same way as [orientationLandscapeLeft].
  static const int orientationLandscapeRight = 3;

  Future<void> loadAppOpenAdTurbo({
    required String adUnitId,
    required int orientation,
    List<String>? keywords,
    String? contentUrl,
    List<String>? neighboringContentUrls,
    bool? nonPersonalizedAds,
    int? httpTimeoutMillis,
    LocationParams? location,
    String? mediationExtrasIdentifier,
    Map<String, String>? extras,
    required GenericAdEventCallback<AppOpenAd> onAdLoaded,
    required FullScreenAdLoadErrorCallback onAdFailedToLoad,
  }) async{
    AppOpenAd.load(
      adUnitId: adUnitId,
      orientation: orientation,
      request: AdRequest(
          keywords: keywords,
          contentUrl: contentUrl,
          neighboringContentUrls: neighboringContentUrls,
          nonPersonalizedAds: nonPersonalizedAds,
          httpTimeoutMillis: httpTimeoutMillis,
          location: location,
          mediationExtrasIdentifier: mediationExtrasIdentifier,
          extras: extras),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: onAdFailedToLoad,
      ),
    );
  }

  appOpenCallback({
    GenericAdEventCallback<Ad>? onAdShowedFullScreenContent,
    GenericAdEventCallback<Ad>? onAdDismissedFullScreenContent,
    GenericAdEventCallback<Ad>? onAdWillDismissFullScreenContent,
    GenericAdEventCallback<Ad>? onAdImpression,
    GenericAdEventCallback<Ad>? onAdClicked,
    Function(Ad ad, AdError error)?
    onAdFailedToShowFullScreenContent
  }){
    // Set the fullScreenContentCallback and show the ad.
    appOpenAd?.fullScreenContentCallback = FullScreenContentCallback(
        onAdClicked: onAdClicked,
        onAdShowedFullScreenContent: onAdShowedFullScreenContent,
        onAdDismissedFullScreenContent: onAdDismissedFullScreenContent,
        onAdFailedToShowFullScreenContent: onAdFailedToShowFullScreenContent,
        onAdImpression: onAdImpression,

        /// For iOS only. Called before dismissing a full screen view.
        onAdWillDismissFullScreenContent: onAdWillDismissFullScreenContent
    );
  }


}