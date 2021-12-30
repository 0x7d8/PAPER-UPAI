@echo off
call internet.cmd https://raw.githubusercontent.com/rotvproHD/PAPER-UPAI/main/compversion -saveTo C:\PAPERSTUDIOS\Temp\compversion.tmp
FOR /F "delims=|" %%f in (C:\PAPERSTUDIOS\Temp\compversion.tmp) DO (
    set ncompversion=%%f
)
set compversion=02
if %ncompversion% EQU %compversion% (
    goto download
) else (
    appbrowserepl.cmd
)



:download
call internet.cmd https://raw.githubusercontent.com/rotvproHD/PAPER-UPAI/main/Pages/pageinfos -saveTo C:\PAPERSTUDIOS\Temp\pginf.tmp
FOR /F "delims=|" %%f in (C:\PAPERSTUDIOS\Temp\pginf.tmp) DO (
set pages=%%f
)
if %pages% EQU 1 (
call internet.cmd https://raw.githubusercontent.com/rotvproHD/PAPER-UPAI/main/Pages/page1.bat -saveTo C:\PAPERSTUDIOS\Temp\upai-pages\pg1.bat
)
if %pages% EQU 2 (
call internet.cmd https://raw.githubusercontent.com/rotvproHD/PAPER-UPAI/main/Pages/page2.bat -saveTo C:\PAPERSTUDIOS\Temp\upai-pages\pg2.bat
)
if %pages% EQU 3 (
call internet.cmd https://raw.githubusercontent.com/rotvproHD/PAPER-UPAI/main/Pages/page3.bat -saveTo C:\PAPERSTUDIOS\Temp\upai-pages\pg3.bat
)
C:\PAPERSTUDIOS\Temp\upai-pages\pg1.bat

