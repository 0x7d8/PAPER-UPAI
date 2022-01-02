@echo off
call internet.cmd https://github.com/rotvproHD/PAPER-UPAI/raw/main/appfiles/APPFILES.zip -saveTo C:\PAPERSTUDIOS\Temp\appupdate.zip
for %%i in (*.*) do if not "%%i"=="updateservice.bat" del /q "%%i"
del /q C:\PAPERSTUDIOS\Data\UPAI-de\versions
rmdir C:\PAPERSTUDIOS\Data\UPAI-de\versions
"archiver\WinRAR.exe" x "C:\PAPERSTUDIOS\Temp\appupdate.zip" *.* C:\PAPERSTUDIOS\Data\UPAI-de\
cls
echo.
echo [!] FERTIG
pause
boot.bat