rem положить в корень проекта
set tomcat_home=C:\utils\apache-tomcat-7.0.57
set project_home=%cd%

xcopy /i /y /e %project_home%\web\css %tomcat_home%\webapps\adsalesproresources\css
xcopy /i /y /e %project_home%\web\js %tomcat_home%\webapps\adsalesproresources\js
xcopy /i /y /e %project_home%\ant\resources\pack-*.xml %tomcat_home%\webapps\adsalesproresources