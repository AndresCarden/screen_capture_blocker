import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'screen_capture_blocker_platform_interface.dart';

/// An implementation of [ScreenCaptureBlockerPlatform] that uses method channels.
class MethodChannelScreenCaptureBlocker extends ScreenCaptureBlockerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('screen_capture_blocker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
