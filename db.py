import pymysql


class DataBase:
    cur = None
    def connect(self):
        connection = pymysql.connect(host='localhost',
                                    user='testuser',
                                    password ='test623',
                                    db='InteligentHouse',
                                    autocommit=True,
                                    cursorclass=pymysql.cursors.DictCursor)
        if connection.open:
            print ("Succes to connect db")
        else:
            print ("Fail to connect db")

        self.cur = connection.cursor()
    
    def query(self,sql):
        self.cur.execute(sql)
        return self.cur.fetchone()
        
    def listQuery(self,sql):
        self.cur.execute(sql)
        return self.cur.fetchall()


