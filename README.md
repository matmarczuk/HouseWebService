
## Short description
Simple python REST webservice connected with SQL database. Webservice is dedicated to Intelligent House android app, but can easily be adjusted to your individual needs. 

## How to run

### Create mysql database 
When logged in to your mysql server type in console

`mysql> source <path_to_cloned_dir>\create_db.sql;`

### Insert some example data to db

`mysql> source <path_to_cloned_dir>\create_db.sql;`

### Fill database details in db.py file 
`connection = pymysql.connect(host='<hostt_name>',
                                    user='<user>',
                                    password ='<password>',
                                    db='InteligentHouse',
                                    autocommit=True,
                                    cursorclass=pymysql.cursors.DictCursor)`
### Run webservice with the following command 

`FLASK_APP=run.py flask run --host=0.0.0.0`

*setting host = 0.0.0.0 enable to get access to other devicees in same wifi network

### Check webservice with POSTMAN
Ubuntu

`ifconfig` to get your IP in wifi network 

Your computer IP will be adress of webservice

`http://your_comp_ip:5000`
