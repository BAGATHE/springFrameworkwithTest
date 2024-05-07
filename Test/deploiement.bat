@echo off

set "TEMP=D:\itu\LICENCE-2\Semestre4\MrNiaina\springMVC\Test\temp"
set "TEMP_SRC=D:\itu\LICENCE-2\Semestre4\MrNiaina\springMVC\Test\temp_src"
set "WEB_SOURCE=D:\itu\LICENCE-2\Semestre4\MrNiaina\springMVC\Test\views"
set "lib=D:\itu\LICENCE-2\Semestre4\MrNiaina\springMVC\Test\lib"
set "config=D:\itu\LICENCE-2\Semestre4\MrNiaina\springMVC\Test\config"
set "SRC=D:\itu\LICENCE-2\Semestre4\MrNiaina\springMVC\Test\src"
set "WEBAPPS=C:\xampp\tomcat\webapps"
set "projectName=springMVC"

if exist "%TEMP%" (
    rmdir /s /q "%TEMP%"
)
if exist "%TEMP_SRC%" (
    rmdir /s /q "%TEMP_SRC%"
)
mkdir "%TEMP_SRC%"
mkdir "%TEMP%"
mkdir "%TEMP%\WEB-INF"
mkdir "%TEMP%\WEB-INF\classes"
mkdir "%TEMP%\WEB-INF\lib"
mkdir "%TEMP%\WEB-INF\views"

xcopy "%config%" "%TEMP%\WEB-INF\" /s /e /i
xcopy "%WEB_SOURCE%\*" "%TEMP%\WEB-INF\views\" /s /e /i
xcopy "%lib%\*" "%TEMP%\WEB-INF\lib\" /s /e /i

cd "%SRC%"
for /r %%F in (*.java) do (
    copy "%%F" "%TEMP_SRC%\"
)

cd "%TEMP_SRC%"
javac -cp "%lib%\*" -d "%TEMP%\WEB-INF\classes" *.java

cd "%TEMP%"

jar -cvf "%projectName%.war" .

xcopy /s /e /i /y "%projectName%.war" "%WEBAPPS%"
echo Déploiement du projet dans Tomcat effectué avec succès.

pause
