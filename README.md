# Run
Run with the following command 

`FLASK_APP=run.py flask run --host=0.0.0.0`

Ubuntu 

`ifconfig` to get your IP in wifi network

Webservice is now available in same wifi network

`http://your_comp_ip:5000`

# Functions

GET login - authorization

`http://your_comp_ip:5000/login` login and password in header (login:password)

return value 

{
  'result':'password incorrect'
}

{
  'result':'Czesc Olka'
}
