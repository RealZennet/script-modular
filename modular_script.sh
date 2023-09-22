#!/bin/bash
RUTA="/var/log/secure*"
opcion=""

function menu(){
    clear
    echo "----------- Registro de intentos -----------"
    echo "1. Muestra intentos de login exitosos"
    echo "2. Muestra intentos de login fallidos"
    echo "3. Muestra un informe completo de intentos"
    echo "4. Salir"
    echo -e "-------------------------------------------\n"
    read -p "Elige una opción: " opcion
}

# Función para obtener estadísticas de inicio de sesión exitosos
function detalle_exitosos() {
    echo -e "Intentos de inicio de sesión exitosos: $(grep "Accepted password" $RUTA | wc -l)\n"
    echo -e "Detalle de Usuarios Exitosos:\n $(grep "Accepted" $RUTA)\n"
}

# Función para obtener estadísticas de inicio de sesión fallidos
function detalle_fallidos() {
    echo -e "Intentos de inicio de sesión fallidos: $(grep "Failed password" $RUTA | wc -l)\n"
    echo -e "Detalle de Usuarios Fallidos:\n $(grep "Failed" $RUTA)\n"
}

function detalle_completo() {
    detalle_fallidos
    detalle_exitosos
    echo -e "Detalle completo:\n $(grep "Accepted\|Failed" $RUTA)\n"
}

# Módulo principal
while true; do 
    menu
    clear
    echo -e "------------------------------------------------------------------------------"
    case $opcion in
    1) detalle_exitosos ;;
    2) detalle_fallidos ;;
    3) detalle_completo ;;
    4) exit ;;
    *) echo "Opción inválida" ;;
    esac
    echo -e "------------------------------------------------------------------------------\n\n"
    echo -e "Presione cualquier tecla para volver al menú\n"
    read
done
