import Flutter
import UIKit

public class SwiftFlutterDevicesInforPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_devices_infor_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterDevicesInforPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
