@echo off
rem Joins the saleae_api.7z.001/.002/... chunks and extracts them into one folder "saleae api".
rem 7-Zip asks for the password (kept out of this file on purpose, the repo is public-able).
setlocal
set "SEVENZIP=%ProgramFiles%\7-Zip\7z.exe"
if not exist "%SEVENZIP%" set "SEVENZIP=%ProgramFiles(x86)%\7-Zip\7z.exe"
if not exist "%SEVENZIP%" (
  where 7z >nul 2>&1 || (echo 7-Zip not found. Install it from https://www.7-zip.org & pause & exit /b 1)
  set "SEVENZIP=7z"
)
if not exist "%~dp0saleae_api.7z.001" (echo saleae_api.7z.001 not found next to this script. & pause & exit /b 1)

"%SEVENZIP%" x "%~dp0saleae_api.7z.001" -o"%~dp0saleae api" -y
if errorlevel 1 (echo. & echo Extraction FAILED - wrong password or a chunk is missing. & pause & exit /b 1)
echo. & echo Done: "%~dp0saleae api"
pause
