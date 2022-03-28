import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_devices_infor_plugin/flutter_devices_infor_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _sdkInt = 'Unknown';
  String _board = 'Unknown';
  String _brand = 'Unknown';
  String _model = 'Unknown';
  String _cpuAbi = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    String sdkInt;
    String board;
    String brand;
    String model;
    String cpuAbi;

    try {
      platformVersion =
          await FlutterDevicesInforPlugin.platformVersion ?? 'Unknown platform version';
      sdkInt = await FlutterDevicesInforPlugin.sdkInts;
      board = await FlutterDevicesInforPlugin.boards;
      brand = await FlutterDevicesInforPlugin.brands;
      model = await FlutterDevicesInforPlugin.model;
      cpuAbi = await FlutterDevicesInforPlugin.cpuAbis;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      sdkInt = 'Failed to get sdkInt version.';
      board = 'Failed to get preViewSdkInt version.';
      brand = 'Failed to get platform version.';
      model = 'Failed to get codeName.';
      cpuAbi = 'Failed to get CPUABI.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _sdkInt = sdkInt;
      _board = board;
      _brand = brand;
      _model = model;
      _cpuAbi = cpuAbi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          //          child: Text('Running on: $_platformVersion\n'),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('${_platformVersion}'),
              Text('${_sdkInt}'),
              Text('${_board}'),
              Text('${_brand}'),
              Text('${_model}'),
              Text('${_cpuAbi}'),
            ],
          ),
        ),
      ),
    );
  }
}
