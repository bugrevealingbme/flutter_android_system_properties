import 'package:android_system_properties/android_system_properties.dart';
import 'package:android_system_properties/android_system_properties_method_channel.dart';
import 'package:android_system_properties/android_system_properties_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidSystemPropertiesPlatform
    with MockPlatformInterfaceMixin
    implements AndroidSystemPropertiesPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<dynamic> getSystemProperties(String key) => Future.value('24');
}

void main() {
  final AndroidSystemPropertiesPlatform initialPlatform =
      AndroidSystemPropertiesPlatform.instance;

  test('$MethodChannelAndroidSystemProperties is the default instance', () {
    expect(
        initialPlatform, isInstanceOf<MethodChannelAndroidSystemProperties>());
  });

  test('getPlatformVersion', () async {
    AndroidSystemProperties androidSystemPropertiesPlugin =
        AndroidSystemProperties();
    MockAndroidSystemPropertiesPlatform fakePlatform =
        MockAndroidSystemPropertiesPlatform();
    AndroidSystemPropertiesPlatform.instance = fakePlatform;

    expect(await androidSystemPropertiesPlugin.getPlatformVersion(), '42');
  });

  test('getSystemProperties', () async {
    AndroidSystemProperties androidSystemPropertiesPlugin =
        AndroidSystemProperties();
    MockAndroidSystemPropertiesPlatform fakePlatform =
        MockAndroidSystemPropertiesPlatform();
    AndroidSystemPropertiesPlatform.instance = fakePlatform;

    expect(
        await androidSystemPropertiesPlugin
            .getSystemProperties('ro.build.version.sdk'),
        '24');
  });
}
