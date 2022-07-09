import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdTurbo {
  late RewardedAd rewardedAd;

  Future<void> loadRewardedAdTurbo({
    required String adUnitId,
    List<String>? keywords,
    String? contentUrl,
    List<String>? neighboringContentUrls,
    bool? nonPersonalizedAds,
    int? httpTimeoutMillis,
    LocationParams? location,
    String? mediationExtrasIdentifier,
    Map<String, String>? extras,
    required GenericAdEventCallback<RewardedAd> onAdLoaded,
    required FullScreenAdLoadErrorCallback onAdFailedToLoad,
  }) async {

    RewardedAd.load(
      adUnitId: adUnitId,
      request: AdRequest(
          keywords: keywords,
          contentUrl: contentUrl,
          neighboringContentUrls: neighboringContentUrls,
          nonPersonalizedAds: nonPersonalizedAds,
          httpTimeoutMillis: httpTimeoutMillis,
          location: location,
          mediationExtrasIdentifier: mediationExtrasIdentifier,
          extras: extras),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: onAdFailedToLoad,
      ),
    );
  }

  Future<void> rewardedCallback(
      {GenericAdEventCallback<Ad>? onAdShowedFullScreenContent,
        GenericAdEventCallback<Ad>? onAdDismissedFullScreenContent,
        GenericAdEventCallback<Ad>? onAdWillDismissFullScreenContent,
        GenericAdEventCallback<Ad>? onAdImpression,
        GenericAdEventCallback<Ad>? onAdClicked,
        Function(Ad ad, AdError error)?
        onAdFailedToShowFullScreenContent}) async {
    rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdClicked: onAdClicked,
        onAdShowedFullScreenContent: onAdShowedFullScreenContent,
        onAdDismissedFullScreenContent: onAdDismissedFullScreenContent,
        onAdFailedToShowFullScreenContent: onAdFailedToShowFullScreenContent,
        onAdImpression: onAdImpression,

        /// For iOS only. Called before dismissing a full screen view.
        onAdWillDismissFullScreenContent: onAdWillDismissFullScreenContent);
  }
}
