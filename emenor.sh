#!/bin/bash

# Leer el archivo consumo.txt y almacenar los consumos por ciudad en un array asociativo
declare -A consumo
while read -r ciudad mes anio consumo; do
    if [[ -v consumos["$ciudad"] ]]; then
        consumos["$ciudad"]=$((consumos["$ciudad"] + consumo))
    else
        consumos["$ciudad"]=$consumo
    fi
done < "consumo.txt"

# Iterar por las ciudades y calcular su media de consumo
ciudad_menor_media=""
menor_media=-1
for ciudad in "${!consumos[@]}"; do
    consumo_total=${consumos[$ciudad]}
    media=$(echo "scale=2; $consumo_total / 7" | bc) # Dividir por 7 para obtener la media
    if [[ $menor_media -eq -1 || $(echo "$media < $menor_media" | bc -l) -eq 1 ]]; then
        ciudad_menor_media=$ciudad
        menor_media=$media
    fi
done

# Imprimir la ciudad con la media de consumo más baja
echo "La ciudad con la media de consumo más baja es $ciudad_menor_media con una media de $menor_media."
