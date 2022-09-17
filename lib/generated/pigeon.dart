// Autogenerated from Pigeon (v4.0.3), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import
import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

enum RequestStatus {
  successful,
  failed,
  notSupported,
}

enum PurchaseRequestStatus {
  successful,
  failed,
  invalidSku,
  alreadyPurchased,
  notSupported,
}

enum ProductType {
  consumable,
  entitled,
  subscription,
}

enum FulfillmentResult {
  fulfilled,
  unavailable,
}

class UserData {
  UserData({
    required this.userId,
    required this.marketplace,
  });

  String userId;
  String marketplace;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['userId'] = userId;
    pigeonMap['marketplace'] = marketplace;
    return pigeonMap;
  }

  static UserData decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return UserData(
      userId: pigeonMap['userId']! as String,
      marketplace: pigeonMap['marketplace']! as String,
    );
  }
}

class UserDataResponse {
  UserDataResponse({
    required this.requestStatus,
    required this.userData,
  });

  RequestStatus requestStatus;
  UserData userData;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['requestStatus'] = requestStatus.index;
    pigeonMap['userData'] = userData.encode();
    return pigeonMap;
  }

  static UserDataResponse decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return UserDataResponse(
      requestStatus: RequestStatus.values[pigeonMap['requestStatus']! as int]
,
      userData: UserData.decode(pigeonMap['userData']!)
,
    );
  }
}

class Receipt {
  Receipt({
    required this.receiptId,
    required this.sku,
    this.termSku,
    required this.productType,
    required this.purchaseDate,
    this.cancelDate,
    this.deferredDate,
    this.deferredSku,
    required this.isCanceled,
    required this.isDeferred,
  });

  String receiptId;
  String sku;
  String? termSku;
  ProductType productType;
  int purchaseDate;
  int? cancelDate;
  int? deferredDate;
  String? deferredSku;
  bool isCanceled;
  bool isDeferred;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['receiptId'] = receiptId;
    pigeonMap['sku'] = sku;
    pigeonMap['termSku'] = termSku;
    pigeonMap['productType'] = productType.index;
    pigeonMap['purchaseDate'] = purchaseDate;
    pigeonMap['cancelDate'] = cancelDate;
    pigeonMap['deferredDate'] = deferredDate;
    pigeonMap['deferredSku'] = deferredSku;
    pigeonMap['isCanceled'] = isCanceled;
    pigeonMap['isDeferred'] = isDeferred;
    return pigeonMap;
  }

  static Receipt decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return Receipt(
      receiptId: pigeonMap['receiptId']! as String,
      sku: pigeonMap['sku']! as String,
      termSku: pigeonMap['termSku'] as String?,
      productType: ProductType.values[pigeonMap['productType']! as int]
,
      purchaseDate: pigeonMap['purchaseDate']! as int,
      cancelDate: pigeonMap['cancelDate'] as int?,
      deferredDate: pigeonMap['deferredDate'] as int?,
      deferredSku: pigeonMap['deferredSku'] as String?,
      isCanceled: pigeonMap['isCanceled']! as bool,
      isDeferred: pigeonMap['isDeferred']! as bool,
    );
  }
}

class PurchaseUpdatesResponse {
  PurchaseUpdatesResponse({
    required this.userData,
    required this.requestStatus,
    required this.receipts,
    required this.hasMore,
  });

  UserData userData;
  RequestStatus requestStatus;
  List<Receipt?> receipts;
  bool hasMore;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['userData'] = userData.encode();
    pigeonMap['requestStatus'] = requestStatus.index;
    pigeonMap['receipts'] = receipts;
    pigeonMap['hasMore'] = hasMore;
    return pigeonMap;
  }

  static PurchaseUpdatesResponse decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return PurchaseUpdatesResponse(
      userData: UserData.decode(pigeonMap['userData']!)
,
      requestStatus: RequestStatus.values[pigeonMap['requestStatus']! as int]
,
      receipts: (pigeonMap['receipts'] as List<Object?>?)!.cast<Receipt?>(),
      hasMore: pigeonMap['hasMore']! as bool,
    );
  }
}

class Product {
  Product({
    required this.description,
    this.freeTrialPeriod,
    required this.price,
    required this.productType,
    required this.sku,
    required this.smallIconUrl,
    required this.subscriptionPeriod,
    required this.title,
  });

  String description;
  String? freeTrialPeriod;
  String price;
  ProductType productType;
  String sku;
  String smallIconUrl;
  String subscriptionPeriod;
  String title;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['description'] = description;
    pigeonMap['freeTrialPeriod'] = freeTrialPeriod;
    pigeonMap['price'] = price;
    pigeonMap['productType'] = productType.index;
    pigeonMap['sku'] = sku;
    pigeonMap['smallIconUrl'] = smallIconUrl;
    pigeonMap['subscriptionPeriod'] = subscriptionPeriod;
    pigeonMap['title'] = title;
    return pigeonMap;
  }

  static Product decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return Product(
      description: pigeonMap['description']! as String,
      freeTrialPeriod: pigeonMap['freeTrialPeriod'] as String?,
      price: pigeonMap['price']! as String,
      productType: ProductType.values[pigeonMap['productType']! as int]
,
      sku: pigeonMap['sku']! as String,
      smallIconUrl: pigeonMap['smallIconUrl']! as String,
      subscriptionPeriod: pigeonMap['subscriptionPeriod']! as String,
      title: pigeonMap['title']! as String,
    );
  }
}

class ProductDataResponse {
  ProductDataResponse({
    required this.unavailableSkus,
    required this.requestStatus,
    required this.productData,
  });

  List<String?> unavailableSkus;
  RequestStatus requestStatus;
  Map<String?, Product?> productData;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['unavailableSkus'] = unavailableSkus;
    pigeonMap['requestStatus'] = requestStatus.index;
    pigeonMap['productData'] = productData;
    return pigeonMap;
  }

  static ProductDataResponse decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return ProductDataResponse(
      unavailableSkus: (pigeonMap['unavailableSkus'] as List<Object?>?)!.cast<String?>(),
      requestStatus: RequestStatus.values[pigeonMap['requestStatus']! as int]
,
      productData: (pigeonMap['productData'] as Map<Object?, Object?>?)!.cast<String?, Product?>(),
    );
  }
}

class PurchaseResponse {
  PurchaseResponse({
    required this.userData,
    required this.receipt,
    required this.requestStatus,
  });

  UserData userData;
  Receipt receipt;
  PurchaseRequestStatus requestStatus;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['userData'] = userData.encode();
    pigeonMap['receipt'] = receipt.encode();
    pigeonMap['requestStatus'] = requestStatus.index;
    return pigeonMap;
  }

  static PurchaseResponse decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return PurchaseResponse(
      userData: UserData.decode(pigeonMap['userData']!)
,
      receipt: Receipt.decode(pigeonMap['receipt']!)
,
      requestStatus: PurchaseRequestStatus.values[pigeonMap['requestStatus']! as int]
,
    );
  }
}

class _AmazonIapApiCodec extends StandardMessageCodec {
  const _AmazonIapApiCodec();
}

class AmazonIapApi {
  /// Constructor for [AmazonIapApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  AmazonIapApi({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _AmazonIapApiCodec();

  Future<void> setup() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.AmazonIapApi.setup', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> getUserData() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.AmazonIapApi.getUserData', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> getPurchaseUpdates(bool arg_reset) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.AmazonIapApi.getPurchaseUpdates', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_reset]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> getProductData(List<String?> arg_skus) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.AmazonIapApi.getProductData', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_skus]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> purchase(String arg_sku) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.AmazonIapApi.purchase', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_sku]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> notifyFulfillment(String arg_receiptId, FulfillmentResult arg_fulfillmentResult) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.AmazonIapApi.notifyFulfillment', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_receiptId, arg_fulfillmentResult.index]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }
}

class _AmazonIapCallbackApiCodec extends StandardMessageCodec {
  const _AmazonIapCallbackApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is Product) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else 
    if (value is ProductDataResponse) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else 
    if (value is PurchaseResponse) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else 
    if (value is PurchaseUpdatesResponse) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else 
    if (value is Receipt) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else 
    if (value is Receipt) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else 
    if (value is UserData) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    } else 
    if (value is UserDataResponse) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else 
{
      super.writeValue(buffer, value);
    }
  }
  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:       
        return Product.decode(readValue(buffer)!);
      
      case 129:       
        return ProductDataResponse.decode(readValue(buffer)!);
      
      case 130:       
        return PurchaseResponse.decode(readValue(buffer)!);
      
      case 131:       
        return PurchaseUpdatesResponse.decode(readValue(buffer)!);
      
      case 132:       
        return Receipt.decode(readValue(buffer)!);
      
      case 133:       
        return Receipt.decode(readValue(buffer)!);
      
      case 134:       
        return UserData.decode(readValue(buffer)!);
      
      case 135:       
        return UserDataResponse.decode(readValue(buffer)!);
      
      default:      
        return super.readValueOfType(type, buffer);
      
    }
  }
}
abstract class AmazonIapCallbackApi {
  static const MessageCodec<Object?> codec = _AmazonIapCallbackApiCodec();

  void onUserDataResponse(UserDataResponse data);
  void onPurchaseUpdatesResponse(PurchaseUpdatesResponse data);
  void onProductDataResponse(ProductDataResponse data);
  void onPurchaseResponse(PurchaseResponse data);
  static void setup(AmazonIapCallbackApi? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.AmazonIapCallbackApi.onUserDataResponse', codec, binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null, 'Argument for dev.flutter.pigeon.AmazonIapCallbackApi.onUserDataResponse was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final UserDataResponse? arg_data = (args[0] as UserDataResponse?);
          assert(arg_data != null, 'Argument for dev.flutter.pigeon.AmazonIapCallbackApi.onUserDataResponse was null, expected non-null UserDataResponse.');
          api.onUserDataResponse(arg_data!);
          return;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.AmazonIapCallbackApi.onPurchaseUpdatesResponse', codec, binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null, 'Argument for dev.flutter.pigeon.AmazonIapCallbackApi.onPurchaseUpdatesResponse was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PurchaseUpdatesResponse? arg_data = (args[0] as PurchaseUpdatesResponse?);
          assert(arg_data != null, 'Argument for dev.flutter.pigeon.AmazonIapCallbackApi.onPurchaseUpdatesResponse was null, expected non-null PurchaseUpdatesResponse.');
          api.onPurchaseUpdatesResponse(arg_data!);
          return;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.AmazonIapCallbackApi.onProductDataResponse', codec, binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null, 'Argument for dev.flutter.pigeon.AmazonIapCallbackApi.onProductDataResponse was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final ProductDataResponse? arg_data = (args[0] as ProductDataResponse?);
          assert(arg_data != null, 'Argument for dev.flutter.pigeon.AmazonIapCallbackApi.onProductDataResponse was null, expected non-null ProductDataResponse.');
          api.onProductDataResponse(arg_data!);
          return;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.AmazonIapCallbackApi.onPurchaseResponse', codec, binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null, 'Argument for dev.flutter.pigeon.AmazonIapCallbackApi.onPurchaseResponse was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PurchaseResponse? arg_data = (args[0] as PurchaseResponse?);
          assert(arg_data != null, 'Argument for dev.flutter.pigeon.AmazonIapCallbackApi.onPurchaseResponse was null, expected non-null PurchaseResponse.');
          api.onPurchaseResponse(arg_data!);
          return;
        });
      }
    }
  }
}