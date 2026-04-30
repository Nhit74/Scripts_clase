@echo off

:menu
cls
echo "[ a ] Activar mode de seguretat "
echo "[ b ] Activar mode de tecnic"
echo "[ c ] Restaurar sistema"
echo "[ s ] Sortir"

set /p opcio="Escriu la opcio que vols: "
if "%opcio%"=="a" goto :a
if "%opcio%"=="b" goto :b
if "%opcio%"=="c" goto :c
if "%opcio%"=="s" goto :s

:a
cls
echo "Opcio A"
REG ADD "Equipo\HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoControlPanel /t REG_DWORD /d 1 /
REG ADD "Equipo\HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f
pause
goto :menu
:b
cls
echo "Opcio B"
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
pause
goto :menu
:c
cls
echo "Opcio C"
REG IMPORT "C:\Users\ALUMNE\Documents\bakup_seguretat.reg"
pause
goto :menu



:s
cls
echo Adeu
echo.
echo.
TASKKILL /F /IM cmd.exe /T