#### Use this terminal command to create zip file for Lambda deployment 
#### zip lambda_package.zip lambda_function.py && mv lambda_package.zip ../../for_terraform/

import numpy as np

def lambda_handler(event, context):
    arr = np.random.randint(0, 10, (3, 3))
    return {
        "statusCode": 200,
        "body": {"message": "Hello from Lambda! I am updating this code to see if it works when I overwrite my shit zipfile PLUS new folder", "array": arr.tolist()}
    }