import 'package:flutter_test/flutter_test.dart';
import 'package:ad_turbo/ad_turbo_platform_interface.dart';
import 'package:ad_turbo/ad_turbo_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAdTurboPlatform 
    with MockPlatformInterfaceMixin
    implements AdTurboPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AdTurboPlatform initialPlatform = AdTurboPlatform.instance;

  test('$MethodChannelAdTurbo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAdTurbo>());
  });

  test('getPlatformVersion', () async {
    // AdTurbo adTurboPlugin = AdTurbo();
    MockAdTurboPlatform fakePlatform = MockAdTurboPlatform();
    AdTurboPlatform.instance = fakePlatform;
  
    // expect(await adTurboPlugin.getPlatformVersion(), '42');
  });
}
