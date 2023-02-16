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

# Inicializar las variables de máximo y mínimo consumo
max_consumo=0
min_consumo=99999999

# Inicializar las variables de ciudad, mes y año correspondientes a los consumos máximo y mínimo
max_ciudad=""
max_mes=""
max_anyo=""
min_ciudad=""
min_mes=""
min_anyo=""

# Buscar el máximo y mínimo consumo para la ciudad y mes/año especificados
while read c m a consumo; do
    if [[ $c == $ciudad && $m == $mes && $a == $anyo ]]; then
        if (( consumo > max_consumo )); then
            max_consumo=$consumo
            max_ciudad=$ciudad
            max_mes=$mes
            max_anyo=$anyo
        fi
        if (( consumo < min_consumo )); then
            min_consumo=$consumo
            min_ciudad=$ciudad
            min_mes=$mes
            min_anyo=$anyo
        fi
    fi
done < consumos.txt

# Mostrar los resultados al usuario
echo "El consumo total de $ciudad en $mes $anyo fue de $total."
echo "El máximo consumo fue de $max_consumo en $max_ciudad en $max_mes $max_anyo."
echo "El mínimo consumo fue de $min_consumo en $min_ciudad en $min_mes $min_anyo."
