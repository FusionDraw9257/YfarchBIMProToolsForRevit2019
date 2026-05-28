@echo off
chcp 65001 >nul
cd /d "%~dp0"

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp000_CreateReleaseAndUploadInstaller.ps1"

echo.
pause

