rem положить в корень проекта
set tomcat_home=C:\utils\apache-tomcat-7.0.57
set project_home=%cd%

cd %tomcat_home%\bin
call stop-and-clean.bat

cd %project_home%