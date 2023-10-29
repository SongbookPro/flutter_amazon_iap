package com.songbookpro.amazon_iap;

import android.content.Context;
import android.content.pm.PackageManager;
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

// Required due to https://github.com/flutter/flutter/issues/58913
class _DummyReply implements Pigeon.Result<Void> {
    @Override
    public void success(@NonNull Void result) {
    }

    @Override
    public void error(@NonNull Throwable error) {
    }
}

/**
 * AmazonIapPlugin
 */
public class AmazonIapPlugin implements FlutterPlugin, Pigeon.AmazonIapApi, PurchasingListener {
    private Context applicationContext;
    private Pigeon.AmazonIapCallbackApi callback;

    private _DummyReply _dummyReply = new _DummyReply();

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        applicationContext = flutterPluginBinding.getApplicationContext();
        Pigeon.AmazonIapApi.setUp(flutterPluginBinding.getBinaryMessenger(), this);
        callback = new Pigeon.AmazonIapCallbackApi(flutterPluginBinding.getBinaryMessenger());
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        applicationContext = null;
        Pigeon.AmazonIapApi.setUp(binding.getBinaryMessenger(), null);
        callback = null;
    }

    @Override
    public void setup() {
        PurchasingService.registerListener(applicationContext, this);
        Log.d("AmazonIAP", "Appstore SDK Mode: " + LicensingService.getAppstoreSDKMode()); // Checks if app is in test
                                                                                           // mode
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

    @NonNull
    @Override
    public Pigeon.InstallDetails getInstallationDetails() {
        Pigeon.InstallDetails.Builder builder = new Pigeon.InstallDetails.Builder();
        builder.setIsAmazonStoreInstalled(isPackageInstalled(applicationContext, "com.amazon.venezia"));
        builder.setInstalledFromAmazonStore(isAppInstalledFrom(applicationContext, "amazon"));
        return builder.build();
    }

    @Override
    public void onUserDataResponse(UserDataResponse userDataResponse) {
        if (callback != null) {
            callback.onUserDataResponse(TypeConverters.toPigeon(userDataResponse), _dummyReply);
        }
    }

    @Override
    public void onProductDataResponse(ProductDataResponse productDataResponse) {
        if (callback != null) {
            callback.onProductDataResponse(TypeConverters.toPigeon(productDataResponse), _dummyReply);
        }
    }

    @Override
    public void onPurchaseResponse(PurchaseResponse purchaseResponse) {
        if (callback != null) {
            callback.onPurchaseResponse(TypeConverters.toPigeon(purchaseResponse), _dummyReply);
        }
    }

    @Override
    public void onPurchaseUpdatesResponse(PurchaseUpdatesResponse purchaseUpdatesResponse) {
        if (callback != null) {
            callback.onPurchaseUpdatesResponse(TypeConverters.toPigeon(purchaseUpdatesResponse), _dummyReply);
        }
    }

    private boolean isPackageInstalled(Context ctx, String packageName) {
        try {
            ctx.getPackageManager().getPackageInfo(packageName, 0);
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
        return true;
    }

    private boolean isAppInstalledFrom(Context ctx, String installer) {
        String installerPackageName = ctx.getPackageManager().getInstallerPackageName(
                ctx.getPackageName());
        if (installer != null && installerPackageName != null && installerPackageName.contains(installer)) {
            return true;
        }
        return false;
    }
}
