# QRico
**QRico** es una herramienta interactiva para generar códigos QR personalizados desde la terminal. Utiliza un script en Bash que invoca un bloque en Python para aprovechar la librería `qrcode` y `Pillow`. Con **QRico** podrás transformar fácilmente cualquier URL o texto en un código QR único, eligiendo interactivamente sus colores y el nombre del archivo de salida.

## Características
- **Interactividad Total:** Configura todos los parámetros del código QR de forma interactiva.
- **Personalización Completa:** Elige entre varias opciones de colores para el relleno y el fondo del código QR.
- **Salida Colorida:** Una interfaz con mensajes en color que mejora la experiencia en la terminal.
- **Fácil de Usar:** Un único script que integra Bash y Python para generar el código QR en pocos pasos.

## Requisitos
- **Bash:** Compatible con Linux, macOS o entornos similares.
- **Python 3:** Versión 3.6 o superior.
- **Librerías Python:**
  - `qrcode`
  - `Pillow`

Para instalar las dependencias de Python, ejecuta:
```bash
pip install qrcode
```

## Instalación
Clona el repositorio:
```
git clone https://github.com/briancgx/QRico.git
```

Ingresa al directorio del proyecto:
```bash
cd QRico
```

Asegúrate de que el script tenga permisos de ejecución:
```
chmod +x qr_generator.sh
```

## Uso
Para ejecutar la herramienta, simplemente corre el script:
```
./qrico.sh
```

Sigue las instrucciones en pantalla para:

- Ingresar el contenido o URL que deseas codificar.
- Seleccionar si deseas modificar los colores (el menú te mostrará las opciones de color en español).
- Personalizar el nombre del archivo (por defecto, el archivo se llamará codigo-qr.png).
- Una vez completados los pasos, el código QR se generará y se guardará en el directorio actual.

¡Disfruta creando códigos QR únicos con QRico!
