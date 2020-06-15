#!/bin/bash

function mostrar_menu(){
    clear
    echo "1) Mostrar elementos de la sucesion de Fibonacci quiere mostrar"
    echo "2) Mostrar número invertido"
    echo "3) Verificar si la cadena de caracteres es palindromo"
    echo "4) Mostrar cuantas lineas tiene el archivo"
    echo "5) Ordenar 5 números"
    echo "6) Mostrar cuantos archivos de cada tipo hay"
    echo "7) Salir"
    echo "--------------------------------------------------------------------------------"
}

function salir_saludando(){
    NOMBRE=$1
    echo "Adios $NOMBRE"
    sleep 2
}

--------------------------------------------------------------------
OPCION=0
mostrar_menu
while true; do
    read -p "Ingrese una opcion: " OPCION # Mensaje y read en la misma linea
    case $OPCION in
        1)  read -p "Ingrese cantidad de sucesiones que desee mostrar:" sucesion
            cero=0
            primero=1
            segundo=1
            echo "Elemento 0": $cero
            echo "Elemento 1": $primero
            echo "Elemento 2": $segundo
            i=3
            while [ $i -le $sucesion ]; do
            fibo=$(($primero + $segundo))
            primero=$segundo
            segundo=$fibo
            echo "Elemento "$i: $fibo
            i=$(($i+1))
            done;;

        2)  read -p "Ingrese numero que desee invertir:" num
            echo ${num} | rev;;

        3)  read -p "Ingrese caracteres que quiera verificar:" palabra
            
            aux=$(echo $palabra | rev)
            if [ $aux = $palabra ]; then
            echo "Es palindromo"
            else
            echo "No es palindromo" 
            fi;;

        4)  read -p "Ingrese ubicacion del archivo:" ubicacion
        lineas=$(cat ${ubicacion} | wc -l)
        echo "El archivo tiene" $lineas "lineas" ;;

        5) echo "Ingrese numeros que desee ordenar:"
           numeros=()
           for (( i=0; i<5; i++ ))
            do  
            read -p "$((i + 1))) " numeros[i]
            done

            for (( i=0; i<5; i++ ))
            do  
              for (( j=$((i + 1)); j<5; j++ ))
              do
                if [ ${numeros[i]} -gt ${numeros[j]} ]; then  
                  aux=${numeros[i]}
                  numeros[i]=${numeros[j]}
                  numeros[j]=${aux}
                fi
              done
            done
           
           echo "${numeros[*]}";;

        6) read -p "Ingrese la ubicacion del directorio:" ubicacion
	echo "Archivos totales:"        
	find ${ubicacion} -maxdepth 1 -type f | wc -l
	echo "Tipos de archivos en el directorio:"
	find $ubicacion -type f | sed -n 's/..*\.//p' | 		sort | uniq -c;;
        
	7)  salir_saludando `whoami`
            break;;

        *)  echo "Opcion incorrecta";;
    esac
done
exit 0
