#!/bin/bash
#que calcule qué ciudad o ciudades han tenido un consumo decreciente a lo largo del año 2022.

ciudad_decreciente=0
consumo_mayor=0
consumo_menor=999999

while read -r linea; do
    ciudad=$(echo "$linea" | awk '{print $1}')
    consumo=$(echo "$linea" | awk '{print $4}')

if [ "$consumo" -gt "$consumo_mayor" ]; then
        consumo_mayor="$consumo"
        ciudad_mayor="$ciudad"
    fi

if [ "$consumo" -lt "$consumo_menor" ]; then
        consumo_menor="$consumo"
        ciudad_menor="$ciudad"
    fi

if [ "$ciudad_anterior" ] && [ "$ciudad" = "$ciudad_anterior" ]; then
        if [ "$consumo" -lt "$consumo_anterior" ]; then
            ciudad_decreciente="$ciudad"
        fi
    fi
 consumo_anterior="$consumo"
    ciudad_anterior="$ciudad"
done < "consumos.txt"

if [ -z "$ciudad_decreciente" ]; then
    echo "La ciudad donde el consumo ha sido decreciente es $ciudad_decreciente."
else
    echo "No hay ciudades donde el consumo haya sido decreciente."
fi