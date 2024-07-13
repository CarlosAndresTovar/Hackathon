import requests
import json

TOKEN = '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'
REPOSITORY_BRANCHES = 'https://github.com/CarlosAndresTovar/Hackathon/branches'


headers = {
    'Autorizacion': f'token {TOKEN}',
    'Accept': 'application/vnd.github.v3+json'
}

def _get_branch():
    response = requests.get(REPOSITORY_BRANCHES, headers)
    if response.status_code == 200:
        try:
            branches = json.loads(response.text)
            lines = branches.get('payload').get('branches')
            branches_list = [lines.get('default').get('name')]
            for record in lines.get('active'):
                branches_list.append(record.get('name'))
            return branches_list
        except Exception as e:
            print('Errors: ', e)

def _get_description_branches(branches = None):
    if branches:
        for line in branches:
            url = f'https://api.github.com/repos/CarlosAndresTovar/Hackathon/branches/{line}'
            response = requests.get(url, headers)
            if response.status_code == 200:
                t = response.json()
                commit = t
    else:
        return None
        


branches = _get_branch()
_get_description_branches(branches)
