@echo off
:start
set pg=2
title [!] %titlemain% - SEITE 2
setlocal enabledelayedexpansion
mode con cols=100 lines=30
set no=1
:: properties
set max=9
set defcolor=0f
set sel=1
set selcolor=8f
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
echo  PROGRAMM LISTE - SEITE 2
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
set menu1=LEER        
set menu2=LLER        
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

goto start

)
if !sel! EQU 2 (

goto start

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
C:\PAPERSTUDIOS\Temp\upai-pages\pg1.bat

)
if !sel! EQU 9 (

if exist C:\PAPERSTUDIOS\Temp\upai-pages\pg3.bat (
cls
C:\PAPERSTUDIOS\Temp\upai-pages\pg3.bat
) else (
goto start
)

)
)
exit /b
