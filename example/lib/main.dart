import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:giphy_flutter_sdk/giphy_flutter_sdk.dart';
import 'package:giphy_flutter_sdk_example/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initPlatformState() {
    try {
      String? apiKey;
      if (Platform.isAndroid) {
        apiKey = "dKWilzWT6HKrvSgUtPdDL6plsekNpAg8";
      } else if (Platform.isIOS) {
        apiKey = "NMgbHRSWegb3UwsWgr27An57y5TbjyCD";
      } else {
        throw Exception('Unsupported platform');
      }
      if (apiKey.isEmpty) {
        throw Exception('API key for the platform is null or not configured');
      }
      GiphyFlutterSDK.configure(apiKey: apiKey);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Giphy example app'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: const MainScreen(),
      ),
    );
  }
}
