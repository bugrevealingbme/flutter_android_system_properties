import 'android_system_properties_platform_interface.dart';

class AndroidSystemProperties {
  Future<String?> getPlatformVersion() {
    return AndroidSystemPropertiesPlatform.instance.getPlatformVersion();
  }

  Future<dynamic> getSystemProperties(String key) {
    return AndroidSystemPropertiesPlatform.instance.getSystemProperties(key);
  }
}
