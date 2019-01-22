from flask_restful import Resource, reqparse
from flask import Flask, jsonify, request

from db import DataBase

import json,datetime

EditUserparser = reqparse.RequestParser()
EditUserparser.add_argument('name',help = 'This field cannot be blank',required = True)
EditUserparser.add_argument('surname',help = 'This field cannot be blank',required = True)
EditUserparser.add_argument('isOwner',help = 'This field cannot be blank',required = True)

EditGuestParser = reqparse.RequestParser()
EditGuestParser.add_argument('name',help = 'This field cannot be blank',required = True)
EditGuestParser.add_argument('surname',help = 'This field cannot be blank',required = True)
EditGuestParser.add_argument('plate',help = 'This field cannot be blank',required = True)

EditGarageParser = reqparse.RequestParser()
EditGarageParser.add_argument('plate',help = 'This field cannot be blank',required = True)

def dateconverter(o):
    if isinstance(o, datetime.datetime):
        return o.__str__()


database = DataBase()
database.connect()

class UserRegistration(Resource):
    def post(self):
        #data = parser.parse_args()
        #to do question if there is a user
        query = "INSERT INTO Users (Login,Password) VALUES('%s','%s') " % data['username'] % data['password']

        return database.query(query)


class UserLogin(Resource):
    def get(self):
        #data = parser.parse_args()
        login = request.authorization["username"]
        password = request.authorization["password"]


        #result = database.query(query)
        '''
        if login == 'Olka@gmail.com' and password =='Krystyna':
            return {'result':'Czesc Olka'}
        else:
            return {'result': 'password incorret'}
'''
        query = "SELECT * FROM Uzytkownik WHERE Login = '%s'" % login
        result = database.query(query)

        if result['Login'] == login and password == result['Haslo']:
            return{'name':result['Imie'],'surname':result['Nazwisko'],'id':result['fkMieszkanie'],'isAdmin':result['Wlasciciel']}
        else:
            return{'message':'Login or password incorrect'}
 
      
class UsersList(Resource):
    def get(self,flat_id):
        query = "SELECT * FROM Uzytkownik WHERE fkMieszkanie = '%d'" %flat_id
        result = database.listQuery(query)
        return result

class EditUser(Resource):
    def post(self,flat_id,user_id):
        data = EditUserparser.parse_args()
        query = "UPDATE Uzytkownik SET Imie = '%s',Nazwisko = '%s',Wlasciciel = '%d' WHERE idUzytkownik= '%d'" %(data['name'],data['surname'],int(data['isAdmin']),user_id)
        result = database.query(query)
        return {'result':'updated'}

class RoomsList(Resource):
    def get(self,flat_id):
        query = "SELECT * FROM Pomieszczenie WHERE fkMieszkanie = '%d'" %flat_id
        result = database.listQuery(query)

        jsonlist = []
        for item in result:
            item['id'] = item.pop('idPomieszczenie') #podmiana id
            item['type'] = item.pop('Typ')
            item['name'] = item.pop('Nazwa')
            jsonlist.append(item) 

        return {'rooms':jsonlist}

class ItemList(Resource):
    def get(self,flat_id,room_id):
        #kilka zapytan
        blinds_query = "SELECT * FROM Rolety WHERE fkPomieszczenie = '%d'" %room_id
        blinds = database.listQuery(blinds_query)
        
        lights_query = "SELECT * FROM Oswietlenie WHERE fkPomieszczenie = '%d'" %room_id
        lights = database.listQuery(lights_query)

        temp_query = "SELECT * FROM Temperatura WHERE fkPomieszczenie = '%d'" %room_id
        temp = database.query(temp_query)

        return{'blinds':blinds,'lights':lights,'tempNow':temp['Aktualna_temp'],'tempOutside':temp['Zewn_temp']}
class GarageList(Resource):
    def get(self,flat_id):
        query = "SELECT * FROM Miejsce_garazowe WHERE fkMieszkanie = '%d'" %flat_id
        result = database.listQuery(query)
        return{'garage': result}

class EditGarage(Resource):
    def post(self,flat_id,garage_id):
        data = EditGarageParser.parse_args()
        query = "UPDATE Miejsce_garazowe SET Nr_rejstracyjny = '%s' WHERE idMiejsce_garazowe = '%d'" %(data['plate'],garage_id) 

        return {'result': 'Garage updated'}


class GuestLIst(Resource):
    def get(self,flat_id):
        query = "SELECT * FROM Gosc WHERE fkMieszkanie = '%d'" %flat_id
        result = database.listQuery(query)

        jsonlist = []
        for item in result:
            item.pop('fkMieszkanie')
            item['id'] = item.pop('idGosc')
            item['name'] = item.pop('Imie')
            item['surname'] = item.pop('Nazwisko')
            item['plate'] = item.pop('Tablica_rejstracyjna')
            jsonlist.append(item) 

        return {'guests':jsonlist}

class EditGuest(Resource):
    def post(self,flat_id,guest_id):
        data = EditGuestParser.parse_args()
        query = "UPDATE Gosc SET Imie = '%s', Nazwisko = '%s',Tablica_rejstracyjna = '%s' WHERE idGosc = '%d'" %(data['name'],data['surname'],data['plate'],guest_id) 
        
        result = database.query(query)

        return{'result': 'Guest updated'}

class AlarmList(Resource):
    def get(self,flat_id):
        query = "SELECT * FROM Alarm WHERE fkMieszkanie = '%d'" %flat_id
        result = database.listQuery(query)
        #converted = json.dumps(result,default=dateconverter)
        
        for item in result:
            item['Data'] = item['Data'].strftime("%Y-%m-%d %H:%M:%S")
            item['date'] = item.pop('Data')
            item['desc'] = item.pop('Opis')
            item['id'] = item.pop('idAlarm')
            item.pop('fkMieszkanie')

        return{'alarms': result}

        
        

