#!/bin/bash

cat image_bits.txt

mostrar_menu() {
    echo "Seleccione una opción"
    echo "1. Opción 1"
    echo "2. Opción 2"
    echo "3. Opción 3"
    echo "4. Salir"
}

manejar_opcion() {
    case $1 in
        1) echo "Has seleccionado la Opción 1";;
        2) echo "Has seleccionado la Opción 2";;
        3) echo "Has seleccionado la Opción 3";;
        4) echo "Saliendo..."; exit 0;;
        *) echo "Opción inválida";;
    esac
}

while true; do
    mostrar_menu
    read -p "Ingrese su opción: " opcion
    manejar_opcion $opcion
    echo
done