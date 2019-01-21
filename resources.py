from flask_restful import Resource, reqparse
from flask import Flask, jsonify, request

from db import DataBase

import json

parser = reqparse.RequestParser()
parser.add_argument('username',help = 'This field cannot be blank',required = True)
parser.add_argument('password',help = 'This field cannot be blank',required = True)


#database = DataBase()er
#database.connect()

class UserRegistration(Resource):
    def post(self):
        data = parser.parse_args()
        #to do question if there is a user
        query = "INSERT INTO Users (Login,Password) VALUES('%s','%s') " % data['username'] % data['password']

        return database.query(query)


class UserLogin(Resource):
    def get(self):
        #data = parser.parse_args()
        login = request.authorization["username"]
        password = request.authorization["password"]

        #query = "SELECT * FROM Users WHERE Login = '%s'" % login
        #result = database.query(query)
        if login == 'Olka@gmail.com' and password =='Krystyna':
            return {'result':'Czesc Olka'}
        else:
            return {'result': 'password incorret'}
        '''
        if result is None:
            return {'result':'No such user'}

        if result['Password'] == password:
            return {'result': 'password correct'}
        else:
            return {'result': 'password incorrect'}
      '''
      
class UserLogoutAccess(Resource):
    def post(self):
        return {'message': 'User logout'}
      
      
class UserLogoutRefresh(Resource):
    def post(self):
        return {'message': 'User logout'}
      
class TokenRefresh(Resource):
    def post(self):
        return {'message': 'Token refresh'}
      
      
class AllUsers(Resource):
    def get(self):
        return {'message': 'List of users'}

    def delete(self):
        return {'message': 'Delete all users'}
      
      
class SecretResource(Resource):
    def get(self):
        return {
            'answer': 42
        }