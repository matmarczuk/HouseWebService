#!flask/bin/python
from flask import Flask
app = Flask(__name__)
from flask import Flask, jsonify
from flask import request

app = Flask(__name__)

@app.route('/postjson', methods=['POST'])
def post():
    print(request.is_json)
    content = request.get_json()
    #print(content)
    print(content['id'])
    print(content['name'])
    return 'JSON posted'


@app.route('/user', methods=['GET'])
def get():
    return jsonify({'tasks': tasks})


app.run(host= '0.0.0.0')
