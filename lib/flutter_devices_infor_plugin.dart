import 'dart:async';

import 'package:flutter/services.dart';

class FlutterDevicesInforPlugin {
  static const MethodChannel _channel =
      const MethodChannel('flutter_devices_infor_plugin');

  //Android 系统版本
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  //Android API版本
  static Future<String> get sdkInts async {
    final String version = await _channel.invokeMethod('getSDKINT');
    return version;
  }

  //主板型号
  static Future<String> get boards async {
    final String version = await _channel.invokeMethod('getBoard');
    return version;
  }

  //产品品牌
  static Future<String> get brands async {
    final String version = await _channel.invokeMethod('getBrand');
    return version;
  }

  //手机的型号/设备名称
  static Future<String> get model async {
    final String version = await _channel.invokeMethod('getModel');
    return version;
  }

  //设备指令集名称（CPU的类型）
  static Future<String> get cpuAbis async {
    final String version = await _channel.invokeMethod('getCPUABI');
    return version;
  }
}
