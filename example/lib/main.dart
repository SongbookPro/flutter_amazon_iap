import 'package:flutter/material.dart';
import 'dart:async';

import 'package:amazon_iap/amazon_iap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserData? userData;
  InstallDetails? installDetails;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    await AmazonIAP.instance.setup();

    AmazonIAP.instance.onUserDataResponse.listen((event) {
      if (event.requestStatus == RequestStatus.successful) {
        setState(() {
          userData = event.userData;
        });
      }
    });
    AmazonIAP.instance.getUserData();

    installDetails = await AmazonIAP.instance.getInstallDetails();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Amazon IAP example'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Amazon appstore installed: ${installDetails?.isAmazonStoreInstalled ?? "pending"}'),
              Text(
                'User id: ${userData?.userId ?? "pending"}',
                overflow: TextOverflow.ellipsis,
              ),
              Text('Marketplace: ${userData?.marketplace ?? "pending"}'),
            ],
          ),
        ),
      ),
    );
  }
}
