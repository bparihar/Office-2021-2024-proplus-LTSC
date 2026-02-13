@echo off
title Office Professional Installer
color 0A

:: Check Admin
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting Administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

:menu
cls
echo ======================================
echo        OFFICE INSTALLER MENU
echo ======================================
echo.
echo 1. Install Office 2021 ProPlus
echo 2. Install Office 2024 LTSC ProPlus
echo 3. Exit
echo.
set /p choice=Enter your choice (1-3): 

if "%choice%"=="1" goto process2021
if "%choice%"=="2" goto process2024
if "%choice%"=="3" exit
goto menu

:uninstall
echo.
echo Removing existing Microsoft Office...
cd /d "%~dp0"
setup.exe /configure remove.xml
echo Uninstall completed.
timeout /t 5 >nul
goto :eof

:process2021
call :uninstall
echo Installing Office 2021 ProPlus...
setup.exe /configure config2021.xml
echo Installation Complete.
pause
exit

:process2024
call :uninstall
echo Installing Office 2024 LTSC ProPlus...
setup.exe /configure config2024.xml
echo Installation Complete.
pause
exit
