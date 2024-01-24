import pymysql

class DBmanager :
    def DBOpen(self, host, port, dbname, id, pw) :
        try :
            self.con = pymysql.connect(host=host, port=port, db=dbname,
                                       user=id, passwd=pw, charset="euckr")
            return True
        except :
            return False
    
    def DBClose(self) :
        self.con.close()
        
    def RunSql(self, sql) :
        try :
            self.cursor = self.con.cursor() 
            self.cursor.execute(sql)
            self.con.commit()
            self.cursor.close();
            return True
        except :
            return False
    
    def OpenQuery(self, sql) :
        try :
            self.cursor = self.con.cursor() 
            self.cursor.execute(sql)
            self.data = self.cursor.fetchall()
            self.num_fields = len(self.cursor.description)
            return True
        except :
            return False
        
    def CloseQuery(self) :
        self.cursor.close()
        
    def GetTotal(self) :
        return len(self.data)
    
    def GetValue(self, index, column) :
        count = -1
        for name in self.cursor.description :
            count = count + 1
            if name[0] == column :
                return self.data[index][count]
        return ""
        
            
            