import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_system_properties_method_channel.dart';

abstract class AndroidSystemPropertiesPlatform extends PlatformInterface {
  /// Constructs a AndroidSystemPropertiesPlatform.
  AndroidSystemPropertiesPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidSystemPropertiesPlatform _instance =
      MethodChannelAndroidSystemProperties();

  /// The default instance of [AndroidSystemPropertiesPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidSystemProperties].
  static AndroidSystemPropertiesPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidSystemPropertiesPlatform] when
  /// they register themselves.
  static set instance(AndroidSystemPropertiesPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<dynamic> getSystemProperties(String key) async {
    throw UnimplementedError('getSystemProperties() has not been implemented.');
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
