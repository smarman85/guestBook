import requests
import json
import os

URL = '{0}'.format(os.environ['URL'])

def apiCall(programName):
    req = requests.get(URL + programName)
    jsonData = req.json()
    return jsonData
