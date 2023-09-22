#!/bin/bash
# Función para obtener estadísticas de inicio de sesión fallidos
function detalle_fallidos() {
    echo -e "Intentos de inicio de sesión fallidos: $(grep "Failed password" $RUTA | wc -l)\n"
    echo -e "Detalle de Usuarios Fallidos:\n $(grep "Failed" $RUTA)\n"
}
# Función para obtener estadísticas de inicio de sesión exitosos
function detalle_exitosos() {
    echo -e "Intentos de inicio de sesión exitosos: $(grep "Accepted password" $RUTA | wc -l)\n"
    echo -e "Detalle de Usuarios Exitosos:\n $(grep "Accepted" $RUTA)\n"
}
function detalle_completo() {
    detalle_fallidos
    detalle_exitosos
    echo -e "Detalle completo:\n $(grep "Accepted\|Failed" $RUTA)\n"
}
