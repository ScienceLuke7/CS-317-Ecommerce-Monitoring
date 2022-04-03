import sys
from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtSql import *
from API_Service import *

class Window(QMainWindow):
    def __init__(self, screen_size: QSize):
        super().__init__()
        self.apiService: APIService = APIService()
        self.setWindowTitle("Product Monitor")
        self.setUIComponents(screen_size)
        self.getCurrentWatchList()
        self.show()

    def setUIComponents(self, screen_size: QSize):
      self.menuBar = QMenuBar(self)

      """ 
      doesn't work for some reason
      font = QFont()
      font.setFamily("Arial")
      font.setPointSize(32) """

      self.label = QLabel(self)
      self.label.setText("Hello Wooorld")
    #   self.label.setFont(font)
      self.label.move(screen_size.width()/2, screen_size.height()/2)

      self.showMaximized()
      
    def getCurrentWatchList(self):
      result: list = self.apiService.getWatchList()
      print(result)
      print("\n\n")
      
      result_2: UserInformation = self.apiService.getUserInfo()
      print(result_2)
