#!/bin/bash
#que me devuelva la ciudad donde la media de consumos es menor.


ciudad_menor_media=0
menor_media=9999999

while read -r linea; do
    ciudad=$(echo "$linea" | awk '{print $1}')
    consumo=$(echo "$linea" | awk '{print $4}')
    cont=0
    suma=0

    while read -r linea2; do
        ciudad2=$(echo "$linea2" | awk '{print $1}')
        consumo2=$(echo "$linea2" | awk '{print $4}')
        if [ "$ciudad" = "$ciudad2" ]; then
            cont=$((cont + 1))
            suma=$((suma + consumo2))
        fi
    done < "consumos.txt"

    if [ "$cont" -gt 0 ]; then
        media=$((suma / cont))
        if [ "$media" -lt "$menor_media" ]; then
            ciudad_menor_media="$ciudad"
            menor_media="$media"
        fi
    fi
done < "consumos.txt"

echo "La ciudad donde la media de consumos es menor es $ciudad_menor_media"