
# DEPRECATED FILE: USED AS BACKUP

""" import sys
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
        self.getCurrentWatchList()
        self.getCurrentUserInfo()
        self.setUIComponents(screen_size)
        self.show()

    def setUIComponents(self, screen_size: QSize):
      # self.vTopBar = QVBoxLayout()
      self.topBar = QHBoxLayout()
      # self.vTopBar = QVBoxLayout()
      # email -----------------------------------------------
      self.emailLabel = QPushButton("oijeroif")
      self.emailLabel.setStyleSheet("background-color: red;")
      # self.emailLabel.setFixedSize(200,30)
      # self.emailLabel.setText("Email: " + 'test@gmail.com')
      
      # self.mainLabel = QPushButton("asome")
      # self.mainLabel.setStyleSheet("background-color: green;")
      # self.mainLabel.setFixedSize(200,30)
      # self.mainLabel.setText("asfgre")
      # self.emailButton = QPushButton("Change Email")
      # self.emailButton.setCheckable(True)
      # self.emailButton.toggle()
      # self.emailButton.clicked.connect(lambda: self.toggleEmailInput())
      # self.emailButton.setStyleSheet('background-color: green;')
      # self.emailButton.setFixedSize(200,30)
      
      # self.emailInput = QInputDialog()
      # self.emailInput.setStyleSheet("background-color: orange;")
      # self.emailInput.setFixedSize(200, 30)

      self.topBar.addWidget(self.emailLabel)
      # self.topBar.addWidget(self.mainLabel)
      # self.vTopBar.addLayout(self.topBar)
      # self.topBar.addWidget(self.emailButton)
      # self.topBar.addWidget(self.emailInput)



      self.setStyleSheet("background-color: purple;")
      self.showMaximized()

    def toggleEmailInput(self):
      if self.emailButton.isChecked():
        print(self.emailInput.getText())

    def getCurrentWatchList(self):
      self.currentWatchList: list = self.apiService.getWatchList()
      print(self.currentWatchList)
      
    def getCurrentUserInfo(self):
      self.currentUserInfo: UserInformation = self.apiService.getUserInfo()
      print(self.currentUserInfo)

 """