package com.songbookpro.amazon_iap;

import android.content.Context;
import android.util.Log;

import androidx.annotation.NonNull;

import com.amazon.device.drm.LicensingService;
import com.amazon.device.iap.PurchasingListener;
import com.amazon.device.iap.PurchasingService;
import com.amazon.device.iap.model.ProductDataResponse;
import com.amazon.device.iap.model.PurchaseResponse;
import com.amazon.device.iap.model.PurchaseUpdatesResponse;
import com.amazon.device.iap.model.UserDataResponse;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import io.flutter.embedding.engine.plugins.FlutterPlugin;

/**
 * AmazonIapPlugin
 */
public class AmazonIapPlugin implements FlutterPlugin, Pigeon.AmazonIapApi, PurchasingListener {
    private Context applicationContext;
    private Pigeon.AmazonIapCallbackApi callback;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        applicationContext = flutterPluginBinding.getApplicationContext();
        Pigeon.AmazonIapApi.setup(flutterPluginBinding.getBinaryMessenger(), this);
        callback = new Pigeon.AmazonIapCallbackApi(flutterPluginBinding.getBinaryMessenger());
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        applicationContext = null;
        Pigeon.AmazonIapApi.setup(binding.getBinaryMessenger(), null);
        callback = null;
    }

    @Override
    public void setup() {
        PurchasingService.registerListener(applicationContext, this);
        Log.d("AmazonIAP", "Appstore SDK Mode: " + LicensingService.getAppstoreSDKMode()); // Checks if app is in test mode
    }

    @Override
    public void getUserData() {
        PurchasingService.getUserData();
    }

    @Override
    public void getPurchaseUpdates(@NonNull Boolean reset) {
        PurchasingService.getPurchaseUpdates(reset);
    }

    @Override
    public void getProductData(@NonNull List<String> skus) {
        Set<String> sku_set = new HashSet<>();
        sku_set.addAll(skus);
        PurchasingService.getProductData(sku_set);
    }

    @Override
    public void purchase(@NonNull String sku) {
        PurchasingService.purchase(sku);
    }

    @Override
    public void notifyFulfillment(@NonNull String receiptId, @NonNull Pigeon.FulfillmentResult fulfillmentResult) {
        PurchasingService.notifyFulfillment(receiptId, TypeConverters.fromPigeon(fulfillmentResult));
    }

    @Override
    public void onUserDataResponse(UserDataResponse userDataResponse) {
        if (callback != null) {
            callback.onUserDataResponse(TypeConverters.toPigeon(userDataResponse), null);
        }
    }

    @Override
    public void onProductDataResponse(ProductDataResponse productDataResponse) {
        if (callback != null) {
            callback.onProductDataResponse(TypeConverters.toPigeon(productDataResponse), null);
        }
    }

    @Override
    public void onPurchaseResponse(PurchaseResponse purchaseResponse) {
        if (callback != null) {
            callback.onPurchaseResponse(TypeConverters.toPigeon(purchaseResponse), null);
        }
    }

    @Override
    public void onPurchaseUpdatesResponse(PurchaseUpdatesResponse purchaseUpdatesResponse) {
        if (callback != null) {
            callback.onPurchaseUpdatesResponse(TypeConverters.toPigeon(purchaseUpdatesResponse), null);
        }
    }
}
