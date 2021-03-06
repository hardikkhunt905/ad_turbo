import 'package:ad_turbo/Turbo_Ads/rewardedInterstitial_adTurbo.dart';
import 'package:ad_turbo_example/Screen/AdTurboAdHelper.dart';
import 'package:ad_turbo_example/Screen/banner_ad_turbo.dart';
import 'package:flutter/material.dart';

class RewardedInterstitialAdScreen extends StatefulWidget {
  const RewardedInterstitialAdScreen({Key? key}) : super(key: key);

  @override
  State<RewardedInterstitialAdScreen> createState() => _RewardedInterstitialAdScreenState();
}

class _RewardedInterstitialAdScreenState extends State<RewardedInterstitialAdScreen> {

  final _rewardedInterstitialAdTurbo = RewardedInterstitialAdTurbo();
  bool isRewardedInterstitialAdReady = false;

  @override
  void initState(){
    super.initState();
    loadAd();
  }

  loadAd() async{
    await _rewardedInterstitialAdTurbo.loadRewardedInterstitialAdTurbo(adUnitId: AdTurboAdHelper.rewardedInterstitial,
        onAdLoaded: (ad) {
          print('$ad loaded.');
          // Keep a reference to the ad so you can show it later.
          _rewardedInterstitialAdTurbo.rewardedInterstitial = ad;
          isRewardedInterstitialAdReady = true;
        },
        onAdFailedToLoad: (error) {
          isRewardedInterstitialAdReady = false;
          print('RewardedInterstitialAd failed to load: $error');
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

              // TurboRewardedInterstitialAd
              ElevatedButton(onPressed: ()async{
                if(isRewardedInterstitialAdReady){
                  await _rewardedInterstitialAdTurbo.rewardedInterstitial?.show(
                    onUserEarnedReward: (ad, reward) {

                  },);

                  await _rewardedInterstitialAdTurbo.rewardedInterstitialCallback(
                    onAdShowedFullScreenContent: (ad) =>
                        print('%ad onAdShowedFullScreenContent.'),
                    onAdDismissedFullScreenContent: (ad) {
                      print('$ad onAdDismissedFullScreenContent.');
                      ad.dispose();
                      loadAd();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BannerAdScreen()));
                    },
                    onAdFailedToShowFullScreenContent: (ad,error) {
                      print('$ad onAdFailedToShowFullScreenContent: $error');
                      ad.dispose();
                      loadAd();
                    },
                    onAdImpression: (ad) => print('$ad impression occurred.'),
                  );
                } else {
                  return ;
                }
              }, child: const Text("Rewarded InterstitialAd")),


            ],
          ),
        ),
      ),
    );
  }
}
