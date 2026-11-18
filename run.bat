@echo off
setlocal
cd /d "%~dp0"
title CA Audit Tool
echo ==========================================
echo   CA Audit Tool - starting...
echo ==========================================

where node >nul 2>nul
if errorlevel 1 (
  echo.
  echo Node.js is not installed. Opening the download page...
  echo Install the "LTS" version, then double-click run.bat again.
  start https://nodejs.org/en/download
  pause
  exit /b 1
)

if not exist node_modules (
  echo.
  echo First run: installing required packages ^(needs internet, takes a few minutes^)...
  call npm install
  if errorlevel 1 (
    echo.
    echo Installation failed. Check your internet connection and try again.
    pause
    exit /b 1
  )
)

echo.
echo Starting the app. Your browser will open shortly.
echo Keep this window open while you work. Close it to stop the app.
start "" cmd /c "timeout /t 10 /nobreak >nul & start http://localhost:3000"
call npm run dev
pause
