@echo off
:: Check for admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting Administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

echo Running Office 2024 LTSC Installation...
echo.

cd /d "%~dp0"
setup.exe /configure config.xml

echo.
echo Installation process completed.
pause
