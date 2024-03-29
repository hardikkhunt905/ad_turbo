import 'package:ad_turbo/Turbo_Ads/interstitial_adTurbo.dart';
import 'package:ad_turbo_example/Screen/ad_turbo_helper.dart';
import 'package:ad_turbo_example/Screen/banner_ad_turbo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InterstitialAdScreen extends StatefulWidget {
  const InterstitialAdScreen({Key? key}) : super(key: key);

  @override
  State<InterstitialAdScreen> createState() => _InterstitialAdScreenState();
}

class _InterstitialAdScreenState extends State<InterstitialAdScreen> {
  final _interstitialAdTurbo = InterstitialAdTurbo();
  bool isInterstitialAdReady = false;

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  loadAd() async {
    await _interstitialAdTurbo.loadInterstitialAdTurbo(
        adUnitId: AdTurboAdHelper.interstitialAdUnitId,
        onAdLoaded: (ad) {
          if (kDebugMode) {
            print('$ad loaded.');
          }
          // Keep a reference to the ad so you can show it later.
          _interstitialAdTurbo.interstitialAd = ad;
          isInterstitialAdReady = true;
        },
        onAdFailedToLoad: (error) {
          isInterstitialAdReady = false;
          if (kDebugMode) {
            print('Failed to load an interstitial ad: ${error.message}');
          }
          loadAd();
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("InterstitialAdTurbo")),
        body: Center(
          child: Column(
            children: [
              // TurboInterstitialAd

              ElevatedButton(
                  onPressed: () async {
                    if (isInterstitialAdReady) {
                      await _interstitialAdTurbo.interstitialAd?.show();
                      await _interstitialAdTurbo.interstitialCallback(
                        onAdShowedFullScreenContent: (ad) {
                          if (kDebugMode) {
                            print('$ad onAdShowedFullScreenContent.');
                          }
                        },
                        onAdDismissedFullScreenContent: (ad) {
                          if (kDebugMode) {
                            print('$ad onAdDismissedFullScreenContent.');
                          }
                          ad.dispose();
                          loadAd();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const BannerAdScreen()));
                        },
                        onAdFailedToShowFullScreenContent: (ad, error) {
                          if (kDebugMode) {
                            print(
                                '$ad onAdFailedToShowFullScreenContent: $error');
                          }
                          ad.dispose();
                          loadAd();
                        },
                        onAdImpression: (ad) {
                          if (kDebugMode) {
                            print('$ad impression occurred.');
                          }
                        },
                      );
                    } else {
                      return;
                    }
                  },
                  child: const Text("InterstitialAd")),
            ],
          ),
        ),
      ),
    );
  }
}
