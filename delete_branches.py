from git import Repo 
import requests
from datetime import datetime, timedelta
from dotenv import load_dotenv
import os

load_dotenv()

TOKEN = os.getenv('GITHUB_TOKEN')

GET_COMMIT = 'https://api.github.com/repos/CarlosAndresTovar/Hackathon/branches/'
VALIDATE_BRANCH = 'https://api.github.com/repos/CarlosAndresTovar/Hackathon/branches/'

headers = {
    'Autorizacion': f'token {TOKEN}',
    'Accept': 'application/vnd.github.v3+json'
}

remote_name = 'origin'

repository = Repo('Hackathon')
repository.git.fetch(remote_name, '--prune')
remote_branches = [ref.name for ref in repository.remote(remote_name).refs]

def search_branch(branches = None):
    branch_to_delete = []
    if branches:
        for branch in branches[1:]:
            replace_branches = branch.replace('origin/', '')
            url_get_commits = f'{GET_COMMIT}{replace_branches}'
            url_validate = f'{VALIDATE_BRANCH}{replace_branches}'
            response_commits = requests.get(url_get_commits, headers)
            validate_delete = requests.get(url_validate, headers)
            if (response_commits.status_code == 200 and
                validate_delete.status_code == 200):

                commit = response_commits.json()
                delete_branch = validate_delete.json()
                last_commit = commit['commit']['commit']['author']['date']
                date_validate = datetime.now() - timedelta(days=2)
                date_to_delete = (
                    True
                    if datetime.strptime(last_commit, '%Y-%m-%dT%H:%M:%SZ').date()
                    < date_validate else False)
                if not delete_branch.get('protected', False) and date_to_delete:
                    branch_to_delete.append(replace_branches)
                    repository.git.push(remote_name, '--delete', replace_branches)
    return branch_to_delete

branch_deleted = search_branch(remote_branches)

if branch_deleted:
    print("Las ramas eliminas son: ", branch_deleted)
else:
    print('No se elimino ninguna rama')
