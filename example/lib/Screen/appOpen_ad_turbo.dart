import 'package:ad_turbo/Turbo_Ads/appOpenAd_adTurbo.dart';
import 'package:ad_turbo_example/Screen/AdTurboAdHelper.dart';
import 'package:ad_turbo_example/Screen/banner_ad_turbo.dart';
import 'package:flutter/material.dart';

class AppOpenAdScreen extends StatefulWidget {
  const AppOpenAdScreen({Key? key}) : super(key: key);

  @override
  State<AppOpenAdScreen> createState() => _AppOpenAdScreenState();
}

class _AppOpenAdScreenState extends State<AppOpenAdScreen> {

  final _appOpenAdTurbo = AppOpenAdTurbo();
  bool isAppOpenAdAdReady = false;

  @override
  void initState(){
    super.initState();
    loadAd();
  }

  loadAd() async{
    await _appOpenAdTurbo.loadAppOpenAdTurbo(
        adUnitId: AdTurboAdHelper.appOpenAdUnitId,
        orientation: AppOpenAdTurbo.orientationPortrait,
      onAdLoaded: (ad) {
        print('$ad loaded');
        _appOpenAdTurbo.appOpenAd = ad;
        isAppOpenAdAdReady = true;
      },
      onAdFailedToLoad: (error) {
        isAppOpenAdAdReady = false;
        print('AppOpenAd failed to load: $error');
        loadAd();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("AppOpenAdTurbo")),
        body: Center(
          child: Column(
            children: [

              // TurboAppOpenAd
              ElevatedButton(onPressed: ()async{
                if(isAppOpenAdAdReady){
                  await _appOpenAdTurbo.appOpenAd?.show();

                  await _appOpenAdTurbo.appOpenCallback(
                    onAdShowedFullScreenContent: (ad) {
                      isAppOpenAdAdReady = true;
                      print('$ad onAdShowedFullScreenContent');
                    },
                    onAdFailedToShowFullScreenContent: (ad, error) {
                      print('$ad onAdFailedToShowFullScreenContent: $error');
                      isAppOpenAdAdReady = false;
                      ad.dispose();
                      _appOpenAdTurbo.appOpenAd = null;
                    },
                    onAdDismissedFullScreenContent: (ad) {
                      print('$ad onAdDismissedFullScreenContent');
                      isAppOpenAdAdReady = false;
                      ad.dispose();
                      _appOpenAdTurbo.appOpenAd = null;
                      loadAd();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => BannerAdScreen()));
                    },
                  );
                } else {
                  return ;
                }
              }, child: const Text("AppOpenAd")),


            ],
          ),
        ),
      ),
    );
  }
}
