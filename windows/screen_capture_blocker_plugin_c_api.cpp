#include "include/screen_capture_blocker/screen_capture_blocker_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "screen_capture_blocker_plugin.h"

void ScreenCaptureBlockerPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  screen_capture_blocker::ScreenCaptureBlockerPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
