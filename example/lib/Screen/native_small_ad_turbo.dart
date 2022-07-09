import 'package:ad_turbo/Turbo_Ads/native_adTurbo.dart';
import 'package:ad_turbo_example/Screen/AdTurboAdHelper.dart';
import 'package:flutter/material.dart';

class NativeSmallAdScreen extends StatefulWidget {
  const NativeSmallAdScreen({Key? key}) : super(key: key);

  @override
  State<NativeSmallAdScreen> createState() => _NativeBannerAdScreenState();
}

class _NativeBannerAdScreenState extends State<NativeSmallAdScreen> {

  bool isNativeSmallAdReady = false;
  final _nativeAdTurbo = NativeAdTurbo();

  @override
  void initState() {
    super.initState();
    loadAd();
  }


  loadAd() async{
    await _nativeAdTurbo.loadNativeSmallAdTurbo(
      adUnitId: AdTurboAdHelper.nativeAdvancedAdUnitId,
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          print('Ad loaded.');
          isNativeSmallAdReady = true;
          setState(()=>"");
        },
        // Called when an ad request failed.

        onAdFailedToLoad:(ad, error) {
          isNativeSmallAdReady = false;
          // Dispose the ad here to free resources.
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
          loadAd();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (ad) => print('Ad opened.'),
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (ad) => print('Ad closed.'),
        // Called when an impression occurs on the ad.
        onAdImpression: (ad) => print('Ad impression.'),
        // Called when a click is recorded for a NativeAd.
        onNativeAdClicked: (ad) => print('Ad clicked.'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("NativeSmallAd")),
        body: Column(mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Container(height: 102,child: isNativeSmallAdReady?_nativeAdTurbo.getNativeSmallAdTurbo() :SizedBox.shrink())

          ],
        ),
      ),
    );
  }
}
