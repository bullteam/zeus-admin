from flask import Flask, request
from flask_restful import Resource, Api, abort
from flask_cors import CORS
from permission_center import PermCenter


app = Flask(__name__)
api = Api(app)
CORS(app)


@app.before_request
def before_request():
    jwtoken = request.headers['Authorization'].split('Bearer ')[1]
    perm = PermCenter(jwtoken, 'finance-admin')
    
    # 读取用户信息
    user_info = perm.verify()
    print('user_info', user_info)
    
    # 进行权限验证
    permission, message = perm.check_permission(request.path)
    if not permission:
        abort(403, message=f'Permission Denied : {message}')


class Root(Resource):
    def get(self):
        abort(404, message='api not found')


api.add_resource(Root, '/')
