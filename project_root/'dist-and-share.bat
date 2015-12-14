rem положить в корень проекта
set project_home=%cd%
set shared_folder=d:\share

cd %project_home%\ant
call build distDraft

xcopy /i /y %project_home%\dist\adsalespro.war  %shared_folder%
xcopy /i /y %project_home%\dist\adsalesproresources.war  %shared_folder%
xcopy /i /y %project_home%\dist\adsalespro.ear  %shared_folder%

cd %project_home%

