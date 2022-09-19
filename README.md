# Amazon IAP

A flutter abstraction of the Amazon AppStore SDK.

## Installation

Follow Amazon's instructions to configure the Appstore SDK with your public key:
https://developer.amazon.com/docs/in-app-purchasing/integrate-appstore-sdk.html#configure_key

Before using the plugin, you must call:
```
await AmazonIAP.instance.setup();
```

## Usage

As this is a wrapper around the methods exposed by the Amazon Appstore SDK, the user should read Amazon's documentation.

Calls to the Appstore SDK are in the form of function calls, while the responses are delivered as events to the provided streams.

https://developer.amazon.com/docs/in-app-purchasing/iap-implement-iap.html

### Functions

*  `getUserData()`
*  `getPurchaseUpdates()`
*  `getProductData()`
*  `purchase()`
*  `notifyFulfillment()`
*  `getInstallDetails()`

### Event streams

* `onProductDataResponse`
* `onPurchaseResponse`
* `onPurchaseUpdatesResponse`
* `onUserDataResponse`

### Obfuscation

If obfuscating the app, the following steps should be taken:

https://developer.amazon.com/docs/in-app-purchasing/iap-obfuscate-the-code.html
