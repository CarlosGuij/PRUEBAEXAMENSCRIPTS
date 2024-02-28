#!/bin/bash

max_cons=0
min_cons=99999999
max_ciudad=""
min_ciudad=""
max_mes=""
min_mes=""
max_any=""
min_any=""

while  read -r linea; do    
    ciudad=$(echo $linea | awk '{print $1}')   
    mes=$(echo $linea | awk '{print $2}')
    any=$(echo $linea | awk '{print $3}')
    cons=$(echo $linea  | awk '{print $4}')       

    if [ $cons  -gt $max_cons ]; then   
	max_cons=$cons  
	max_ciudad=$ciudad      
	max_mes=$mes                    
	max_any=$any                            
    fi                                                     

    if [ $cons -lt $min_cons ] ; then                       
	min_cons=$cons                                
	min_ciudad=$ciudad          
	min_mes=$mes                                                 
	min_any=$any                                                        
    fi                                                           
done < "consumos.txt"   

echo "La ciudad con el consumo máximo es: "$max_ciudad""
echo "El mes con el consumo máximo fue en: "$max_mes""
echo "En el año "$max_any", se registró un consumo máximo de: "$max_cons""

echo "La ciudad con el consumo  mínimo es: "$min_ciudad""
echo "El mes con el consumo mínimo fue en: "$min_mes""
echo "En el año "$min_any", se registró un consumo mínimo de: "$min_cons""           
