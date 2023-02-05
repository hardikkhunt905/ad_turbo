import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedInterstitialAdTurbo {
  RewardedInterstitialAd? rewardedInterstitial;

  Future<void> loadRewardedInterstitialAdTurbo({
    required String adUnitId,
    List<String>? keywords,
    String? contentUrl,
    List<String>? neighboringContentUrls,
    bool? nonPersonalizedAds,
    int? httpTimeoutMillis,
    String? mediationExtrasIdentifier,
    Map<String, String>? extras,
    required GenericAdEventCallback<RewardedInterstitialAd> onAdLoaded,
    required FullScreenAdLoadErrorCallback onAdFailedToLoad,
  }) async {
    RewardedInterstitialAd.load(
        adUnitId: adUnitId,
        request: AdRequest(
            keywords: keywords,
            contentUrl: contentUrl,
            neighboringContentUrls: neighboringContentUrls,
            nonPersonalizedAds: nonPersonalizedAds,
            httpTimeoutMillis: httpTimeoutMillis,
            mediationExtrasIdentifier: mediationExtrasIdentifier,
            extras: extras),
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
            onAdLoaded: onAdLoaded, onAdFailedToLoad: onAdFailedToLoad));
  }

  Future<void> rewardedInterstitialCallback(
      {GenericAdEventCallback<Ad>? onAdShowedFullScreenContent,
      GenericAdEventCallback<Ad>? onAdDismissedFullScreenContent,
      GenericAdEventCallback<Ad>? onAdWillDismissFullScreenContent,
      GenericAdEventCallback<Ad>? onAdImpression,
      GenericAdEventCallback<Ad>? onAdClicked,
      Function(Ad ad, AdError error)?
          onAdFailedToShowFullScreenContent}) async {
    rewardedInterstitial?.fullScreenContentCallback = FullScreenContentCallback(
        onAdClicked: onAdClicked,
        onAdShowedFullScreenContent: onAdShowedFullScreenContent,
        onAdDismissedFullScreenContent: onAdDismissedFullScreenContent,
        onAdFailedToShowFullScreenContent: onAdFailedToShowFullScreenContent,
        onAdImpression: onAdImpression,

        /// For iOS only. Called before dismissing a full screen view.
        onAdWillDismissFullScreenContent: onAdWillDismissFullScreenContent);
  }
}
