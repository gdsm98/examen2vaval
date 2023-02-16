#!/bin/bash

while true; do
    # Pedir al usuario que introduzca la ciudad
    read -p "Introduce el nombre de la ciudad: " ciudad

    # Comprobar si la ciudad está en la lista de consumos
    case $ciudad in
        Valencia|Barcelona|Madrid)
            break;;
        *)
            echo "Ciudad incorrecta. Por favor, introduce una ciudad válida (Valencia, Barcelona o Madrid)." ;;
    esac
done

# Pedir al usuario que introduzca el mes y el año
read -p "Introduce el mes y el año en formato MM YYYY: " mes anyo

# Calcular el total de consumo de la ciudad para el mes y año especificados
total=0
while read c m a consumo; do
    if [[ $c == $ciudad && $m == $mes && $a == $anyo ]]; then
        total=$((total + consumo))
    fi
done < consumos.txt

# Mostrar el resultado al usuario
echo "El consumo total de $ciudad en $mes $anyo fue de $total."

