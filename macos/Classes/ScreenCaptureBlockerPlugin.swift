import Cocoa
import FlutterMacOS

public class ScreenCaptureBlockerPlugin: NSObject, FlutterPlugin {
  private var secureWindow: NSWindow?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "screen_capture_blocker", binaryMessenger: registrar.messenger)
    let instance = ScreenCaptureBlockerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "blockScreenCapture":
      blockScreenCapture()
      result(nil)
    case "allowScreenCapture":
      allowScreenCapture()
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func blockScreenCapture() {
    guard let currentWindow = NSApplication.shared.mainWindow else { return }

    currentWindow.level = .screenSaver
    currentWindow.collectionBehavior = [.stationary, .canJoinAllSpaces]
    currentWindow.contentView?.wantsLayer = true
    currentWindow.contentView?.layer?.backgroundColor = NSColor.black.cgColor

    secureWindow = currentWindow
  }

  private func allowScreenCapture() {
    guard let currentWindow = secureWindow else { return }

    currentWindow.level = .normal
    currentWindow.collectionBehavior = []
    currentWindow.contentView?.layer?.backgroundColor = nil

    secureWindow = nil
  }
}
