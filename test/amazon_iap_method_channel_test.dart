import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:amazon_iap/amazon_iap_method_channel.dart';

void main() {
  MethodChannelAmazonIap platform = MethodChannelAmazonIap();
  const MethodChannel channel = MethodChannel('amazon_iap');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
