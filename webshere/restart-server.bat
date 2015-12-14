set websphere_home=C:\WebSphere\AppServer
set profile_home=%websphere_home%\profiles\AppSrv01
set project_home=%cd%
set server_name=server1

cd %profile_home%/bin

call stopServer %server_name%
call startServer %server_name%

cd %project_home%
