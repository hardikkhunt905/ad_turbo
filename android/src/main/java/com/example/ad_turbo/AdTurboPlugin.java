package com.example.ad_turbo;

import android.app.Activity;
import android.content.Context;
import androidx.annotation.NonNull;
import java.util.Map;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin;


/** AdTurboPlugin */
public class AdTurboPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context context;
  private Activity activity;
  private FlutterEngine flutterEngine;

  FlutterPluginBinding pluginBinding;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "ad_turbo");
    channel.setMethodCallHandler(this);
    context = flutterPluginBinding.getApplicationContext();
    flutterEngine = flutterPluginBinding.getFlutterEngine();
    pluginBinding = flutterPluginBinding;
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {


    if (call.method.equals("AdTurboNativeAds")) {
      GoogleMobileAdsPlugin.registerNativeAdFactory(flutterEngine, "adTurboNativeSmall", new com.example.ad_turbo.AdTurboNativeSmall(context));
      GoogleMobileAdsPlugin.registerNativeAdFactory(flutterEngine, "adTurboNativeMedium", new com.example.ad_turbo.AdTurboNativeMedium(context));

//      Map<String, String> arguments = call.arguments();
//      assert arguments != null;
//      String nativeId = arguments.get("nativeVideoID");
//      pluginBinding.getPlatformViewRegistry().registerViewFactory("adTurboNativeVideo",
//              new com.example.ad_turbo.AdTurboNativeVideoFactory(nativeId));
    }

    if (call.method.equals("AdTurboNativeVideoAds")) {
      Map<String, String> arguments = call.arguments();
      assert arguments != null;
      String nativeId = arguments.get("nativeVideoID");
      pluginBinding.getPlatformViewRegistry().registerViewFactory("adTurboNativeVideo",
              new com.example.ad_turbo.AdTurboNativeVideoFactory(nativeId));
    }

  }
  
  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "adTurboNativeSmall");
    GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "adTurboNativeMedium");
    channel.setMethodCallHandler(null);
  }
}
