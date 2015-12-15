# jython script for standalone WAS installation
# remove / install web application
# ./wsadmin.sh -lang jython -f ~/installApplication.py /path/to/application.war [/context]
# (c) Andre Petrov, 2014

import os, sys, java

lineSeparator = java.lang.System.getProperty("line.separator")

if (len(sys.argv) > 0):
    path = sys.argv[0]
else:
    print "\n ### Need one mandatory argument - path to application.war file, second argument is optional - context root"
    sys.exit(1)

# check file exists
if (os.path.isfile(path) != 1):
    print "\n ### Incorrect path to file name: " + path
    sys.exit(2)

# extract application name from full path to war file
dotPosition = path.rfind(".")
if (dotPosition == -1):
    dotPosition = len(path)
slashPosition = path.rfind("/")
application = path[slashPosition+1:dotPosition]
applicationName = application + "_war"

# prepare context root from command line or application name
if (len(sys.argv) > 1):
    contextRoot = sys.argv[1]
else:
    contextRoot = application

# get cell,node,server names
objNameString = AdminControl.completeObjectName("WebSphere:type=Server,*")
cellName = AdminControl.getAttribute(objNameString, "cellName")
nodeName = AdminControl.getAttribute(objNameString, "nodeName")
serverName = AdminControl.getAttribute(objNameString, "name")

print "\n ### Going to install " + application + " on cell name: " + cellName + " node name: " + nodeName + " server name: " + serverName + " with context: " + contextRoot

# check if application already installed and uninstall if needed
if AdminConfig.getid("/Deployment:" + applicationName + "/"):
    print "\n ### Application is already deployed, uninstalling current version"
    AdminApp.uninstall(applicationName)
    AdminConfig.save()

# install application into defaul virtual server
options = "[-server " + serverName + " -node " + nodeName + " -appname " + applicationName + " -contextroot " + contextRoot + " -defaultbinding.virtual.host default_host -usedefaultbindings]"
print "\n ### Trying to install application"
AdminApp.install(path, options)
AdminConfig.save();

# check if application has been installed
if AdminConfig.getid( "/Deployment:" + applicationName + "/"):
    print "\n ### Application installed successfully: " + applicationName
else:
    print "\n ### Application installation failed: " + applicationName
    sys.exit(3)

print "CHecking if the app is ready to start"
import time
result = AdminApp.isAppReady(applicationName)
while (result == "false"):   ### Wait 5 seconds before checking again
    time.sleep(5)   
    result = AdminApp.isAppReady(applicationName)
print("Starting application...")

print "Getting appManager"

appManager=AdminControl.queryNames('type=ApplicationManager,cell='+cellName+',node='+nodeName+',process='+serverName+',*')
print "Attempting to start an app"
AdminControl.invoke(appManager,'startApplication', applicationName)
print "Started"
