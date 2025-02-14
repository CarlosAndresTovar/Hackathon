#!/bin/bash

TOKEN='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'
REPO='CarlosAndresTovar/Hackathon'

response=$(curl -s -H "Authorization: token $TOKEN" "https://api.github.com/repos/$REPO/branches"  | grep -o '"name": "[^"]*' | sed 's/"name": "//; s/"//g')

delete_file='list_branches.txt'

if [ -f "$delete_file" ]; then
    rm "$delete_file"
fi

for variable in $response; do
    commit=$(curl -s -H "Authorization: token $TOKEN" "https://api.github.com/repos/$REPO/branches/$variable")
    cleaned_response=$(echo "$commit" | tr -d '\n' | tr -d '\r')
    author=$(echo "$cleaned_response" | jq -r '.commit.commit.author.name')
    date=$(echo "$cleaned_response" | jq -r '.commit.commit.author.name')
    result=$(echo "$variable - $date - $author")
    echo "$result\n" >> list_branches.txt
done