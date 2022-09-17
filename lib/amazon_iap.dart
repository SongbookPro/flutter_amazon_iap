
import 'amazon_iap_platform_interface.dart';

class AmazonIap {
  Future<String?> getPlatformVersion() {
    return AmazonIapPlatform.instance.getPlatformVersion();
  }
}
