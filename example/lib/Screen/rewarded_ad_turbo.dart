import 'package:ad_turbo/Turbo_Ads/rewarded_adTurbo.dart';
import 'package:ad_turbo_example/Screen/ad_turbo_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RewardedAdScreen extends StatefulWidget {
  const RewardedAdScreen({Key? key}) : super(key: key);

  @override
  State<RewardedAdScreen> createState() => _RewardedAdScreenState();
}

class _RewardedAdScreenState extends State<RewardedAdScreen> {
  final _rewardedAdTurbo = RewardedAdTurbo();
  bool isRewardedAdReady = false;

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  loadAd() async {
    await _rewardedAdTurbo.loadRewardedAdTurbo(
        adUnitId: AdTurboAdHelper.rewardedAdUnitId,
        onAdLoaded: (ad) {
          if (kDebugMode) {
            print('$ad loaded.');
          }
          // Keep a reference to the ad so you can show it later.
          _rewardedAdTurbo.rewardedAd = ad;
          isRewardedAdReady = true;
        },
        onAdFailedToLoad: (error) {
          isRewardedAdReady = false;
          if (kDebugMode) {
            print('RewardedAd failed to load: $error');
          }
          loadAd();
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("RewardedAdTurbo")),
        body: Center(
          child: Column(
            children: [
              // TurboRewardedAd
              ElevatedButton(
                  onPressed: () async {
                    if (isRewardedAdReady) {
                      await _rewardedAdTurbo.rewardedAd.show(
                        onUserEarnedReward: (ad, reward) {
                          //You can do your work here!!

                          final snackBar = SnackBar(
                            content: Text(
                                "Yay!! you have been rewarded with ${reward.amount.toString()} points"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      );

                      await _rewardedAdTurbo.rewardedCallback(
                        onAdShowedFullScreenContent: (ad) {
                          if (kDebugMode) {
                            print('%ad onAdShowedFullScreenContent.');
                          }
                        },
                        onAdDismissedFullScreenContent: (ad) {
                          if (kDebugMode) {
                            print('$ad onAdDismissedFullScreenContent.');
                          }
                          ad.dispose();
                          loadAd();
                          //You can do your work here!!
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
                  child: const Text("RewardedAd")),
            ],
          ),
        ),
      ),
    );
  }
}
