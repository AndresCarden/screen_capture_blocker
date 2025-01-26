import 'dart:async';
import 'package:flutter/services.dart';

class ScreenCaptureBlocker {
  static const MethodChannel _channel = MethodChannel('screen_capture_blocker');

  /// Block screenshots and screen recordings.
   static Future<void> blockScreenCapture() async {
    await _channel.invokeMethod('blockScreenCapture');
  }

  /// Allows screenshots and recordings.
  static Future<void> allowScreenCapture() async {
    await _channel.invokeMethod('allowScreenCapture');
  }
}
