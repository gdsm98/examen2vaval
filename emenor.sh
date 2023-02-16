#!/bin/bash

# Leer el archivo consumo.txt y almacenar los consumos por ciudad en un array asociativo
declare -A consumo
declare -A num_meses
while read -r ciudad mes anio consumo; do
    if [[ -v consumos["$ciudad"] ]]; then
        consumos["$ciudad"]=$((consumos["$ciudad"] + consumo))
        num_meses["$ciudad"]=$((num_meses["$ciudad"] + 1))
    else
        consumos["$ciudad"]=$consumo
        num_meses["$ciudad"]=1
    fi
done < "consumo.txt"

# Iterar por las ciudades y calcular su media de consumo
ciudad_menor_media=""
menor_media=-1
for ciudad in "${!consumos[@]}"; do
    consumo_total=${consumos[$ciudad]}
    num_total_meses=${num_meses[$ciudad]}
    media=$(echo "$consumo_total / $num_total_meses" | bc) # Dividir por el número de meses para obtener la media
    if [[ $menor_media -eq -1 || $media -lt $menor_media ]]; then
        ciudad_menor_media=$ciudad
        menor_media=$media
    fi
done

# Imprimir la ciudad con la media de consumo más baja
echo "La ciudad con la media de consumo más baja es $ciudad_menor_media con una media de $menor_media."
