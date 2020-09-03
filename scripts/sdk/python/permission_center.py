from flask_restful import abort
import requests
import jwt

class PermCenter:
    def __init__(self, token, domain):
        self.token = token
        self.domain = domain

        self.public_key = '''-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC/TYKuXsgYdoICfEZOiy1L12Cb
yPdudhrCjrjwVcIrhGNn6Udq/SY5rh0ixm09I2tXPWLYuA1R55kyeo5RPFX+FrD+
mQwfJkV/QfhaPsNjU4nCEHFMtrsYCcLYJs9uX0tJdAtE6sg/VSulg1aMqCNWvtVt
jrrVXSbu4zbyWzVkxQIDAQAB
-----END PUBLIC KEY-----'''
        self.center_service = 'http://api.admin.bullteam.cn'

    def check_permission(self, path):
        url = self.center_service + '/user/perm/check'
        headers = {
            'Authorization': 'Bearer ' + self.token,
            'Content-Type': 'application/x-www-form-urlencoded',
        }
        data = {
            'domain': self.domain,
            'perm': path
        }
        r = requests.post(url, headers=headers, data=data)
        perm = r.json()
        # print(perm)
        return perm['code'] == 0, perm['msg']

    def verify(self):
        try:
            user_info = jwt.decode(self.token, self.public_key, algorithms='RS256')
            return user_info
        except Exception as e:
            msg = f'Invalid Token - {e}'
            # print(msg)
            abort(403, message=msg)