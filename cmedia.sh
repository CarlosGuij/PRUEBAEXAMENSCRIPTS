#!/bin/bash
#pasándole como parámetro una ciudad, me devuelva la media de sus consumos.

media=0
cont=0

while read -r linea; do
    ciudad=$(echo "$linea" | awk '{print $1}')
    consumo=$(echo "$linea" | awk '{print $4}')
    if [ "$ciudad" = "$1" ]; then
        media=$((media + consumo))
        cont=$((cont + 1))
    fi
done < "consumos.txt"

if [ "$cont" -gt 0 ]; then
    media=$((media / cont))
    echo "La media de $1 es $media"
fi