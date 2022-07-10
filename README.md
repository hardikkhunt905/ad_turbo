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

####- For load interstitial Ad there is Function `InterstitialAdTurbo` :

```dart
   loadAd() async{
    await _interstitialAdTurbo.loadInterstitialAdTurbo(
            adUnitId: AdTurboAdHelper.interstitialAdUnitId);
        }
```

####- after load interstitial you can get interstitial Ad with this function :
- interstitial will get onClick
- you can also get callback functions of interstital Ad

```dart
ElevatedButton(onPressed: ()async{

          await _interstitialAdTurbo.interstitialAd?.show();
          await _interstitialAdTurbo.interstitialCallback();
      },
      
child: const Text("InterstitialAd")),
```

#### For more detail On How to Implement Interstitial Ad Check Example of ad_turbo interstitialAd [here](https://github.com/hardikkhunt905/ad_turbo/blob/main/example/lib/Screen/interstitial_ad_turbo.dart).




```dart

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
