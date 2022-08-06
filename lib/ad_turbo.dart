import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
export 'Turbo_Ads/appopenad_adturbo.dart';
export 'Turbo_Ads/banner_adturbo.dart';
export 'Turbo_Ads/interstitial_adturbo.dart';
export 'Turbo_Ads/native_adturbo.dart';
export 'Turbo_Ads/rewarded_adturbo.dart';


class AdTurbo {
  AdTurbo();


  AdTurbo.init(){
    WidgetsFlutterBinding.ensureInitialized();
    MobileAds.instance.initialize();
    invokeAdTurboNative();
  }

  invokeAdTurboNative({String? nativeVideoID}) async{
    const methodChannel = MethodChannel("ad_turbo");
    await methodChannel.invokeMethod("AdTurboNativeAds");
  }

  static Future<void> adTurboTestDevice({required String testDeviceIds}) async{
    MobileAds.instance.updateRequestConfiguration(RequestConfiguration(testDeviceIds: [testDeviceIds]));
  }

  Future loadAllAds() async{
  }
}
