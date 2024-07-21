#!/bin/bash

TOKEN='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'
REPO='CarlosAndresTovar/Hackathon'

while :
do
    read -p "Por favor, ingrese un título: " isCorrect
    if [[ $isCorrect =~ ^[a-zA-Z]{6,}\ #[0-9]+$ ]]; then
        title=$isCorrect
        break
    else
        echo "El titulo no cumple con la estructura requerida, Ejemplo #1234"
    fi
done

read -p "Ingrese la rama origen: " originBranch
read -p "Ingrese la rama destino: " destinationBranch

while :
do
    read -p "Ingrese la descripción del pull request: " bodyEntry
    if [[ $(echo $bodyEntry | wc -w) -ge 10 ]]; then
        body="$bodyEntry"
        echo "kjdsnkdnskjnd: $body"
        break
    else
        echo "La descripción no contiene como minimo 10 palabras"
    fi
done


PR_DATA=$(printf '{"title":"%s","body":"%s","head":"%s","base":"%s"}' \
          "$title" "$body" "CarlosAndresTovar:$originBranch" "$destinationBranch")

echo "$PR_DATA"

response=$(curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$REPO/pulls \
  -d "$PR_DATA"
)

echo "Respuesta de GitHub:"
echo "$response"