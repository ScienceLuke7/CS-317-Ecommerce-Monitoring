import json
import httpx
from WatchList import *
from UserInformation import *
from h11 import Response

class APIService:

    def __init__(self):
        return

    """ async def getWatchList(self) -> Response:
        async with httpx.AsyncClient() as client:
            response = await client.get("http://localhost:5000/watchlist")
            return response """

    def getWatchList(self) -> list:
        jsonResponse = httpx.get("http://localhost:5000/getWatchlist").content
        watchList = json.loads(jsonResponse)
        return watchList
    
    def getUserInfo(self) -> UserInformation:
        return httpx.get("http://localhost:5000/getUserInfo").content


