@ECHO OFF
set version=1.6
set outputfile=log
set outfileext=txt
color 0a
title Process Sniper v%version%
echo Processes attempted to shut down in the last session:>%outputfile%.%outfileext%
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::    Process Sniper v%version%        ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
goto choice
exit /b
:list
wmic process get Name, ProcessID
goto choice
:kill
set /p input=Enter the process name/PID you wish to snipe:
taskkill /pid %input%
echo %input%>>%outputfile%.txt
goto choice
:close
cls
color 0c
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::    You have been using        ::
echo ::    Task Killer v%version%        ::
echo ::         Press any key to close...        ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
pause>null
DEL null
exit
:choice
echo Choose from the following:
echo 1.) List processes currently running
echo 2.) Snipe a process by name/PID
echo 3.) Exit Process Sniper v%version%
choice /c 123 /n
if errorlevel 1 set gt=list
if errorlevel 2 set gt=kill
if errorlevel 3 set gt=close:
goto %gt%
