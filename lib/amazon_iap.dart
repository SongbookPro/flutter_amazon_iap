import 'dart:async';

import 'generated/pigeon.dart';

export 'generated/pigeon.dart';

class _Callbacks extends AmazonIapCallbackApi {
  final productDataResponseStream = StreamController<ProductDataResponse>();
  final purchaseResponseStream = StreamController<PurchaseResponse>();
  final purchaseUpdatesResponseStream = StreamController<PurchaseUpdatesResponse>();
  final userDataResponseStream = StreamController<UserDataResponse>();

  @override
  void onProductDataResponse(ProductDataResponse data) {
    productDataResponseStream.add(data);
  }

  @override
  void onPurchaseResponse(PurchaseResponse data) {
    purchaseResponseStream.add(data);
  }

  @override
  void onPurchaseUpdatesResponse(PurchaseUpdatesResponse data) {
    purchaseUpdatesResponseStream.add(data);
  }

  @override
  void onUserDataResponse(UserDataResponse data) {
    userDataResponseStream.add(data);
  }
}

class AmazonIAP {
  static AmazonIAP? _instance;

  late final _api = AmazonIapApi();
  late final _callbacks = _Callbacks();

  static AmazonIAP get instance => _instance ??= AmazonIAP._();

  AmazonIAP._();

  Future<void> setup() async {
    AmazonIapCallbackApi.setup(_callbacks);
    await _api.setup();
  }

  Future<void> purchase(String sku) => _api.purchase(sku);

  Future<void> getUserData() => _api.getUserData();

  Future<void> getPurchaseUpdates(bool reset) => _api.getPurchaseUpdates(reset);

  Future<void> getProductData(List<String> sku) => _api.getProductData(sku);

  Future<void> notifyFulfillment(String receiptId, FulfillmentResult fulfillmentResult) =>
      _api.notifyFulfillment(receiptId, fulfillmentResult);

  Future<InstallDetails> getInstallDetails() => _api.getInstallationDetails();

  Stream<ProductDataResponse> get onProductDataResponse => _callbacks.productDataResponseStream.stream;

  Stream<PurchaseResponse> get onPurchaseResponse => _callbacks.purchaseResponseStream.stream;

  Stream<PurchaseUpdatesResponse> get onPurchaseUpdatesResponse => _callbacks.purchaseUpdatesResponseStream.stream;

  Stream<UserDataResponse> get onUserDataResponse => _callbacks.userDataResponseStream.stream;
}
