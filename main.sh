#!/bin/bash

cat image_bits.txt

mostrar_menu() {
    
    echo "Seleccione una opción"
    echo ""
    echo "Reto 1"
    echo ""
    echo "1. Listar ramas y generar archivo plano."
    echo "2. Eliminar ramas que no tengan cambios hace mas de 2 dias y no este protegida."
    echo "3. Generar pull request"
    echo ""
    echo "Reto 2"
    echo "4. Despliegue de contenedor"
    echo "5. Iniciar contenedor"
    echo "6. Parar contenedor"
    echo "7. Reiniciar contenedor"
    echo "8. Ver logs del contenedor"
    echo "9. Ver recursos del contenedor"
    echo "10. Eliminar contenedores que no se utilicen"
    echo "11. Salir"
    echo ""
}

manejar_opcion() {
    case $1 in
        1) echo "Listando ramas y generando archivo...\n"
            sh Reto1/list_branches.sh
           echo "";;
        2) echo "Buscando ramas a eliminar..."
           echo ""
            bash Reto1/delete_branches.sh;;
        3) echo "Generando pull request..."
            bash Reto1/pull_request.sh;;
        4) echo "Generando contenedor..."
            bash Reto2/generate_container.sh;;
        5) echo "Iniciando contenedor..."
            bash Reto2/start_container.sh;;
        6) echo "Parando contenedor..."
            bash Reto2/stop_container.sh;;
        7) echo "Reiniciando contenedor..."
            bash Reto2/restart_container.sh;;
        8) echo "Ver recursos del contenedor..."
            bash Reto2/resources.sh;;
        9) echo "Ver logs del contenedor..."
            bash Reto2/log.sh;;
        10) echo "Eliminando contenedores..."
            bash Reto2/delete_containers.sh;;
        11) echo "Saliendo..."; exit 0
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