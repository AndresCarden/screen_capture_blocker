import Flutter
import UIKit

public class ScreenCaptureBlockerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "screen_capture_blocker", binaryMessenger: registrar.messenger())
    let instance = ScreenCaptureBlockerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "blockScreenCapture" {
      DispatchQueue.main.async {
        UIApplication.shared.keyWindow?.layer.addSublayer(CALayer())
        UIScreen.main.isCapturedDidChangeNotification
      }
      result(nil)
    } else if call.method == "allowScreenCapture" {
      DispatchQueue.main.async {
        UIApplication.shared.keyWindow?.layer.removeAllAnimations()
      }
      result(nil)
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}
