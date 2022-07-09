
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAdTurbo{
  late NativeAd nativeAdSmall;
  late NativeAd nativeAdMedium;
  static const methodChannel = MethodChannel("ad_turbo");


  Future<void> loadNativeSmallAdTurbo({
    required String adUnitId,
    Map<String, Object>? customOptions,
    List<String>? keywords,
    String? contentUrl,
    List<String>? neighboringContentUrls,
    bool? nonPersonalizedAds,
    int? httpTimeoutMillis,
    LocationParams? location,
    String? mediationExtrasIdentifier,
    Map<String, String>? extras,
    AdEventCallback? onAdLoaded,
    Function(Ad ad, LoadAdError error)? onAdFailedToLoad,
    AdEventCallback? onAdOpened,
    AdEventCallback? onAdWillDismissScreen,
    AdEventCallback? onAdClosed,
    AdEventCallback? onAdImpression,
    AdEventCallback? onAdClicked,
    OnPaidEventCallback? onPaidEvent,
    NativeAdOptions? nativeAdOptions,
    Function(NativeAd ad)? onNativeAdClicked}) async{
    nativeAdSmall = NativeAd(
      adUnitId: adUnitId,
      customOptions: customOptions,
      nativeAdOptions: nativeAdOptions,
      factoryId: 'adTurboNativeSmall',
      request: AdRequest(
          keywords: keywords,
          contentUrl: contentUrl,
          neighboringContentUrls: neighboringContentUrls,
          nonPersonalizedAds: nonPersonalizedAds,
          httpTimeoutMillis: httpTimeoutMillis,
          location: location,
          mediationExtrasIdentifier: mediationExtrasIdentifier,
          extras: extras),
      listener: NativeAdListener(
          onNativeAdClicked: onNativeAdClicked,
          onAdOpened: onAdOpened,
          onAdImpression: onAdImpression,
          onAdWillDismissScreen: onAdWillDismissScreen,
          onAdClosed: onAdClosed,
          onPaidEvent: onPaidEvent,
          onAdClicked: onAdClicked,
          onAdLoaded: onAdLoaded,
          onAdFailedToLoad: onAdFailedToLoad
      ),
    );

    nativeAdSmall.load();
  }


  Future<void> loadNativeMediumAdTurbo({
    required String adUnitId,
    Map<String, Object>? customOptions,
    List<String>? keywords,
    String? contentUrl,
    List<String>? neighboringContentUrls,
    bool? nonPersonalizedAds,
    int? httpTimeoutMillis,
    LocationParams? location,
    String? mediationExtrasIdentifier,
    Map<String, String>? extras,
    AdEventCallback? onAdLoaded,
    Function(Ad ad, LoadAdError error)? onAdFailedToLoad,
    AdEventCallback? onAdOpened,
    AdEventCallback? onAdWillDismissScreen,
    AdEventCallback? onAdClosed,
    AdEventCallback? onAdImpression,
    AdEventCallback? onAdClicked,
    OnPaidEventCallback? onPaidEvent,
    NativeAdOptions? nativeAdOptions,
    Function(NativeAd ad)? onNativeAdClicked}) async {
    nativeAdMedium = NativeAd(
      adUnitId: adUnitId,
      customOptions: customOptions,
      nativeAdOptions: nativeAdOptions,
      factoryId: 'adTurboNativeMedium',
      request: AdRequest(
          keywords: keywords,
          contentUrl: contentUrl,
          neighboringContentUrls: neighboringContentUrls,
          nonPersonalizedAds: nonPersonalizedAds,
          httpTimeoutMillis: httpTimeoutMillis,
          location: location,
          mediationExtrasIdentifier: mediationExtrasIdentifier,
          extras: extras),
      listener: NativeAdListener(
          onNativeAdClicked: onNativeAdClicked,
          onAdOpened: onAdOpened,
          onAdImpression: onAdImpression,
          onAdWillDismissScreen: onAdWillDismissScreen,
          onAdClosed: onAdClosed,
          onPaidEvent: onPaidEvent,
          onAdClicked: onAdClicked,
          onAdLoaded: onAdLoaded,
          onAdFailedToLoad: onAdFailedToLoad
      ),
    );
    nativeAdMedium.load();

  }


  Future<void> loadNativeVideoAdTurbo({required String nativeVideoID}) async {
    const methodChannel = MethodChannel("ad_turbo");
    Map<String, String> nativeID = {"nativeVideoID": nativeVideoID};
    await methodChannel.invokeMethod("AdTurboNativeVideoAds",nativeID);
  }

  Widget getNativeMediumAdTurbo(){
    return AdWidget(ad: nativeAdMedium);
  }


  Widget? getNativeSmallAdTurbo(){
    return AdWidget(ad: nativeAdSmall);
  }


  Widget getNativeVideoAdTurbo({
    Key? key,
    required BuildContext context,
    PlatformViewCreatedCallback? onPlatformViewCreated,
    Clip? clipBehavior,
    Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers,
    PlatformViewHitTestBehavior? hitTestBehavior,
    TextDirection? layoutDirection
  }) {
    const String viewType = 'adTurboNativeVideo';
    final Map<String, dynamic> creationParams = <String, dynamic>{};
    return AndroidView(
      onPlatformViewCreated:onPlatformViewCreated,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
      gestureRecognizers: gestureRecognizers,
      hitTestBehavior: hitTestBehavior ?? PlatformViewHitTestBehavior.opaque,
      layoutDirection: layoutDirection,
      key: key,
      viewType: viewType,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }

}