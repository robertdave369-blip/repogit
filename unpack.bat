@echo off
rem Joins the z121_cand_2e_2f.7z.001/.002/... chunks and extracts them into one folder "z121_cand_2e_2f".
rem 7-Zip asks for the password (kept out of this file on purpose, the repo is public-able).
setlocal
set "SEVENZIP=%ProgramFiles%\7-Zip\7z.exe"
if not exist "%SEVENZIP%" set "SEVENZIP=%ProgramFiles(x86)%\7-Zip\7z.exe"
if not exist "%SEVENZIP%" (
  where 7z >nul 2>&1 || (echo 7-Zip not found. Install it from https://www.7-zip.org & pause & exit /b 1)
  set "SEVENZIP=7z"
)
if not exist "%~dp0z121_cand_2e_2f.7z.001" (echo z121_cand_2e_2f.7z.001 not found next to this script. & pause & exit /b 1)

"%SEVENZIP%" x "%~dp0z121_cand_2e_2f.7z.001" -o"%~dp0z121_cand_2e_2f" -y
if errorlevel 1 (echo. & echo Extraction FAILED - wrong password or a chunk is missing. & pause & exit /b 1)
echo. & echo Done: "%~dp0z121_cand_2e_2f"
pause
