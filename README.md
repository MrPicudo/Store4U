# Store4U - Prueba Técnica

Este proyecto desarrollado con Swift y SwiftUI consume datos de una API, los decodifica en un formato usable en Swift, y presenta los resultados en una interfaz amigable, soportando carga de imágenes asíncronas y localización en dos idiomas.

## Características Técnicas

- **Estructura Swift para recibir los datos**: Se construyó una estructura que adopta el protocolo `Codable` para manejar la respuesta JSON. 
  
- **Consumo de la API**: Se utilizó la clase `URLSession` para la llamada asíncrona a la API mediante una función con `async/await`, la respuesta se procesa utilizando un `JSONDecoder`, convirtiendo el JSON en un objeto Swift manipulable dentro de la aplicación.

- **Manejo de errores**: Se implementó el manejo de errores comunes en la interacción con la API y la decodificación de datos.

- **Carga de imágenes**: Las imágenes se cargan de manera asíncrona usando `AsyncImage` con placeholders para estados de carga y mensajes de error en caso de fallos en la carga de la imagen.

- **Intercambio de datos entre vistas**: Para el flujo de datos entre vistas, se implementó la interacción entre variables `@State` y `@Binding`, permitiendo la comunicación efectiva entre la vista principal y las vistas secundarias.

- **Seguridad de la API**: Se creó un archivo `.plist` para almacenar la URL de la API, protegiendo la información sensible, y se configuró un archivo `.gitignore` para evitar que este archivo se suba al repositorio público.

- **Soporte multilenguaje**: La aplicación soporta localización en inglés y español, adaptándose automáticamente al idioma del dispositivo del usuario.

## Requisitos

- **Versión mínima de iOS**: 17.0
- **Xcode**: 15.0 o superior

## Instalación

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone https://github.com/MrPicudo/Store4U.git

2. Abre el proyecto en Xcode:
   ```bash
   open Store4U.xcodeproj

3. Conecta tu dispositivo iOS (con iOS 17.0 o superior), o selecciona un simulador compatible en Xcode.

4. Ejecuta la aplicación presionando el botón "Run" en Xcode o usando el atajo `Cmd + R`
