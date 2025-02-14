#!/bin/bash

TOKEN='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'
REPO='CarlosAndresTovar/Hackathon'

listdelete=()

response=$(curl -s -H "Authorization: token $TOKEN" "https://api.github.com/repos/$REPO/branches"  | grep -o '"name": "[^"]*' | sed 's/"name": "//; s/"//g')

for variable in $response; do
    commit=$(curl -s -H "Authorization: token $TOKEN" "https://api.github.com/repos/$REPO/branches/$variable")
    cleaned_response=$(echo "$commit" | tr -d '\n' | tr -d '\r')
    protected=$(echo "$cleaned_response" | jq -r '.protected')
    date=$(echo "$cleaned_response" | jq -r '.commit.commit.author.date')
    datevalidate=$(date -d "-2 days" +%Y-%m-%d)
    if [[ "$protected" == "false" ]]; then
        if [[ "$date" < "$datevalidate" ]]; then
            listdelete+=("$variable")
        fi
    fi
done

echo "Ramas a eliminar: ${branchesDelete[@]}"

for item in "${listdelete[@]}"; do
    curl -X DELETE -H "Authorization: token $TOKEN" \
         "https://api.github.com/repos/$REPO/git/refs/heads/$item"
done