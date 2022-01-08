@echo off
:start
set pg=1
title %PROGRAM% - SEITE 1
setlocal enabledelayedexpansion
mode con cols=100 lines=30
set no=1
:: properties
set max=9
set sel=1
if %theme% EQU 1 (
set selcolor=0f
set defcolor=70
goto skip2nd
)
if %theme% EQU 0 (
set selcolor=8f
set defcolor=0f
)
:skip2nd
call :reset
call :setmenu
:refresh
:: redraw window
DCls 0
call :recolor
call :title
call :menu
call :below
set sel2=!sel!
DKey
if "%errorlevel%"=="13" call :action&goto refresh
if "%errorlevel%"=="40" set /a sel+=1&goto refresh
if "%errorlevel%"=="38" set /a sel-=1&goto refresh
goto refresh
:reset
:: reset variable
for /l %%i in (1 1 !max!) do set color%%i=!defcolor!
for /l %%i in (1 1 !max!) do set menu%%i=undefined
exit /b

:menu
:: display menu
color !defcolor!
for /l %%i in (1 1 !max!) do (
DCls x1
set /p ="!left!"<nul
DColor !color%%i!
set /p ="!menu%%i!"<nul
DColor !defcolor!
echo.!right!
)
exit /b

:title
echo.
echo  [SEITE 01] PROGRAMM LISTE
echo.  
echo. 
exit /b

:below
echo.
echo.
echo. BITTE MIT PFEILTASTEN AUSWAEHLEN
echo. ZUM BESTAETIGEN [ENTER] DRUECKEN
exit /b

:recolor
:: reset color
if !sel! lss 1 set sel=!max!
if !sel! gtr !max! set sel=1
set color!sel!=!selcolor!
if not !sel!==!sel2! (
set color!sel2!=!defcolor!
)
exit /b




:setmenu
:: set menu caption
set menu1=PAKET MANGER
set menu2=SAEUBERER   
set menu3=LEER        
set menu4=LEER        
set menu5=LEER        
set menu6=LEER        
set menu7=LEER        
set menu8=ZURUECK     
set menu9=NAECHSTE    
set left=
set right=
exit /b




:action
if !sel!==5 (
if !no!==1 (
set selcolor=3f
set defcolor=70
)
if !no!==2 (
set selcolor=0b
set defcolor=0f
)
if !no!==3 (
set selcolor=8f
set defcolor=0f
set no=0
)
call :reset
call :setmenu
set /a no+=1
) else (
cls
if !sel! EQU 1 (

set installerlink=https://github.com/rotvproHD/PAPER-PCKGS/releases/latest/download/installer.exe
set faname=PAPER-PCKGS
set uaname=PAKET MANAGER
set afpath=0
set sizemb=0,5
set appdev=PAPER
set appframe=Rcode
set cavers=100
set cavert=1
echo "PAPER-PCKGS" > app-name.tmp
C:\PAPERSTUDIOS\Data\UPAI-de\appbrowseappview.bat

)
if !sel! EQU 2 (

set installerlink=https://github.com/rotvproHD/PAPER-TCLEANER/releases/latest/download/installer.exe
set faname=PAPER-TCLEANER
set uaname=SAEUBERER
set afpath=TCLEANER-de
set sizemb=5,3
set appdev=PAPER
set appframe=SPcode200
set cavers=230
set cavert=1
echo "PAPER-TCLEANER" > app-name.tmp
C:\PAPERSTUDIOS\Data\UPAI-de\appbrowseappview.bat

)
if !sel! EQU 3 (

goto start

)
if !sel! EQU 4 (

goto start

)
if !sel! EQU 5 (

goto start

)
if !sel! EQU 6 (

goto start

)
if !sel! EQU 7 (

goto start

)
if !sel! EQU 8 (

cls
start.bat

)
if !sel! EQU 9 (

if exist C:\PAPERSTUDIOS\Temp\upai-pages\pg2.bat (
cls
C:\PAPERSTUDIOS\Temp\upai-pages\pg2.bat
) else (
goto start
)

)
)
exit /b
