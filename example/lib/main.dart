import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:screen_capture_blocker_example/screen_capture_blocker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Screen Capture Blocker')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await ScreenCaptureBlocker.blockScreenCapture();
                  if (kDebugMode) {
                    print('Bloqueo de captura activado.');
                  }
                },
                child: const Text('Bloquear Capturas'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await ScreenCaptureBlocker.allowScreenCapture();
                  if (kDebugMode) {
                    print('Bloqueo de captura desactivado.');
                  }
                },
                child: const Text('Permitir Capturas'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
