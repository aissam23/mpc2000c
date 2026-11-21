@echo off
REM Put this file NEXT TO the "Scarl.vst3" folder, then right-click > Run as administrator.
net session >nul 2>&1
if %errorlevel% neq 0 (
  echo Please right-click this file and choose "Run as administrator".
  pause
  exit /b 1
)
set "SRC=%~dp0Scarl.vst3"
set "DST=%CommonProgramFiles%\VST3\Scarl.vst3"
if not exist "%SRC%" (
  echo Can't find the Scarl.vst3 folder next to this file.
  pause
  exit /b 1
)
xcopy "%SRC%" "%DST%\" /E /I /Y
echo.
echo Scarl installed to: %DST%
echo Now open FL Studio: Options ^> Manage plugins ^> Find installed plugins.
pause
