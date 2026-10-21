@echo off
title GonOS Host Unlocker
echo ======================================================
echo   UNLOCKING USB DRIVE FOR WRITE ACCESS
echo ======================================================
echo.

:: 1. Check for Admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Administrator privileges required.
    echo Please close this and run as Administrator.
    pause
    exit /b
)

echo Removing Read-Only lock...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" /v "WriteProtect" /t REG_DWORD /d 0 /f >nul
echo Done.

echo.
echo ======================================================
echo SUCCESS. The USB drive is now unlocked.
echo You can now save files to the exFAT partition.
echo.
echo REMINDER: Run protect.bat again before unplugging!
echo ======================================================
pause
