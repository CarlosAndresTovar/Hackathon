#!/bin/bash

cat image_bits.txt

mostrar_menu() {
    
    echo "Seleccione una opción"
    echo ""
    echo "Reto 1"
    echo ""
    echo "1. Listar ramas y generar archivo plano"
    echo "2. Eliminar ramas no tengan cambios hace mas de 2 dias y no este protegida"
    echo "3. Generar pull request"
    echo ""
    echo "Reto 2"
    echo ""
    echo "4. Salir"
    echo ""
}

manejar_opcion() {
    case $1 in
        1) echo "Listando ramas y generando archivo...\n"
            sh list_branches.sh
           echo "";;
        2) echo "Buscando ramas a eliminar..."
           echo ""
            bash delete_branches.sh;;
        3) echo "Generando pull request...";;
        4) echo "Saliendo..."; exit 0
           echo "";;
        *) echo "Opción inválida";;
    esac
}

while true; do
    mostrar_menu
    read -p "Ingrese su opción: " opcion
    manejar_opcion $opcion
    echo
done