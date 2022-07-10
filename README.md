# ad_turbo
ad_turbo Implements Google Ads, Easy and Turbo Way, supporting All Type of Google Ads,Native Ads(Android),Banner,App Open,Interstitial,AppOpen,Rewarded,Rewarded Interstitial and NativeVideo(Android) into Flutter App.


**Show some 💙, 👍 the package & ⭐️ the repo to support the project**

To easily integrate ads into your flutter app.

# Features

## Google Mobile Ads
- banner Ad
- interstitial Ad
- rewarded Ad
- rewarded interstitial Ad
- app open Ad
- native small Ad, native Ad, native video(Android Only)


# Installation
- Add this dependencies to your pubspec.yaml file:

```yaml

dependencies:
  ad_turbo: "<LATEST_VERSION>"

```


## Platform Specific Setup

## Android

#### Set minSdkVersion 19 to \android\app\build.gradle:

```gradle
android {
    defaultConfig {   
        MinSdkVersion 19
    }                 
   }
```

#### App requires Multidex support
#### Set multiDexEnabled true to \android\app\build.gradle:

```gradle
android {
    defaultConfig {   
        multiDexEnabled true
    }                 
   }
```

#### Update AndroidManifest.xml

##### In your app's /android/app/src/main/AndroidManifest.xml file,add this.
```xml
<manifest>
    <application>
         <!-- Sample AdMob app ID: ca-app-pub-3940256099942544~3347511713 -->
       <meta-data
           android:name="com.google.android.gms.ads.APPLICATION_ID"
           android:value="ca-app-pub-3940256099942544~3347511713"/>
    </application>
</manifest>
```
##### This is a test id you need to ad your admob id for real ads at android:value="ca-app-pub-xxxxxxxxxxxxxxxx~yyyyyyyyyy"
The AdMob App ID must be included in the AndroidManifest.xml. Failure to do so will result in a crash on launch of an app.


## IOS

### Update your Info.plist

##### In your app's ios/Runner/Info.plist file,add a GADApplicationIdentifier key with a string value of your AdMob app ID

```xml
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-3940256099942544~3347511713</string>
```                   

##### This is a test id you need to ad your admob id for real ads at <string>ca-app-pub-xxxxxxxxxxxxxxxx~yyyyyyyyyy</string>


See [this guide](https://developers.google.com/admob/flutter/quick-start) for more information about configuring Integrating the Google Mobile Ads SDK into a Flutter app.


# Documentation

## ad_turbo implementation


### Initialize the plugin 

You need to ad this in your `main` Fucnction For implementation plugin ads into your app's main.dart file : 

```dart
import 'package:ad_turbo/ad_turbo.dart';

void main() {
  adTurbo();
  runApp(const MyApp());
}

adTurbo() async{
  await AdTurbo.init();
  await AdTurbo.adTurboTestDevice(testDeviceIds: "BC754A812958EE7FF20599662417762B");
}
```


### AdHelper

You can create adhelper for plateform spacific google mob id "

```dart
import 'dart:io' show Platform;

class AdTurboAdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/6300978111";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/2934735716";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get appOpenAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/3419835294";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/5662855259";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
 }
```
#### For more detail On How to spacify AdHelper Check Example of ad_turbo AdTurboAdHelper [here](https://github.com/hardikkhunt905/ad_turbo/blob/main/example/lib/Screen/AdTurboAdHelper.dart).


### Banner Ad

####- For implement banner Ad You need to initialize `BannerAdTurbo`

```dart
 final _bannerAdTurbo = BannerAdTurbo();
```

####- For load banner Ad there is Function `loadBannerAdTurbo` :

```dart
   loadAd() async{
    await _bannerAdTurbo.loadBannerAdTurbo(
        adUnitId: AdTurboAdHelper.bannerAdUnitId);
        }
```

####- after load banner you can get bannerAd with this :
- banner Ad will get as widget

```dart
_bannerAdTurbo.getBannerAdTurbo();

```

#### For more detail On How to Implement BannerAd Check Example of ad_turbo bannerAd [here](https://github.com/hardikkhunt905/ad_turbo/blob/main/example/lib/Screen/banner_ad_turbo.dart).


### Interstitial Ad

####- For implement interstitial Ad You need to initialize `InterstitialAdTurbo`

```dart
 final _interstitialAdTurbo = InterstitialAdTurbo();
```

####- For load interstitial Ad there is Function `loadInterstitialAdTurbo` :

```dart
   loadAd() async{
    await _interstitialAdTurbo.loadInterstitialAdTurbo(
            adUnitId: AdTurboAdHelper.interstitialAdUnitId);
        }
```

####- after load interstitial you can get interstitial Ad with this function :
- interstitial can open with onClick
- you can also get callback functions of interstital Ad

```dart
ElevatedButton(onPressed: ()async{

          await _interstitialAdTurbo.interstitialAd?.show();
          await _interstitialAdTurbo.interstitialCallback();
      },
      
child: const Text("InterstitialAd")),
```

#### For more detail On How to Implement Interstitial Ad Check Example of ad_turbo interstitialAd [here](https://github.com/hardikkhunt905/ad_turbo/blob/main/example/lib/Screen/interstitial_ad_turbo.dart).


### Rewarded Ad

####- For implement Rewarded Ad You need to initialize `RewardedAdTurbo`

```dart

   final _rewardedAdTurbo = RewardedAdTurbo();

```

####- For load Rewarded Ad there is Function `loadRewardedAdTurbo` :

```dart
   loadAd() async{
    await _rewardedAdTurbo.loadRewardedAdTurbo(
            adUnitId: AdTurboAdHelper.rewardedAdUnitId);
        }
```

####- after load Rewarded you can get Rewarded Ad with this function :
- Rewarded can open with onClick
- you can also get callback functions of Rewarded Ad

```dart
ElevatedButton(onPressed: ()async{

          await _rewardedAdTurbo.rewardedAd.show();
          await _rewardedAdTurbo.rewardedCallback();
      },
      
child: const Text("RewardedAd")),
```

#### For more detail On How to Implement Rewarded Ad Check Example of ad_turbo RewardedAd [here]
(https://github.com/hardikkhunt905/ad_turbo/blob/main/example/lib/Screen/rewarded_ad_turbo.dart).


### RewardedInterstitial Ad

####- For implement RewardedInterstitial Ad You need to initialize `RewardedInterstitialAdTurbo`

```dart

  final _rewardedInterstitialAdTurbo = RewardedInterstitialAdTurbo();

```

####- For load RewardedInterstitial Ad there is Function `loadRewardedInterstitialAdTurbo` :

```dart
   loadAd() async{
    await _rewardedInterstitialAdTurbo.loadRewardedInterstitialAdTurbo
			(adUnitId: AdTurboAdHelper.rewardedInterstitial);
        }
```

####- after load RewardedInterstitial you can get RewardedInterstitial Ad with this function :
- RewardedInterstitial can open with onClick
- you can also get callback functions of RewardedInterstitial Ad

```dart
ElevatedButton(onPressed: ()async{

          _rewardedInterstitialAdTurbo.rewardedInterstitial?.show();
          await _rewardedInterstitialAdTurbo.rewardedInterstitialCallback();
      },
      
child: const Text("RewardedInterstitialAd")),
```

#### For more detail On How to Implement RewardedInterstitial Ad Check Example of ad_turbo RewardedInterstitial [here]
(https://github.com/hardikkhunt905/ad_turbo/blob/main/example/lib/Screen/rewarded_interstitial_ad_turbo.dart).


### AppOpen Ad

####- For implement AppOpen Ad You need to initialize `AppOpenAdTurbo`

```dart

  final _appOpenAdTurbo = AppOpenAdTurbo();

```

####- For load AppOpen Ad there is Function `loadAppOpenAdTurbo` :

```dart
   loadAd() async{
    await _appOpenAdTurbo.loadAppOpenAdTurbo(
			(AdTurboAdHelper.appOpenAdUnitId);
        }
```

####- after load AppOpen you can get AppOpen Ad with this function :
- AppOpen can open with onClick
- you can also get callback functions of AppOpen Ad

```dart
ElevatedButton(onPressed: ()async{

          await _appOpenAdTurbo.appOpenAd?.show();
           await _appOpenAdTurbo.appOpenCallback();
      },
      
child: const Text("AppOpenAd")),
```

#### For more detail On How to Implement AppOpen Ad Check Example of ad_turbo AppOpen [here]
(https://github.com/hardikkhunt905/ad_turbo/blob/main/example/lib/Screen/appOpen_ad_turbo.dart).


### Native AdS

####- For implement Native AdS You need to initialize `NativeAdTurbo`

```dart

  final _nativeAdTurbo = NativeAdTurbo();

```

### NativeAd Small


####- For load NativeSmall Ad there is Function `loadNativeSmallAdTurbo` :

```dart
   loadAd() async{
    await _nativeAdTurbo.loadNativeSmallAdTurbo(
			adUnitId: AdTurboAdHelper.nativeAdvancedAdUnitId);
        }
```

####- after load NativeSmall you can get NativeSmall Ad Widget like this :
```dart

		Container(height: 102,child: _nativeAdTurbo.getNativeSmallAdTurbo())
  
```

#### For more detail On How to Implement NativeSmall Ad Check Example of ad_turbo NativeSmall [here]
(https://github.com/hardikkhunt905/ad_turbo/blob/main/example/lib/Screen/native_small_ad_turbo.dart).


### NativeAd Medium


####- For load NativeMedium Ad there is Function `loadNativeMediumAdTurbo` :

```dart
   loadAd() async{
    await _nativeAdTurbo.loadNativeMediumAdTurbo(
			adUnitId: AdTurboAdHelper.nativeAdvancedAdUnitId);
        }
```

####- after load NativeMedium you can get NativeMedium Ad Widget like this :

```dart

		Container(height: 255,child: _nativeAdTurbo.getNativeMediumAdTurbo())
  
```

#### For more detail On How to Implement NativeMedium Ad Check Example of ad_turbo NativeMedium [here]
(https://github.com/hardikkhunt905/ad_turbo/blob/main/example/lib/Screen/native_medium_ad_turbo.dart).


### NativeAd Video


####- For load NativeVideo Ad there is Function `loadNativeVideoAdTurbo` :

```dart
   loadAd() async{
    await loadNativeVideoAdTurbo(
	nativeVideoID: AdTurboAdHelper.nativeAdvancedVideoAdUnitId);
        }
```

####- after load NativeVideo you can get NativeVideo Ad Widget like this :

```dart

		Container(height: 310,child: _nativeAdTurbo.getNativeVideoAdTurbo(context: context))
  
```

#### For more detail On How to Implement NativeVideo Ad Check Example of ad_turbo NativeVideo [here]
(https://github.com/hardikkhunt905/ad_turbo/blob/main/example/lib/Screen/native_video_ad_turbo.dart).



## Load Function InDetail :

###- This functions must be call in init method.

### loadBannerAdTurbo :

```dart

  loadAd() async{
    await _bannerAdTurbo.loadBannerAdTurbo(
        adUnitId: AdTurboAdHelper.bannerAdUnitId,
      // Called when an TurboBannerAd is successfully received.
      onAdLoaded: (ad) {
      log("ad_turbo_plugin : TurboBannerAd loaded");
        isBannerAdReady = true;
        setState((){});
      },
      // Called when an TurboBannerAd request failed.
      onAdFailedToLoad: (ad, error) {
        // Dispose the TurboBannerAd here to free resources.
        isBannerAdReady = false;
        ad.dispose();
        print('TurboBannerAd failed to load: $error');
        loadAd();
      },
      // Called when an TurboBannerAd opens an overlay that covers the screen.
      onAdOpened: (ad) => print('TurboBannerAd opened.'),

      // Called when an TurboBannerAd removes an overlay that covers the screen.
      onAdClosed: (ad) => print('TurboBannerAd closed.'),

      // Called when an impression occurs on the TurboBannerAd.
      onAdImpression: (ad) => print('TurboBannerAd impression.'),
        adSize: BannerAdTurbo.banner);
  }
  
```


### loadInterstitialAdTurbo :

```dart

  loadAd() async{
    await _interstitialAdTurbo.loadInterstitialAdTurbo(adUnitId: AdTurboAdHelper.interstitialAdUnitId,
      onAdLoaded: (ad) {
        print('$ad loaded.');
        // Keep a reference to the ad so you can show it later.
        _interstitialAdTurbo.interstitialAd = ad;
        isInterstitialAdReady = true;
      },
      onAdFailedToLoad: (error) {
        isInterstitialAdReady = false;
        print('Failed to load an interstitial ad: ${error.message}');
        loadAd();
      });

  }
  
```

### loadRewardedAdTurbo :

```dart

  loadAd() async{
    await _rewardedAdTurbo.loadRewardedAdTurbo(adUnitId: AdTurboAdHelper.rewardedAdUnitId,
        onAdLoaded: (ad) {
          print('$ad loaded.');
          // Keep a reference to the ad so you can show it later.
          _rewardedAdTurbo.rewardedAd = ad;
          isRewardedAdReady = true;
        },
        onAdFailedToLoad: (error) {
          isRewardedAdReady = false;
          print('RewardedAd failed to load: $error');
          loadAd();
        });
  }
  
```


### loadRewardedInterstitialAdTurbo :

```dart

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
  
```


### loadAppOpenAdTurbo :

```dart

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
  
```

### loadNativeSmallAdTurbo :


```dart

  loadAd() async{
    await _nativeAdTurbo.loadNativeSmallAdTurbo(
      adUnitId: AdTurboAdHelper.nativeAdvancedAdUnitId,
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          print('Ad loaded.');
          isNativeSmallAdReady = true;
          setState(()=>"");
        },
        // Called when an ad request failed.

        onAdFailedToLoad:(ad, error) {
          isNativeSmallAdReady = false;
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
  
```


### loadNativeMediumAdTurbo :


```dart

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
  
```


### loadNativeVideoAdTurbo :


```dart

  loadAd() async{
    await _nativeAdTurbo.loadNativeVideoAdTurbo(nativeVideoID: AdTurboAdHelper.nativeAdvancedVideoAdUnitId);
  }
  
```

## Prerequisites

*   Flutter 1.22.0 or higher
*   Android
    *   Android Studio 3.2 or higher
    *   Target Android API level 19 or higher
    *   Set `compileSdkVersion` to 28 or higher
    *   Android Gradle Plugin 4.1 or higher (this is the version supported by Flutter out of the box)
*   Ios
    *   Latest version of Xcode with [enabled command-line tools](https://flutter.dev/docs/get-started/install/macos#install-xcode).
*   Recommended: [Create an AdMob account](https://support.google.com/admob/answer/2784575) and [register an Android and/or iOS app](https://support.google.com/admob/answer/2773509) (To show live ads on a published app, it is required to register that app).            
