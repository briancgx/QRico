#!/bin/bash
# Generador de Códigos QR con Interfaz Colorida
# Requiere: python3, qrcode y Pillow (pip install qrcode[pil])

# Ajustar la configuración del terminal para manejar correctamente la tecla de retroceso
stty sane

# Colores ANSI para la terminal
GREEN=$'\033[0;32m'
CYAN=$'\033[0;36m'
YELLOW=$'\033[1;33m'
RED=$'\033[0;31m'
NC=$'\033[0m'  # Sin color

# Banner personalizado
echo -e "${GREEN}"
echo -e "                                                  
                        ██                        
  ░████░   ██████▒      ██                        
  ██████   ███████▓     ██                        
 ▒██  ██▒  ██   ▒██                               
 ██▒  ▒██  ██    ██   ████       ▓████▒   ░████░  
 ██    ██  ██   ▒██   ████      ███████  ░██████░ 
 ██    ██  ███████▒     ██     ▓██▒  ▒█  ███  ███ 
 ██    ██  ██████▓      ██     ██░       ██░  ░██ 
 ██    ██  ██  ▓██░     ██     ██        ██    ██ 
 ██▒  ▒██  ██   ██▓     ██     ██░       ██░  ░██ 
 ▒██  ██▓  ██   ▒██     ██     ▓██▒  ░█  ███  ███ 
  ██████░  ██    ██▒ ████████   ███████  ░██████░ 
  ░█████   ██    ███ ████████    ▓████▒   ░████░  
     ░██▒                                         
      ░█"
echo -e "${NC}"
echo -e "${CYAN}  Bienvenido a QRico, tu generador de códigos QR fácil y rápido.${NC}"
echo -e "${CYAN}  ========================================================${NC}"
echo -e "${YELLOW}  Creado por: briancgx${NC}"
echo -e ""

# Función para seleccionar una opción numérica
seleccionar_opcion() {
    local mensaje="$1"
    local opciones=("${!2}")  # Pasar el arreglo de opciones como referencia
    local respuesta

    while true; do
        echo -e "\n${CYAN}${mensaje}:${NC}"
        for i in "${!opciones[@]}"; do
            num=$((i+1))
            echo -e "  ${RED}[${NC}${num}${RED}]${NC} ${opciones[$i]^}"
        done
        read -r -p "${YELLOW}Ingresa el número correspondiente: ${NC}" respuesta
        if [[ "$respuesta" =~ ^[1-${#opciones[@]}]$ ]]; then
            echo "$respuesta"
            return
        else
            echo -e "${RED}Opción inválida. Por favor, ingresa un número entre 1 y ${#opciones[@]}.${NC}"
        fi
    done
}

# Solicitar el contenido o URL para el QR
read -r -p "${CYAN}Introduce el contenido o URL para el código QR: ${NC}" contenido

# Mostrar los colores por defecto y preguntar si se quiere modificar
echo -e "\n${CYAN}Por defecto, el QR se generará con:${NC}"
echo -e "${CYAN}  - Relleno: negro${NC}"
echo -e "${CYAN}  - Fondo: blanco${NC}"

# Preguntar si se desea modificar los colores
opciones_modificar=("Sí" "No")
while true; do
    echo -e "\n${CYAN}¿Quieres modificar los colores?:${NC}"
    echo -e "  ${RED}[${NC}1${RED}]${NC} Sí"
    echo -e "  ${RED}[${NC}2${RED}]${NC} No"
    read -r -p "${YELLOW}Ingresa el número correspondiente: ${NC}" respuesta_modificar
    if [[ "$respuesta_modificar" =~ ^[1-2]$ ]]; then
        break
    else
        echo -e "${RED}Opción inválida. Por favor, ingresa 1 o 2.${NC}"
    fi
done

# Mapeo de colores: se muestran en español pero se usan los nombres en inglés para Pillow
declare -A color_map=( ["negro"]="black" ["azul"]="blue" ["rojo"]="red" ["verde"]="green" ["amarillo"]="yellow" ["morado"]="purple" ["naranja"]="orange" )
available_colors=("negro" "azul" "rojo" "verde" "amarillo" "morado" "naranja")

if [[ "$respuesta_modificar" == "1" ]]; then
    # Seleccionar color de relleno
    while true; do
        echo -e "\n${CYAN}Elige el color para el relleno:${NC}"
        for i in "${!available_colors[@]}"; do
            num=$((i+1))
            echo -e "  ${RED}[${NC}${num}${RED}]${NC} ${available_colors[$i]^}"
        done
        read -r -p "${YELLOW}Ingresa el número correspondiente: ${NC}" relleno_index
        if [[ "$relleno_index" =~ ^[1-7]$ ]]; then
            relleno=${color_map[${available_colors[$((relleno_index-1))]}]}
            break
        else
            echo -e "${RED}Opción inválida. Por favor, ingresa un número entre 1 y 7.${NC}"
        fi
    done

    # Seleccionar color de fondo
    while true; do
        echo -e "\n${CYAN}Elige el color para el fondo:${NC}"
        for i in "${!available_colors[@]}"; do
            num=$((i+1))
            echo -e "  ${RED}[${NC}${num}${RED}]${NC} ${available_colors[$i]^}"
        done
        read -r -p "${YELLOW}Ingresa el número correspondiente: ${NC}" fondo_index   
        if [[ "$fondo_index" =~ ^[1-7]$ ]]; then
            fondo=${color_map[${available_colors[$((fondo_index-1))]}]}
            break
        else
            echo -e "${RED}Opción inválida. Por favor, ingresa un número entre 1 y 7.${NC}"
        fi
    done
else
    relleno="black"
    fondo="white"
fi

# Preguntar si se desea personalizar el nombre del archivo
while true; do
    echo -e "\n${CYAN}¿Quieres personalizar el nombre del archivo QR?:${NC}"
    echo -e "  ${RED}[${NC}1${RED}]${NC} Sí"
    echo -e "  ${RED}[${NC}2${RED}]${NC} No"
    read -r -p "${YELLOW}Ingresa el número correspondiente: ${NC}" respuesta_nombre
    if [[ "$respuesta_nombre" =~ ^[1-2]$ ]]; then
        break
    else
        echo -e "${RED}Opción inválida. Por favor, ingresa 1 o 2.${NC}"
    fi
done

if [[ "$respuesta_nombre" == "1" ]]; then
    read -r -p "${CYAN}Ingresa el nombre del archivo (sin extensión): ${NC}" nombre_archivo
    if [[ -z "$nombre_archivo" ]]; then
        nombre_archivo="codigo-qr"
    fi
else
    nombre_archivo="codigo-qr"
fi

echo -e "\nGenerando el código QR..."

# Ejecutar el bloque Python embebido para generar el QR
python3 <<EOF
import qrcode

contenido = "$contenido"
fill_color = "$relleno"
back_color = "$fondo"
nombre_archivo = "$nombre_archivo" + ".png"

qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_L,
    box_size=10,
    border=4
)
qr.add_data(contenido)
qr.make(fit=True)
img = qr.make_image(fill_color=fill_color, back_color=back_color)
img.save(nombre_archivo)
print(f"\nEl código QR se ha generado y guardado como '{nombre_archivo}'.")
EOF
