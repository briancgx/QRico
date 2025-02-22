# QRico

![image](https://github.com/user-attachments/assets/24f3f23e-f64d-47ed-9b13-2e1707596df8)

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
chmod +x qrico.sh
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

BEGIN RAW DESCRIPTION
![image](https://github.com/user-attachments/assets/2d9a6818-037f-4951-9a2a-72f2df0aaecd)

Ejemplo de QR creado con QRico.
END RAW DESCRIPTION

¡Disfruta creando códigos QR únicos con QRico!
