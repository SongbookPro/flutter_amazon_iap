package com.songbookpro.amazon_iap;

import com.amazon.device.iap.model.FulfillmentResult;
import com.amazon.device.iap.model.Product;
import com.amazon.device.iap.model.ProductDataResponse;
import com.amazon.device.iap.model.ProductType;
import com.amazon.device.iap.model.PurchaseResponse;
import com.amazon.device.iap.model.PurchaseUpdatesResponse;
import com.amazon.device.iap.model.Receipt;
import com.amazon.device.iap.model.UserData;
import com.amazon.device.iap.model.UserDataResponse;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import kotlin.NotImplementedError;

public class TypeConverters {
    static FulfillmentResult fromPigeon(Pigeon.FulfillmentResult data) {
        switch (data) {
            case FULFILLED:
                return FulfillmentResult.FULFILLED;
            case UNAVAILABLE:
            default:
                return FulfillmentResult.UNAVAILABLE;
        }
    }

    static Pigeon.UserData toPigeon(UserData data) {
        Pigeon.UserData.Builder builder = new Pigeon.UserData.Builder();
        builder.setMarketplace(data.getMarketplace());
        builder.setUserId(data.getUserId());
        return builder.build();
    }

    static Pigeon.RequestStatus toPigeon(UserDataResponse.RequestStatus data) {
        switch (data) {
            case SUCCESSFUL:
                return Pigeon.RequestStatus.SUCCESSFUL;
            case FAILED:
                return Pigeon.RequestStatus.FAILED;
            case NOT_SUPPORTED:
            default:
                return Pigeon.RequestStatus.NOT_SUPPORTED;
        }
    }

    static Pigeon.RequestStatus toPigeon(ProductDataResponse.RequestStatus data) {
        switch (data) {
            case SUCCESSFUL:
                return Pigeon.RequestStatus.SUCCESSFUL;
            case FAILED:
                return Pigeon.RequestStatus.FAILED;
            case NOT_SUPPORTED:
            default:
                return Pigeon.RequestStatus.NOT_SUPPORTED;
        }
    }

    static Pigeon.RequestStatus toPigeon(PurchaseUpdatesResponse.RequestStatus data) {
        switch (data) {
            case SUCCESSFUL:
                return Pigeon.RequestStatus.SUCCESSFUL;
            case FAILED:
                return Pigeon.RequestStatus.FAILED;
            case NOT_SUPPORTED:
            default:
                return Pigeon.RequestStatus.NOT_SUPPORTED;
        }
    }

    static Pigeon.PurchaseRequestStatus toPigeon(PurchaseResponse.RequestStatus data) {
        switch (data) {
            case SUCCESSFUL:
                return Pigeon.PurchaseRequestStatus.SUCCESSFUL;
            case FAILED:
                return Pigeon.PurchaseRequestStatus.FAILED;
            case INVALID_SKU:
                return Pigeon.PurchaseRequestStatus.INVALID_SKU;
            case ALREADY_PURCHASED:
                return Pigeon.PurchaseRequestStatus.ALREADY_PURCHASED;
            case NOT_SUPPORTED:
            default:
                return Pigeon.PurchaseRequestStatus.NOT_SUPPORTED;
        }
    }

    static Pigeon.ProductType toPigeon(ProductType data) {
        switch (data) {
            case CONSUMABLE:
                return Pigeon.ProductType.CONSUMABLE;
            case ENTITLED:
                return Pigeon.ProductType.ENTITLED;
            case SUBSCRIPTION:
                return Pigeon.ProductType.SUBSCRIPTION;
        }
        throw new NotImplementedError();
    }

    static Pigeon.Product toPigeon(Product data) {
        Pigeon.Product.Builder builder = new Pigeon.Product.Builder();
        builder.setDescription(data.getDescription());
        builder.setFreeTrialPeriod(data.getFreeTrialPeriod());
        builder.setPrice(data.getPrice());
        builder.setProductType(toPigeon(data.getProductType()));
        builder.setSku(data.getSku());
        builder.setSmallIconUrl(data.getSmallIconUrl());
        builder.setSubscriptionPeriod(data.getSubscriptionPeriod());
        builder.setTitle(data.getTitle());
        return builder.build();
    }

    static Pigeon.Receipt toPigeon(Receipt data) {
        Pigeon.Receipt.Builder builder = new Pigeon.Receipt.Builder();
        builder.setReceiptId(data.getReceiptId());
        builder.setSku(data.getSku());
        builder.setTermSku(data.getTermSku());
        builder.setProductType(toPigeon(data.getProductType()));
        builder.setPurchaseDate(data.getPurchaseDate().getTime());

        if (data.getCancelDate() != null) {
            builder.setCancelDate(data.getCancelDate().getTime());
        }

        if (data.getDeferredDate() != null) {
            builder.setDeferredDate(data.getDeferredDate().getTime());
        }

        builder.setDeferredSku(data.getDeferredSku());
        builder.setIsCanceled(data.isCanceled());
        builder.setIsDeferred(data.isDeferred());
        return builder.build();
    }

    static Pigeon.UserDataResponse toPigeon(UserDataResponse data) {
        Pigeon.UserDataResponse.Builder builder = new Pigeon.UserDataResponse.Builder();
        builder.setRequestStatus(toPigeon(data.getRequestStatus()));

        UserData userData = data.getUserData();
        if (userData != null) {
            builder.setUserData(toPigeon(userData));
        }
        return builder.build();
    }

    static Pigeon.ProductDataResponse toPigeon(ProductDataResponse data) {
        Pigeon.ProductDataResponse.Builder builder = new Pigeon.ProductDataResponse.Builder();
        builder.setRequestStatus(toPigeon(data.getRequestStatus()));

        Map<String, Pigeon.Product> products = new HashMap<>();
        for (Map.Entry<String, Product> entry : data.getProductData().entrySet()) {
            products.put(entry.getKey(), toPigeon(entry.getValue()));
        }

        builder.setProductData(products);
        builder.setUnavailableSkus(new ArrayList<>(data.getUnavailableSkus()));
        return builder.build();
    }

    static Pigeon.PurchaseResponse toPigeon(PurchaseResponse data) {
        Pigeon.PurchaseResponse.Builder builder = new Pigeon.PurchaseResponse.Builder();
        builder.setRequestStatus(toPigeon(data.getRequestStatus()));

        builder.setReceipt(toPigeon(data.getReceipt()));
        Receipt receipt = data.getReceipt();
        if (receipt != null) {
            builder.setReceipt(toPigeon(receipt));
        }

        UserData userData = data.getUserData();
        if (userData != null) {
            builder.setUserData(toPigeon(userData));
        }

        return builder.build();
    }

    static Pigeon.PurchaseUpdatesResponse toPigeon(PurchaseUpdatesResponse data) {
        Pigeon.PurchaseUpdatesResponse.Builder builder = new Pigeon.PurchaseUpdatesResponse.Builder();

        UserData userData = data.getUserData();
        if (userData != null) {
            builder.setUserData(toPigeon(userData));
        }

        builder.setRequestStatus(toPigeon(data.getRequestStatus()));
        builder.setHasMore(data.hasMore());

        ArrayList<Pigeon.Receipt> receipts = new ArrayList<Pigeon.Receipt>();
        for (Receipt receipt : data.getReceipts()) {
            receipts.add(toPigeon(receipt));
        }

        builder.setReceipts(receipts);
        return builder.build();
    }
}
