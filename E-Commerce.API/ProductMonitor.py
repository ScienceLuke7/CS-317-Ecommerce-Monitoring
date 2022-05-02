import json
from queue import Queue
from WatchList import *
from UserInformation import *
from E_Commerce_Repository import *
from Amazon_Repository import *
from Walmart_Repository import *
import threading
import time

class ProductMonitor:
    repository: ECommerceRepository = ECommerceRepository()

    def __init__(self):
        return

    def getWatchList(self, queue: Queue) -> list:
        while True:
            print("Getting Current Watchlist")
            currWatchList: list = list()
            watchList: list = list()

            currWatchList = self.repository.getCurrentWatchList()
            dump = json.dumps([item.__dict__ for item in currWatchList])
            load = json.loads(dump)
            for item in load:
                currItem: WatchList = WatchList()
                currItem.ProductGTIN = item['ProductGTIN']
                currItem.ProductModelNumber = item['ProductModelNumber']
                currItem.ProductName = item['ProductName']
                currItem.DesiredPrice = item['DesiredPrice']
                watchList.append(currItem)
            # print(watchList)
            queue.put(watchList)
            time.sleep(10)


# TODO: should be in a different file
if __name__ == "__main__":
    wlQueue = Queue(2)
    amznQueue = Queue(2)
    wlmtQueue = Queue(2)
    productMonitor = ProductMonitor()
    amznRepo = Amazon_Repository()
    wlmtRepo = Walmart_Repository()

    wlThread = threading.Thread(target=productMonitor.getWatchList, args=[wlQueue])
    # amznThread = threading.Thread(target=amznRepo.obtainAmazonProductInfo, args=[amznQueue])
    # wlmtThread = threading.Thread(target=wlmtRepo.obtainAmazonProductInfo, args=[wlmtQueue])

    wlThread.start()
    # amznThread.start()
    # wlmtThread.start()

    previousWatchlist: list = list()
    currentWatchlist: list = list()

    while True:
        if wlQueue.not_empty:
            currentWatchlist = wlQueue.get()
            print("Current Watchlist:\n")
            print(json.dumps([item.__dict__ for item in currentWatchlist]))
        if ((len(previousWatchlist) != len(currentWatchlist))):
            # call e-commerce apis with function
            pass
        else:
            for currItem in currentWatchlist:
                productsExist = next((pastItem for pastItem in previousWatchlist 
                    if pastItem.ProductGTIN == currItem.ProductGTIN 
                    and pastItem.ProductModelNumber == currItem.ProductModelNumber), None)
                isInPrevious = True if productsExist else False
                if not isInPrevious:
                    # call e-commerce apis with function
                    break
