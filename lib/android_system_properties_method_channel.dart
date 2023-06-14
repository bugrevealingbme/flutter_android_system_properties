import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_system_properties_platform_interface.dart';

/// An implementation of [AndroidSystemPropertiesPlatform] that uses method channels.
class MethodChannelAndroidSystemProperties extends AndroidSystemPropertiesPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_system_properties');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<dynamic> getSystemProperties(String key) async {
    final value = await methodChannel.invokeMethod<dynamic>('getSystemProperties', {'key': key});

    return value;
  }
}
