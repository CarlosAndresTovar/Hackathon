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
    echo "4. Despliegue de contenedor"
    echo "5. Iniciar contenedor"
    echo "6. Parar contenedor"
    echo "7. Reiniciar contenedor"
    echo "8. Ver recursos del contenedor"
    echo "9. Salir"
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
        3) echo "Generando pull request..."
            bash pull_request.sh;;
        4) echo "Generando contenedor..."
            bash generate_container.sh;;
        5) echo "Iniciando contenedor..."
            bash start_container.sh;;
        6) echo "Parando contenedor..."
            bash stop_container.sh;;
        7) echo "Reiniciando contenedor..."
            bash restart_container.sh;;
        8) echo "Ver recursos del contenedor..."
            bash log_resources.sh;;
        9) echo "Saliendo..."; exit 0
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