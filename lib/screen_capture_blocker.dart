
import 'screen_capture_blocker_platform_interface.dart';

class ScreenCaptureBlocker {
  Future<String?> getPlatformVersion() {
    return ScreenCaptureBlockerPlatform.instance.getPlatformVersion();
  }
}
