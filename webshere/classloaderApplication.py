# jython script for standalone WAS installation
# set class loader policy for web application and its modules
# ./wsadmin.sh -lang jython -f ~/classloaderApplication.py
# (c) Andre Petrov, 2014
import sys

if (len(sys.argv) > 0):
    application = sys.argv[0] + "_war"
else:
    print "need an argument - application name"
    sys.exit (1)

policy = "PARENT_LAST"

# find application deployment id
deployments = AdminConfig.getid("/Deployment:" + application + "/")
deploymentObject = AdminConfig.showAttribute(deployments, "deployedObject")

# web application class loader
print "set class loader policy for " + application
AdminConfig.modify(AdminConfig.showAttribute(deploymentObject, "classloader"),[["mode", policy]])

# modules class loader
print "set class loader policy for " + application + " mudules"
myModules = AdminConfig.showAttribute(deploymentObject, 'modules')
myModules = myModules[1:len(myModules)-1].split(" ")
for module in myModules:
     if (module.find('WebModuleDeployment')!= -1):
        AdminConfig.modify(module, [['classloaderMode', policy]])

# save changes
print "saving configuration"
AdminConfig.save()
print "Finished."
