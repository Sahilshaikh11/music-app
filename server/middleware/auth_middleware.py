import os
from dotenv import load_dotenv
from fastapi import HTTPException, Header
import jwt

load_dotenv()

password_key = os.getenv("PASSWORD_KEY")

def auth_middleware(x_auth_token = Header()):
    try:
        # get the user token from the headers
        if not x_auth_token:
            raise HTTPException(401, 'No auth token, access denied!')
        # decode the token
        verified_token = jwt.decode(x_auth_token, password_key, ['HS256'])

        if not verified_token:
            raise HTTPException(401, 'Token verification failed, authorization failed!')
        # get the id from the token
        uid = verified_token.get('id')
        return {'uid' : uid, 'token': x_auth_token}

        # postgres database get the user information
    except jwt.PyJWTError:
        raise HTTPException(401, 'Invalid token, authorization failed!')