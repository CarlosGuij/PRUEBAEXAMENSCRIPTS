#!/bin/bash

total=0

while read -r linea; do

sitio=$(echo "$linea" | awk '{print $1}')
consumo=$(echo "$linea" | awk '{print $4}')

if [ $1 = $sitio ]; then
    total=$((total+consumo))
fi

done < consumos.txt

echo "El consumo de $1 es $total"