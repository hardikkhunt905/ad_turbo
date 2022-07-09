import 'package:ad_turbo/Turbo_Ads/native_adTurbo.dart';
import 'package:ad_turbo_example/Screen/AdTurboAdHelper.dart';
import 'package:flutter/material.dart';

class NativeMediumAdScreen extends StatefulWidget {
  const NativeMediumAdScreen({Key? key}) : super(key: key);

  @override
  State<NativeMediumAdScreen> createState() => _NativeMediumAdScreenState();
}

class _NativeMediumAdScreenState extends State<NativeMediumAdScreen> {

  bool isNativeMediumAdReady = false;
  final _nativeAdTurbo = NativeAdTurbo();

  @override
  void initState() {
    super.initState();
    loadAd();
  }



  loadAd() async{
    await _nativeAdTurbo.loadNativeMediumAdTurbo(
        adUnitId: AdTurboAdHelper.nativeAdvancedAdUnitId,
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          print('Ad loaded.');
          isNativeMediumAdReady = true;
          setState(()=>"");
        },
        // Called when an ad request failed.

        onAdFailedToLoad:(ad, error) {
          isNativeMediumAdReady = false;
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
        appBar: AppBar(title: const Text("NativeMediumAd")),
        body: Column(mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Container(height: 255,child: isNativeMediumAdReady?_nativeAdTurbo.getNativeMediumAdTurbo() :SizedBox.shrink())

          ],
        ),
      ),
    );
  }
}
