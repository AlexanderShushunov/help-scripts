rem @ECHO OFF
CALL:init
CALL:stopServer
GOTO:eof

:init
SET SERVER_HOME=%CD%\..
SET VAR __STARTED=''
SET SERVER_PORT=8080
SET CUSTOM_LOG=c:\adsalespro-log
GOTO:eof

:stopServer
CALL:checkIfServerStarted
IF %__STARTED% NEQ '' CALL %SERVER_HOME%\bin\catalina.bat stop
CALL:waitWhenStoped
GOTO:eof

:pause
PING 1.1.1.1 -n 1 -w 2000 >NUL
GOTO:eof

:checkIfServerStarted
SET __STARTED=''
FOR /F %%I IN ('netstat -anp TCP^|findstr :%SERVER_PORT%^|findstr LISTENING') DO SET __STARTED='%%I'
GOTO:eof

:waitWhenStoped
CALL:checkIfServerStarted
IF %__STARTED% EQU '' (
	ECHO SERVER STOPPED
	CALL:clean	
) ELSE (
	ECHO .
	CALL:pause
	CALL:waitWhenStoped
)
GOTO:eof

:clean
RMDIR %SERVER_HOME%\webapps /S /Q
MKDIR %SERVER_HOME%\webapps
RMDIR %SERVER_HOME%\work /S /Q
RMDIR %SERVER_HOME%\logs /S /Q
RMDIR %CUSTOM_LOG% /S /Q
GOTO:eof