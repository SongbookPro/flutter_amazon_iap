import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'amazon_iap_method_channel.dart';

abstract class AmazonIapPlatform extends PlatformInterface {
  /// Constructs a AmazonIapPlatform.
  AmazonIapPlatform() : super(token: _token);

  static final Object _token = Object();

  static AmazonIapPlatform _instance = MethodChannelAmazonIap();

  /// The default instance of [AmazonIapPlatform] to use.
  ///
  /// Defaults to [MethodChannelAmazonIap].
  static AmazonIapPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AmazonIapPlatform] when
  /// they register themselves.
  static set instance(AmazonIapPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
