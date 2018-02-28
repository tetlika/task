import json
import subprocess
import requests

CORRECT_RESPONSE={}
CORRECT_RESPONSE['price'] = 4

BACKENDS = str(subprocess.check_output("consul kv get -keys -http-addr=consul:8500 backends/ ", shell=True).decode('utf-8')).split('\n')

for BACKEND in BACKENDS:
    BACKEND_CLEAN=BACKEND.replace('backends/','')
    if BACKEND_CLEAN:
        try:
            response = requests.get('http://%s:8080/currency?price=2' % BACKEND_CLEAN)
        except:
            print("Backend %s failed" % BACKEND_CLEAN)

        if response.json() == CORRECT_RESPONSE:
            print("Backend %s gave correct response" % BACKEND_CLEAN)
        else:
            print("Backend %s failed to give correct response" % BACKEND_CLEAN)
