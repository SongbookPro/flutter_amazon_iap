import 'package:pigeon/pigeon.dart';

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
  final String userId;
  final String marketplace;

  UserData(this.userId, this.marketplace);
}

class UserDataResponse {
  final RequestStatus requestStatus;
  final UserData userData;

  UserDataResponse(this.requestStatus, this.userData);
}

class Receipt {
  final String receiptId;
  final String sku;
  final String? termSku;
  final ProductType productType;
  final int purchaseDate;
  final int? cancelDate;
  final int? deferredDate;
  final String? deferredSku;
  final bool isCanceled;
  final bool isDeferred;

  Receipt(
      this.receiptId,
      this.sku,
      this.termSku,
      this.productType,
      this.purchaseDate,
      this.cancelDate,
      this.deferredDate,
      this.deferredSku,
      this.isCanceled,
      this.isDeferred);
}

class PurchaseUpdatesResponse {
  final UserData userData;
  final RequestStatus requestStatus;
  final List<Receipt?> receipts;
  final bool hasMore;

  PurchaseUpdatesResponse(
      this.userData, this.requestStatus, this.receipts, this.hasMore);
}

class Product {
  final String description;
  final String? freeTrialPeriod;
  final String price;
  final ProductType productType;
  final String sku;
  final String smallIconUrl;
  final String subscriptionPeriod;
  final String title;

  Product(this.description, this.freeTrialPeriod, this.price, this.productType,
      this.sku, this.smallIconUrl, this.subscriptionPeriod, this.title);
}

class ProductDataResponse {
  final List<String?> unavailableSkus;
  final RequestStatus requestStatus;
  final Map<String?, Product?> productData;

  ProductDataResponse(
      this.unavailableSkus, this.requestStatus, this.productData);
}

class PurchaseResponse {
  final UserData userData;
  final Receipt receipt;
  final PurchaseRequestStatus requestStatus;

  PurchaseResponse(this.userData, this.receipt, this.requestStatus);
}

@HostApi()
abstract class AmazonIapApi {
  void setup();

  void getUserData();

  void getPurchaseUpdates(bool reset);

  void getProductData(List<String> skus);

  void purchase(String sku);

  void notifyFulfillment(String receiptId, FulfillmentResult fulfillmentResult);
}

@FlutterApi()
abstract class AmazonIapCallbackApi {
  void onUserDataResponse(UserDataResponse data);

  void onPurchaseUpdatesResponse(PurchaseUpdatesResponse data);

  void onProductDataResponse(ProductDataResponse data);

  void onPurchaseResponse(PurchaseResponse data);
}
