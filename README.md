# **Screen Capture Blocker**

`screen_capture_blocker` es un plugin de Flutter diseñado para bloquear capturas de pantalla y grabaciones de pantalla en las plataformas **Android**, **iOS**, **Windows**, y **macOS**. Este plugin es útil para aplicaciones que manejan datos sensibles y necesitan mayor seguridad visual.

---

## **Características**
- Bloquea capturas de pantalla y grabaciones de pantalla.
- Compatible con **Android**, **iOS**, **Windows**, y **macOS**.
- Ofrece métodos para habilitar y deshabilitar la protección en tiempo real.

---

## **Instalación**

Agrega este plugin como una dependencia en tu archivo `pubspec.yaml`:

```yaml
dependencies:
  screen_capture_blocker:
    git:
      url: https://github.com/AndresCarden/screen_capture_blocker
```

Ejecuta:

```bash
flutter pub get
```

---

## **Uso**

### **1. Importa el Plugin**
```dart
import 'package:screen_capture_blocker/screen_capture_blocker.dart';
```

### **2. Bloquea Capturas de Pantalla**
Llama al método `blockScreenCapture` para bloquear capturas y grabaciones de pantalla:

```dart
await ScreenCaptureBlocker.blockScreenCapture();
```

### **3. Permite Capturas de Pantalla**
Llama al método `allowScreenCapture` para permitir capturas y grabaciones de pantalla nuevamente:

```dart
await ScreenCaptureBlocker.allowScreenCapture();
```

---

## **Ejemplo Completo**

```dart
import 'package:flutter/material.dart';
import 'package:screen_capture_blocker/screen_capture_blocker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
                  print('Bloqueo de captura activado.');
                },
                child: const Text('Bloquear Capturas'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await ScreenCaptureBlocker.allowScreenCapture();
                  print('Bloqueo de captura desactivado.');
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
```

---

## **Compatibilidad por Plataforma**

| Plataforma | Estado         |
|------------|----------------|
| **Android** | Soportado      |
| **iOS**     | Soportado      |
| **Windows** | Soportado      |
| **macOS**   | Soportado      |
| **Web**     | No soportado   |

---

## **Limitaciones**
1. En **Windows**, la API `SetWindowDisplayAffinity` no bloquea capturas realizadas en escritorios remotos o máquinas virtuales.
2. En **macOS**, el bloqueo es limitado y requiere configuraciones específicas de ventanas.
3. **Web** no es compatible debido a la falta de APIs nativas en navegadores para bloquear capturas.

---

## **Contribuir**

1. Haz un fork del repositorio.
2. Crea una nueva rama para tus cambios.
3. Haz un commit con tus mejoras.
4. Envía un Pull Request.

---

## **Licencia**
Este proyecto está bajo la licencia [MIT License](https://opensource.org/licenses/MIT).
