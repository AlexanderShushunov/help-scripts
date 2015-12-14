rem положить в корень проекта
set tomcat_home=C:\utils\apache-tomcat-7.0.57
set project_home=%cd%

xcopy /i /y /e %project_home%\web\html %tomcat_home%\webapps\adsalesproresources\html
xcopy /i /y /e %project_home%\web\css %tomcat_home%\webapps\adsalesproresources\css
xcopy /i /y /e %project_home%\web\img %tomcat_home%\webapps\adsalesproresources\img
xcopy /i /y /e %project_home%\web\js %tomcat_home%\webapps\adsalesproresources\js
xcopy /i /y /e %project_home%\web\l10n %tomcat_home%\webapps\adsalesproresources\l10n
xcopy /i /y /e %project_home%\web\xml %tomcat_home%\webapps\adsalesproresources\xml
xcopy /i /y /e %project_home%\web\xsl %tomcat_home%\webapps\adsalesproresources\xsl
xcopy /i /y /e %project_home%\ant\resources\pack-*.xml %tomcat_home%\webapps\adsalesproresources