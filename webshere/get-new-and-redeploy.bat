set project_home=%cd%
set shared_folder=\\EPRUTVEW0108\share

xcopy /i /y %shared_folder%\adsalespro.war  %project_homer%
xcopy /i /y %shared_folder%\adsalesproresources.war  %project_home%
xcopy /i /y %shared_folder%\adsalespro.ear  %project_home%
call clean-profile.bat
call redeploy-war.bat