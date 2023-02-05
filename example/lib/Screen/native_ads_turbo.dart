import 'package:ad_turbo_example/Screen/native_medium_ad_turbo.dart';
import 'package:ad_turbo_example/Screen/native_small_ad_turbo.dart';
import 'package:ad_turbo_example/Screen/native_video_ad_turbo.dart';
import 'package:flutter/material.dart';

class NativeAdsScreen extends StatelessWidget {
  const NativeAdsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("NativeAds")),
        body: Center(
          child: Column(
            children: [

              const SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NativeSmallAdScreen()));
              }, child: const Text("Native SmallAd")),


              const SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NativeMediumAdScreen()));
              }, child: const Text("NativeMediumAd")),


              const SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NativeVideoAdScreen()));
              }, child: const Text("NativeVideoAdScreen")),

            ],
          ),
        ),
      ),
    );
  }
}