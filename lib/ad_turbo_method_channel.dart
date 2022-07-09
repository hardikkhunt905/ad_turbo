import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ad_turbo_platform_interface.dart';

/// An implementation of [AdTurboPlatform] that uses method channels.
class MethodChannelAdTurbo extends AdTurboPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ad_turbo');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
