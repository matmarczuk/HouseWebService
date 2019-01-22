from flask import Flask
from flask_restful import Api

app = Flask(__name__)
api = Api(app)

import views,resources

api.add_resource(resources.UserLogin, '/login')
api.add_resource(resources.UsersList, '/flat/<int:flat_id>/users')
api.add_resource(resources.EditUser,   '/flat/<int:flat_id>/users/<int:user_id>')
api.add_resource(resources.RoomsList,   '/flat/<int:flat_id>/rooms')
api.add_resource(resources.ItemList,    '/flat/<int:flat_id>/rooms/<int:room_id>')
api.add_resource(resources.GarageList, '/flat/<int:flat_id>/garage')
api.add_resource(resources.EditGarage, '/flat/<int:flat_id>/garage/<int:garage_id>')
api.add_resource(resources.GuestLIst, '/flat/<int:flat_id>/guests')
api.add_resource(resources.EditGuest, '/flat/<int:flat_id>/guests/<int:guest_id>')
api.add_resource(resources.AlarmList, '/flat/<int:flat_id>/alarms')