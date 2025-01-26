## 0.0.1

### **Características Iniciales**
- Implementación del plugin **Screen Capture Blocker** para Flutter.
- Soporte para las siguientes plataformas:
    - **Android**: Bloqueo de capturas y grabaciones de pantalla utilizando `FLAG_SECURE`.
    - **iOS**: Bloqueo básico de capturas y grabaciones de pantalla con `UIScreen`.
    - **Windows**: Uso de `SetWindowDisplayAffinity` para evitar capturas de pantalla.
    - **macOS**: Configuración de ventanas protegidas para limitar capturas.
- Métodos disponibles:
    - `blockScreenCapture()`: Bloquea capturas y grabaciones de pantalla.
    - `allowScreenCapture()`: Permite capturas y grabaciones nuevamente.
- Documentación completa incluida en el archivo README.

---

### **Notas de la Versión**
Esta primera versión introduce la funcionalidad base del plugin, brindando una herramienta multiplataforma para aumentar la seguridad visual de las aplicaciones Flutter.

- **Limitaciones conocidas**:
    1. En **Windows**, la API `SetWindowDisplayAffinity` no bloquea capturas realizadas en escritorios remotos o máquinas virtuales.
    2. En **macOS**, el bloqueo es limitado y requiere configuraciones específicas de ventanas.
    3. **Web** no es compatible debido a la falta de APIs nativas en navegadores para bloquear capturas.
