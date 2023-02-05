import 'package:ad_turbo_example/Screen/app_open_ad_turbo.dart';
import 'package:ad_turbo_example/Screen/banner_ad_turbo.dart';
import 'package:ad_turbo_example/Screen/interstitial_ad_turbo.dart';
import 'package:ad_turbo_example/Screen/native_ads_turbo.dart';
import 'package:ad_turbo_example/Screen/rewarded_ad_turbo.dart';
import 'package:ad_turbo_example/Screen/rewarded_interstitial_ad_turbo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: const Text("Turbo Google Ads")),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  //----------------------- BannerAdTurbo ----------------------//

                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BannerAdScreen()));
                      },
                      child: const Text("BannerAd")),

                  //----------------------- InterstitialAdTurbo ----------------------//

                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const InterstitialAdScreen()));
                      },
                      child: const Text("InterstitialAd")),

                  //----------------------- RewardedAd ----------------------//

                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RewardedAdScreen()));
                      },
                      child: const Text("RewardedAd")),

                  //----------------------- RewardedInterstitialAd ----------------------//

                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const RewardedInterstitialAdScreen()));
                      },
                      child: const Text("Rewarded InterstitialAd")),

                  //----------------------- AppOpenAd ----------------------//

                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AppOpenAdScreen()));
                      },
                      child: const Text("AppOpenAd")),

                  //----------------------- NativeAds ----------------------//

                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const NativeAdsScreen()));
                      },
                      child: const Text("NativeAds")),
                ],
              ),
            ),
          )),
    );
  }
}
