import requests
from datetime import datetime
from dotenv import load_dotenv
import os

load_dotenv()

TOKEN = os.getenv('GITHUB_TOKEN')

REPOSITORY_BRANCHES = 'https://api.github.com/repos/CarlosAndresTovar/Hackathon/branches'

headers = {
    'Autorizacion': f'token {TOKEN}',
    'Accept': 'application/vnd.github.v3+json'
}

def _get_branch():
    response = requests.get(REPOSITORY_BRANCHES, headers)
    if response.status_code == 200:
        try:
            branches = response.json()
            list_branch = [branch['name'] for branch in branches]
            return list_branch
        except Exception as e:
            print('Errors: ', e)

def _get_description_branches(branches = None):
    if branches:
        result = 'Ultimos cambios\n\n'
        file_description_branches = 'file_description_branches.txt'
        for line in branches:
            url = f'https://api.github.com/repos/CarlosAndresTovar/Hackathon/branches/{line}'
            response = requests.get(url, headers)
            if response.status_code == 200:
                result_json = response.json()
                commit = result_json.get('commit').get('commit').get('author')
                date = datetime.strptime(commit.get('date'), '%Y-%m-%dT%H:%M:%SZ')
                date_formated = datetime.strftime(date, '%Y-%m-%d %H:%M:%S')
                result += f"{line} - {date_formated} - {commit.get('name')}\n\n"
                with open(file_description_branches, 'w') as archivo:
                    archivo.write(result)
            else:
                print("Se presento un error")
        print("Archivo generado con exito")
        
branches = _get_branch()
_get_description_branches(branches)
