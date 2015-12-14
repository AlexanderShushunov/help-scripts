rem положить в корень проекта
set tomcat_home=C:\utils\apache-tomcat-7.0.57
set project_home=%cd%

call 'tomcat-stop-and-clean.bat

cd %project_home%\ant
call build deploy

cd %tomcat_home%\bin
call catalina.bat jpda start

cd %project_home%

