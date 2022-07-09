import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ad_turbo_method_channel.dart';

abstract class AdTurboPlatform extends PlatformInterface {
  /// Constructs a AdTurboPlatform.
  AdTurboPlatform() : super(token: _token);

  static final Object _token = Object();

  static AdTurboPlatform _instance = MethodChannelAdTurbo();

  /// The default instance of [AdTurboPlatform] to use.
  ///
  /// Defaults to [MethodChannelAdTurbo].
  static AdTurboPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AdTurboPlatform] when
  /// they register themselves.
  static set instance(AdTurboPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
