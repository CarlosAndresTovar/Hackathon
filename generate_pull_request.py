import requests
from dotenv import load_dotenv
import os

load_dotenv()

TOKEN = "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"

headers = {
    'Authorization': f'token {TOKEN}',
    'Accept': 'application/vnd.github.v3+json'
}

url = f'https://api.github.com/repos/CarlosAndresTovar/Hackathon/pulls'

text_pull = str(input('Ingrese el titulo del Pull request: '))
origin = str(input('Ingrese la rama origen: '))
destination = str(input('Ingrese la rama destino: '))

data = {
    'title': text_pull,
    'body': text_pull,
    'head': origin,
    'base': destination
}

response = requests.post(url, json=data, headers=headers)