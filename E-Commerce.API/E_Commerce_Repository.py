import pyodbc as po
from WatchList import *
from UserInformation import *

class ECommerceRepository:

    def __init__(self):
        self.__server = 'cs-317-project-db.cclvzdrff6ow.us-east-1.rds.amazonaws.com'
        self.__database = 'ECommerceMonitorDB'
        self.__username = 'admin_user'
        self.__password = 'cs317dbpassword'
        self.__dbConnectionString = 'DRIVER={ODBC Driver 17 for SQL Server};SERVER=' + self.__server+';DATABASE='+self.__database+';UID='+self.__username+';PWD=' + self.__password
        return

    def getCurrentWatchList(self) -> list:
        try:
            watchList: list = list()

            cnxn = po.connect(self.__dbConnectionString)
            cursor = cnxn.cursor()

            storedProc = "EXEC [dbo].[uspCurrentWatchList_Get]"

            cursor.execute(storedProc)

            row = cursor.fetchone()
            while row:
                currRow: WatchList = WatchList()
                currRow.ProductGTIN = row[0]
                currRow.ProductModelNumber = row[1]
                currRow.ProductName = row[2]
                currRow.DesiredPrice = float(row[3])
                
                watchList.append(currRow)

                row = cursor.fetchone()

            cursor.close()
            del cursor
        
            cnxn.close()
            return watchList
        except Exception as e:
            print(e)

    def getCurrentUserInfo(self) -> UserInformation:
        try:
            userInfo: UserInformation = UserInformation()

            cnxn = po.connect(self.__dbConnectionString)
            cursor = cnxn.cursor()

            storedProc = "EXEC [dbo].[uspCurrentUserInfo_Get]"

            cursor.execute(storedProc)

            row = cursor.fetchone()
            userInfo.userEmail = row[0]
            
            cursor.close()
            del cursor
        
            cnxn.close()
            return userInfo
        except Exception as e:
            print(e)


