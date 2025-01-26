#include "screen_capture_blocker_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

// For getPlatformVersion; remove unless needed for your plugin implementation.
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <memory>
#include <sstream>

namespace screen_capture_blocker {

// static
    void ScreenCaptureBlockerPlugin::RegisterWithRegistrar(
            flutter::PluginRegistrarWindows *registrar) {
        auto channel =
                std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
                        registrar->messenger(), "screen_capture_blocker",
                                &flutter::StandardMethodCodec::GetInstance());

        auto plugin = std::make_unique<ScreenCaptureBlockerPlugin>();

        channel->SetMethodCallHandler(
                [plugin_pointer = plugin.get()](const auto &call, auto result) {
                    plugin_pointer->HandleMethodCall(call, std::move(result));
                });

        registrar->AddPlugin(std::move(plugin));
    }

    ScreenCaptureBlockerPlugin::ScreenCaptureBlockerPlugin() {}

    ScreenCaptureBlockerPlugin::~ScreenCaptureBlockerPlugin() {}

    void ScreenCaptureBlockerPlugin::HandleMethodCall(
            const flutter::MethodCall<flutter::EncodableValue> &method_call,
            std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
        if (method_call.method_name().compare("blockScreenCapture") == 0) {
            HWND main_window = GetAncestor(GetForegroundWindow(), GA_ROOT);
            if (main_window != nullptr) {
                // Bloquea captura de pantalla
                if (SetWindowDisplayAffinity(main_window, WDA_MONITOR)) {
                    result->Success(flutter::EncodableValue("Screen capture blocked"));
                } else {
                    result->Error("BLOCK_ERROR", "Failed to block screen capture");
                }
            } else {
                result->Error("WINDOW_ERROR", "Unable to find main window");
            }
        } else if (method_call.method_name().compare("allowScreenCapture") == 0) {
            HWND main_window = GetAncestor(GetForegroundWindow(), GA_ROOT);
            if (main_window != nullptr) {
                // Permite captura de pantalla
                if (SetWindowDisplayAffinity(main_window, WDA_NONE)) {
                    result->Success(flutter::EncodableValue("Screen capture allowed"));
                } else {
                    result->Error("ALLOW_ERROR", "Failed to allow screen capture");
                }
            } else {
                result->Error("WINDOW_ERROR", "Unable to find main window");
            }
        } else {
            result->NotImplemented();
        }
    }

}  // namespace screen_capture_blocker
