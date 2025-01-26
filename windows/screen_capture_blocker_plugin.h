#ifndef FLUTTER_PLUGIN_SCREEN_CAPTURE_BLOCKER_PLUGIN_H_
#define FLUTTER_PLUGIN_SCREEN_CAPTURE_BLOCKER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace screen_capture_blocker {

class ScreenCaptureBlockerPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ScreenCaptureBlockerPlugin();

  virtual ~ScreenCaptureBlockerPlugin();

  // Disallow copy and assign.
  ScreenCaptureBlockerPlugin(const ScreenCaptureBlockerPlugin&) = delete;
  ScreenCaptureBlockerPlugin& operator=(const ScreenCaptureBlockerPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace screen_capture_blocker

#endif  // FLUTTER_PLUGIN_SCREEN_CAPTURE_BLOCKER_PLUGIN_H_
