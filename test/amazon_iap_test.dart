import 'package:flutter_test/flutter_test.dart';
import 'package:amazon_iap/amazon_iap.dart';
import 'package:amazon_iap/amazon_iap_platform_interface.dart';
import 'package:amazon_iap/amazon_iap_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAmazonIapPlatform 
    with MockPlatformInterfaceMixin
    implements AmazonIapPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AmazonIapPlatform initialPlatform = AmazonIapPlatform.instance;

  test('$MethodChannelAmazonIap is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAmazonIap>());
  });

  test('getPlatformVersion', () async {
    AmazonIap amazonIapPlugin = AmazonIap();
    MockAmazonIapPlatform fakePlatform = MockAmazonIapPlatform();
    AmazonIapPlatform.instance = fakePlatform;
  
    expect(await amazonIapPlugin.getPlatformVersion(), '42');
  });
}
