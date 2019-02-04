import requests
import json
import os
from pathlib import Path
from dotenv import load_dotenv

env_path = str(Path('.') / '.env')
load_dotenv(dotenv_path=env_path)
URL = os.environ['URL']

def apiCall(programName):
    req = requests.get(URL + programName)
    jsonData = req.json()
    return jsonData
