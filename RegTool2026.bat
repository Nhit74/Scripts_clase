@echo off
REM  Canviam el color del text i de la finestra. També posam un titol a la finestra.
title Reg_Tool_2026
color 5A

REM "Posam un :menu per a crear un loop amb l'ordre goto"
:menu
cls
echo ***************************************
echo *********** REG TOOL 2026 *************
echo ***************************************
echo.
echo.
echo.
REM "Aqui feim els echos per a que l'usuari pugui escollir la opcio que vol"
echo "[ a ] Consulta de maquinaria"
echo "[ b ] Creació de claus personalitzades" 
echo "[ c ] Bloqueig de seguretat"
echo "[ d ] Restauracio de seguretat"
echo "[ e ] Copia de seguretat"
echo "[ s ] Sortir"

REM "Aqui es fa que l'usuari escollesqui una opcio i despres sel du a la que ha triat"
set /p opcio="Escriu la opcio que vols"
if "%opcio%"=="a" goto :a
if "%opcio%"=="b" goto :b
if "%opcio%"=="c" goto :c
if "%opcio%"=="d" goto :d
if "%opcio%"=="e" goto :e
if "%opcio%"=="s" goto :s
goto :menu

REM opcio A consulta el maquinari e informa d'aquest
:a
cls
reg query "HKLM\HARDWARE\DESCRIPTION\System\CentralProcessor\0" /v ProcessorNameString
pause
goto :menu

REM Opcio B demana a l'usuari un imput i crea una clau personalitzada.
:b
cls
set /p NOMCLAU="Introdueix el nom de la nova carpeta: "
reg add "HKCU\Software\%NOMCLAU%" /f
reg add "HKCU\Software\%NOMCLAU%" /v Autor /t REG_SZ /d "%USERNAME%" /f
pause
goto :menu

REM "Opcio C bloqueja l'administrador de tasques"
:c
cls
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f
pause
goto :menu

REM restarura el valor de la opcio c
:d
cls
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 0 /f
pause
goto :menu

REM exporta una copia de seguretat a l'escriptori de l'suauari
:e
cls
reg export "HKCU\Control Panel\Desktop" "%USERPROFILE%\Desktop\backup_desktop.reg" /y
pause
goto :menu

REM surt de l'escript
:s
cls
echo "Adeu, fins que em tornis a executar =)"
pause
TASKKILL /F /IM cmd.exe /T
