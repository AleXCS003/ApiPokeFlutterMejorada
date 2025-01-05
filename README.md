# Aplicación Pokémon API

Este proyecto, desarrollado en **Flutter**, utiliza la **Pokémon API** para mostrar una lista interactiva de Pokémon y sus detalles. Además, cuenta con una funcionalidad adicional para verificar un numero de telefono  y sus caracterisitcas  utilizando la **API de Numverify**.

---

## ✨ Funcionalidades

- **Pantalla de Bienvenida:** Muestra una pantalla introductoria durante 3 segundos antes de acceder a la vista principal.
- **Lista de Pokémon:** Presenta una lista obtenida desde la Pokémon API, con imágenes y nombres de los Pokémon.
- **Búsqueda de Pokémon:** Incorpora un buscador que permite localizar Pokémon por su nombre.
- **Detalles de Pokémon:** Al seleccionar un Pokémon, se despliega una ventana emergente con información como su peso, altura y habilidades.
- **Consulta de numero telfonico:** Permite ingresar un numero telefonico y verficar si el numero es valido o existe.

---
-
![image](https://github.com/user-attachments/assets/06821e27-91a8-4cb0-81ae-9aeab803a4e7)

-
![image](https://github.com/user-attachments/assets/a6cbfa7e-7daf-4914-ab81-27a517b0e917)

## 🛠 Requisitos de Instalación

Antes de iniciar, asegúrate de contar con lo siguiente instalado en tu equipo:

- Flutter
- Dart
- Un editor compatible con Flutter, como Android Studio o Visual Studio Code.

### Instrucciones para Instalar

1. Clona el repositorio en tu máquina local:
   ```bash
   git clone https://github.com/AleXCS003/ApiPokeFlutterMejorada ```

2. Instala las dependencias del proyecto con el comando:
```bash
    flutter pub get
```
3. Conecta un dispositivo móvil o ejecuta un emulador.

4. Ejecuta la aplicación:

```bash
flutter run
```
# Publicación de Aplicación en Amazon Appstore

Este archivo detalla los pasos seguidos para publicar la aplicación **Pokémon API App** en Amazon Appstore utilizando la plataforma de Amazon Developer.

---

## 📋 Requisitos Previos

- Cuenta activa de [Amazon Developer](https://developer.amazon.com/).
- Archivo APK o AAB firmado de tu aplicación.
- Material promocional:
  - Icono (1024x1024 píxeles).
  - Capturas de pantalla (mínimo 3).
  - Banner promocional (opcional).
- Aplicación probada para garantizar funcionalidad y compatibilidad.

---

## 📝 Pasos Seguidos

### 1. Registro en Amazon Developer

1. Crear una cuenta en [Amazon Developer Console](https://developer.amazon.com/).
   .
2. Verificar la cuenta a través del correo electrónico.

---

### 2. Preparación del Entorno

1. Configurar el proyecto Flutter:
   - Generar un APK con el comando:
     ```bash
     flutter build apk --split-per-abi
     ```
   - Configurar la firma del APK en `android/app/build.gradle` usando el archivo `.jks`.
2. Probar la compatibilidad de la app con dispositivos Android soportados por Amazon.

---



### 3. Capturas de la creacion de la cuenta de amazon y subida
1. subir el APK 
![image](https://github.com/user-attachments/assets/36bf9e05-b507-4090-bc4a-63d3f9bb1202)

2.Orientar la  aplicación
![image](https://github.com/user-attachments/assets/289eed8d-4798-4c69-852b-7a1c2425f511)

3.Detalles de Appstore
![image](https://github.com/user-attachments/assets/7b012e57-542e-43d1-974d-29191f0bf8e2)

4. Revisar y enviar
![image](https://github.com/user-attachments/assets/269fb002-add4-42e9-bd1b-4b5050b1d110)

5.Estado de la aplicacion 
![image](https://github.com/user-attachments/assets/7f4455fa-2860-45a5-9923-4e3585935a27)


