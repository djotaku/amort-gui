import sys, webbrowser 
from PyQt4.QtCore import QDateTime, QObject, QUrl, pyqtSignal
from PyQt4.QtGui import QApplication
from PyQt4.QtDeclarative import QDeclarativeView
from subprocess import call
import amortization

#this class will emit success if photo is added to group
class updateGroup(QObject):
  
  now = pyqtSignal(int)
  
  def calculations(self, principle, interest, payments):
    #print "adddel: " + adddel #debugging
    #table = call("python /home/ermesa/bin/python/amortization/amortization.py -screen -P" + principle + "-i" + interest + "-n" + payments, shell=True)
    table = amortization.fromgui("csv",principle, interest, payments)
    #print "table: " + table #debugging
    self.now.emit(table)

  def launchwebsite(self,string):
    webbrowser.open(string)
    
app = QApplication(sys.argv)

update = updateGroup()

view = QDeclarativeView()
view.setSource(QUrl('amort-gui.qml'))
view.setResizeMode(QDeclarativeView.SizeRootObjectToView)

rootObject = view.rootObject()

rootObject.calculateit.connect(update.calculations) #sends signal

update.now.connect(rootObject.thetable) #tells it which function in qml gets that signal

view.setGeometry(100, 100, 400, 240)
view.show()

app.exec_()