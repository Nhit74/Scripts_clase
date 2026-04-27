@echo off

title Reg_Tool_2026
color 5A

:menu
cls
echo ***************************************
echo *********** REG TOOL 2026 *************
echo ***************************************
echo.
echo.
echo.
echo "[ a ] Consulta de maquinaria"
echo "[ b ] Creació de claus personalitzades" 
echo "[ c ] Bloqueig de seguretat"
echo "[ d ] Restauracio de seguretat"
echo "[ e ] Copia de seguretat"
echo "[ s ] Sortir"

set /p opcio="Escriu la opcio que vols"
if "%opcio%"=="a" goto :a
if "%opcio%"=="b" goto :b
if "%opcio%"=="c" goto :c
if "%opcio%"=="d" goto :d
if "%opcio%"=="e" goto :e
if "%opcio%"=="s" goto :s
goto :menu

:a
cls
reg query "HKLM\HARDWARE\DESCRIPTION\System\CentralProcessor\0" /v ProcessorNameString
pause
goto :menu


:b
cls
set /p NOMCLAU="Introdueix el nom de la nova carpeta: "
reg add "HKCU\Software\%NOMCLAU%" /f
reg add "HKCU\Software\%NOMCLAU%" /v Autor /t REG_SZ /d "%USERNAME%" /f
pause
goto :menu

:c
cls
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f
pause
goto :menu

:d
cls
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 0 /f
pause
goto :menu

:e
cls
reg export "HKCU\Control Panel\Desktop" "%USERPROFILE%\Desktop\backup_desktop.reg" /y
pause
goto :menu

:s
cls
echo "Adeu, fins que em tornis a executar =)"
pause
TASKKILL /F /IM cmd.exe /T