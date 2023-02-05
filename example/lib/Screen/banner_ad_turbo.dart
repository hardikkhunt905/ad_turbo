import 'dart:developer';
import 'package:ad_turbo/Turbo_Ads/banner_adTurbo.dart';
import 'package:ad_turbo_example/Screen/ad_turbo_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BannerAdScreen extends StatefulWidget {
  const BannerAdScreen({Key? key}) : super(key: key);

  @override
  State<BannerAdScreen> createState() => _BannerAdScreenState();
}

class _BannerAdScreenState extends State<BannerAdScreen> {
  final _bannerAdTurbo = BannerAdTurbo();
  bool isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
    loadBanner();
  }

  loadBanner() async {
    await _bannerAdTurbo.loadBannerAdTurbo(
        adUnitId: AdTurboAdHelper.bannerAdUnitId,
        // Called when an TurboBannerAd is successfully received.
        onAdLoaded: (ad) {
          log("ad_turbo_plugin : TurboBannerAd loaded");
          isBannerAdReady = true;
          setState(() {});
        },
        // Called when an TurboBannerAd request failed.
        onAdFailedToLoad: (ad, error) {
          // Dispose the TurboBannerAd here to free resources.
          isBannerAdReady = false;
          ad.dispose();
          if (kDebugMode) {
            print('TurboBannerAd failed to load: $error');
          }
          loadBanner();
        },
        // Called when an TurboBannerAd opens an overlay that covers the screen.
        onAdOpened: (ad) {
          if (kDebugMode) {
            print('TurboBannerAd opened.');
          }
        },

        // Called when an TurboBannerAd removes an overlay that covers the screen.
        onAdClosed: (ad) {
          if (kDebugMode) {
            print('TurboBannerAd closed.');
          }
        },

        // Called when an impression occurs on the TurboBannerAd.
        onAdImpression: (ad) {
          if (kDebugMode) {
            print('TurboBannerAd impression.');
          }
        },
        adSize: BannerAdTurbo.banner);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("BannerAdTurbo")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: const [
                // Your widgets
              ],
            ),

            // TurboBannerAd
            if (isBannerAdReady)
              SizedBox(height: 50, child: _bannerAdTurbo.getBannerAdTurbo())
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
