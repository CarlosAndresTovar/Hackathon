import requests
import re

TOKEN = "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"

headers = {
    'Authorization': f'token {TOKEN}',
    'Accept': 'application/vnd.github.v3+json'
}

url = f'https://api.github.com/repos/CarlosAndresTovar/Hackathon/pulls'

def validate_text():
    result = False
    text_pull = ''
    while result == False:
        text_pull = str(input('Ingrese el titulo del Pull request: '))
        if text_pull:
            if re.match(r'^[a-zA-Z]{6,} #\d+$', text_pull):
                result = True
            else:
                print('''
                      Esta mal formada las estructura del titulo, tiene que tener esta forma; Ejemplo #1234
                      ''')
                result = False
    return text_pull

title = validate_text()

origin = str(input('Ingrese la rama origen: '))
destination = str(input('Ingrese la rama destino: '))

data = {
    'title': title,
    'body': '',
    'head': origin,
    'base': destination
}

response = requests.post(url, json=data, headers=headers)