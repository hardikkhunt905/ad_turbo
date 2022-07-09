# ad_turbo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


// [The plugin google_mobile_ads requires a higher Android SDK version]
--> set minSdkVersion 19 at (Your Project)\android\app\build.gradle:
android {
    defaultConfig {   
##        minSdkVersion 19
    }                 
   }                   

// [App requires Multidex support]
--> set multiDexEnabled true at (Your Project)\android\app\build.gradle:
    android {
     defaultConfig {   
##       multiDexEnabled true

     }                 
    }                   

// [Add Google ad App Id in Android Manifest]
 <!-- Sample AdMob app ID: ca-app-pub-3940256099942544~3347511713 -->
##       <meta-data
##           android:name="com.google.android.gms.ads.APPLICATION_ID"
##           android:value="ca-app-pub-3940256099942544~3347511713"/>

add for ios -->

In your app's ios/Runner/Info.plist file, add a GADApplicationIdentifier key with a string value of your AdMob app ID
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-3940256099942544~3347511713</string>
