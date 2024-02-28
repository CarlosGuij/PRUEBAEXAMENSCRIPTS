#!/bin/bash
#que pasándole por parámetro una ciudad me devuelva la calificación eco atendiendo a: 
#Si la media es inferior a 400 será ECO si es igual o superior será NO ECO

total_consumos=0
num_registros=0

while read -r linea; do
    ciudad=$(echo "$linea" | awk '{print $1}')
    consumo=$(echo "$linea" | awk '{print $4}')

    if [ "$ciudad" = "$1" ]; then
        total_consumos=$((total_consumos + consumo))
        num_registros=$((num_registros + 1))
    fi
done < "consumos.txt"

if [ $num_registros -gt 0 ]; then
    media_ciudad=$((total_consumos / num_registros))

    if [ $media_ciudad -lt 400 ]; then
        echo "Calificación ECO para la ciudad $1"
    else
        echo "Calificación NO ECO para la ciudad $1"
    fi  
fi