import json
import sys
from flask import Flask, jsonify
from WatchList import *
from E_Commerce_Repository import *

app = Flask(__name__)

repository: ECommerceRepository = ECommerceRepository()


@app.route("/", methods=["GET"])
def home():
    return jsonify('hello wooorld')

@app.route("/sampleWatchlist", methods=["GET"])
def getSampleWatchList():
    sample: WatchList = WatchList()
    sample.ProductGTIN = 1234
    sample.ProductModelNumber = 5678
    sample.ProductName = "testasd"
    sample.DesiredPrice = 2.02
    return json.dumps(sample.__dict__)

@app.route("/getWatchlist", methods=["GET"])
def getWatchList():
    currWatchList: list = list()
    currWatchList = repository.getCurrentWatchList()
    
    return json.dumps([item.__dict__ for item in currWatchList])

@app.route("/getUserInfo", methods=["GET"])
def getUserInfo():
    currUserInfo: UserInformation
    currUserInfo = repository.getCurrentUserInfo()
    
    return json.dumps(currUserInfo.__dict__)




#REMOVE LATER --------------------------------
app.debug = True
#^REMOVE LATER --------------------------------
app.run()