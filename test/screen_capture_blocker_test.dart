import 'package:flutter_test/flutter_test.dart';
import 'package:screen_capture_blocker/screen_capture_blocker.dart';
import 'package:screen_capture_blocker/screen_capture_blocker_platform_interface.dart';
import 'package:screen_capture_blocker/screen_capture_blocker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockScreenCaptureBlockerPlatform
    with MockPlatformInterfaceMixin
    implements ScreenCaptureBlockerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ScreenCaptureBlockerPlatform initialPlatform = ScreenCaptureBlockerPlatform.instance;

  test('$MethodChannelScreenCaptureBlocker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScreenCaptureBlocker>());
  });

  test('getPlatformVersion', () async {
    ScreenCaptureBlocker screenCaptureBlockerPlugin = ScreenCaptureBlocker();
    MockScreenCaptureBlockerPlatform fakePlatform = MockScreenCaptureBlockerPlatform();
    ScreenCaptureBlockerPlatform.instance = fakePlatform;

    expect(await screenCaptureBlockerPlugin.getPlatformVersion(), '42');
  });
}
