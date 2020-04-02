@echo off
::A fork from Jack
set destination=cleanmode



SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

:cleanmode
echo You are in clean mode. Your command history is visible.
echo.
echo.
goto checkck
:aclean
cls
:checkck
call :colorEcho 0a "Command Prompt " & call :colorEcho 0b " Constant Refresh Mode"
title Command Prompt Somewhat Unblocked. Do /help for some suggestions

echo.
echo.

set /p input="> "

::Commands

if !input! EQU /help (
goto help
)
if !input! EQU /mode (
set destination=adirtymode
goto adirtymode
goto %destination%
)

%input%
pause
goto aclean







:adirtymode
cls
call :colorEcho 0a "Command Prompt " & call :colorEcho 0c " No Refresh Mode"
title Command Prompt Somewhat Unblocked. Do /help for some suggestions

:dirtymode
:adirt
echo.
echo.

set /p input="> "

::Commands

if !input! EQU /help (
goto help
)

if !input! EQU /mode (
cls
set destination=cleanmode
goto cleanmode
)


%input%
pause>nul
goto dirtymode















:help
cls
title Some suggestions
echo Some Suggestions. 
echo.
echo.
call :colorEcho 0a "ipconfig"
echo.
call :colorEcho 0a "title"  & call :colorEcho 08 " anything "
echo.
call :colorEcho 0a "echo" & call :colorEcho 08 " anything but some special characters "
echo.
call :colorEcho 0a "ping " & call :colorEcho 08 " address "
echo.
call :colorEcho 0e "mode " & call :colorEcho 08 " A custom command, toggles into a constantly refreshing interface. Use the foward slash before the command."
echo.
echo.
echo.
call :colorEcho 0e "Press any key to continue..."
pause>nul
cls
goto %destination%




:: END MAIN STUFF ::
::
:ColorText [%1 = Color] [%2 = Text]
set /p ".=." > "%~2" <nul 
findstr /v /a:%1 /R "^$" "%~2" nul 2>nul
set /p ".=" <nul
if "%3" == "end" set /p ".=  " <nul
del "%~2" >nul 2>nul
exit /b
:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
::


