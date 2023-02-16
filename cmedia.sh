#!/bin/bash

declare -A data

# Leer el archivo consumo.txt y almacenar los datos en un array
while read -r ciudad mes anio consumo; do
    data["$ciudad-$mes-$anio"]=$consumo
done < "consumo.txt"

# Obtener la ciudad y mes de consumo máximo
max_ciudad_mes=$(echo "${!data[@]}" | tr ' ' '\n' | sort -k2,2 -k3,3 -k1,1 | tail -n1)
max_ciudad=$(echo "$max_ciudad_mes" | cut -d '-' -f 1)
max_mes=$(echo "$max_ciudad_mes" | cut -d '-' -f 2)
max_anio=$(echo "$max_ciudad_mes" | cut -d '-' -f 3)

# Obtener la ciudad y mes de consumo mínimo
min_ciudad_mes=$(echo "${!data[@]}" | tr ' ' '\n' | sort -k2,2 -k3,3 -k1,1 | head -n1)
min_ciudad=$(echo "$min_ciudad_mes" | cut -d '-' -f 1)
min_mes=$(echo "$min_ciudad_mes" | cut -d '-' -f 2)
min_anio=$(echo "$min_ciudad_mes" | cut -d '-' -f 3)

# Imprimir resultados
echo "Ciudad de consumo máximo: $max_ciudad"
echo "Mes de consumo máximo: $max_mes"
echo "Año de consumo máximo: $max_anio"
echo "Ciudad de consumo mínimo: $min_ciudad"
echo "Mes de consumo mínimo: $min_mes"
echo "Año de consumo mínimo: $min_anio"
