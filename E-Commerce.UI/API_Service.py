import json
import httpx
from WatchList import *
from UserInformation import *

class APIService:

    def __init__(self):
        return
    # Flask server does not support http/2 so unable to do async requests
    """ async def getSampleWatchList(self):
        async with httpx.AsyncClient() as client:
            response = await client.get("http://localhost:5000/getSampleWatchlist")
            return response """

    def getWatchList(self) -> list:
        jsonResponse = json.loads(httpx.get("http://localhost:5000/getWatchlist").content)
        watchList = list()
        for item in jsonResponse:
            currItem: WatchList = WatchList()
            currItem.ProductGTIN = item['ProductGTIN']
            currItem.ProductModelNumber = item['ProductModelNumber']
            currItem.ProductName = item['ProductName']
            currItem.DesiredPrice = item['DesiredPrice']
            watchList.append(currItem)
        return watchList
    
    def getUserInfo(self) -> UserInformation:
        response = json.loads(httpx.get("http://localhost:5000/getUserInfo").content)
        info: UserInformation = UserInformation()
        info.userEmail = response['userEmail']
        return info


