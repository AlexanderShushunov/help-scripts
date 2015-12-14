set websphere_home=C:\WebSphere\AppServer
set profile_home=%websphere_home%\profiles\AppSrv01
set project_home=%cd%

call %profile_home%/bin/wsadmin -lang jython -f installApplication.py adsalespro.war

cd %project_home%
