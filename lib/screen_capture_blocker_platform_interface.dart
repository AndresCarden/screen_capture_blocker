import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'screen_capture_blocker_method_channel.dart';

abstract class ScreenCaptureBlockerPlatform extends PlatformInterface {
  /// Constructs a ScreenCaptureBlockerPlatform.
  ScreenCaptureBlockerPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScreenCaptureBlockerPlatform _instance = MethodChannelScreenCaptureBlocker();

  /// The default instance of [ScreenCaptureBlockerPlatform] to use.
  ///
  /// Defaults to [MethodChannelScreenCaptureBlocker].
  static ScreenCaptureBlockerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScreenCaptureBlockerPlatform] when
  /// they register themselves.
  static set instance(ScreenCaptureBlockerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
