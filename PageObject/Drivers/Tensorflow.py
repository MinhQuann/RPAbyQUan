import requests
import certifi

response = requests.get('https://lab.connect247.vn', verify=certifi.where())
print(response.status_code)