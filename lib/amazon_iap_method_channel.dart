import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'amazon_iap_platform_interface.dart';

/// An implementation of [AmazonIapPlatform] that uses method channels.
class MethodChannelAmazonIap extends AmazonIapPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('amazon_iap');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
