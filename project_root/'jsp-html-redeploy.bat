rem положить в корень проекта
set tomcat_home=C:\utils\apache-tomcat-7.0.57
set project_home=%cd%

xcopy /i /y /e %project_home%\web\WEB-INF\jsp  %tomcat_home%\webapps\adsalespro\WEB-INF\jsp
xcopy /i /y /e %project_home%\web\html  %tomcat_home%\webapps\adsalesproresources\html