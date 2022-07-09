import 'package:ad_turbo/Turbo_Ads/native_adTurbo.dart';
import 'package:ad_turbo_example/Screen/AdTurboAdHelper.dart';
import 'package:flutter/material.dart';


class NativeVideoAdScreen extends StatefulWidget {
   NativeVideoAdScreen({Key? key}) : super(key: key);

  @override
  State<NativeVideoAdScreen> createState() => _NativeVideoAdScreenState();
}

class _NativeVideoAdScreenState extends State<NativeVideoAdScreen> {
  bool isNativeSmallAdReady = false;

  final _nativeAdTurbo = NativeAdTurbo();

  @override
  void initState(){
    super.initState();
    loadAd();
  }

  loadAd() async{
    await _nativeAdTurbo.loadNativeVideoAdTurbo(nativeVideoID: AdTurboAdHelper.nativeAdvancedVideoAdUnitId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("NativeVideoAd")),
        body: Column(
          children: [

            Container(height: 310,child:  _nativeAdTurbo.getNativeVideoAdTurbo(context: context))

          ],
        ),
      ),
    );
  }
}
