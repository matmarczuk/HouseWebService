Simple python REST webservice connected with SQL database. Webservice is dedicated to Intelligent House android app. 


# Run

### Create mysql database 
When logged in to your mysql server type in console

`mysql> source <path_to_cloned_dir>\create_db.sql;`

### Fill database details in db.py file 

### Run webservice with the following command 

`FLASK_APP=run.py flask run --host=0.0.0.0`

*setting host = 0.0.0.0 enable to get access to other devicees in same wifi network

### Check webservice with POSTMAN
Ubuntu

`ifconfig` to get your IP in wifi network 

Adress to your webservice

`http://your_comp_ip:5000`
