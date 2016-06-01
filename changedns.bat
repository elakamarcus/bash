@echo off
setlocal enableextensions enabledelayedexpansion

IF "%1"=="" GOTO ERROR
IF "%2"=="" GOTO ERROR
IF "%~3"=="" GOTO ERROR
IF NOT "%4"=="" GOTO ERROR

SET INT = "%~3"

GOTO RUN

:ADD
netsh int ipv4 add dnsserver "%INT%" address=%1 index=1
if %errorlevel% EQU 0 (@echo added %1 as primary dns & GOTO END) else ( @echo error & GOTO ERROR)

:REMOVE
netsh int ipv4 delete dnsserver "%INT%" %1 1>NUL 2>&1 
if %errorlevel% EQU 0 (@echo removed %1 as dns server & GOTO END) else (@echo error & GOTO ERROR)

:RUN
IF "%2"=="add" GOTO ADD
IF "%2"=="del" GOTO REMOVE

:ERROR
@echo "Error in parameter syntax. Try again. %0 DNSIP add/del interfacename"
GOTO END

:END
endlocal
pause
