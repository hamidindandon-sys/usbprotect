@echo off
title GonOS Host Protector
echo ======================================================
echo   PREPARING HOST MACHINE FOR GONOS USB
echo ======================================================
echo.

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Administrator privileges required.
    echo Please close this and run as Administrator.
    pause
    exit /b
)

echo [1/3] Disabling Windows Search Indexing for removable drives...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventIndexingRemovableDrives" /t REG_DWORD /d 1 /f >nul
echo       Done.

echo [2/3] Disabling System Restore on removable drives...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v "DisableRemovableDriveShadowCopy" /t REG_DWORD /d 1 /f >nul
echo       Done.

echo [3/3] Locking all USB drives to READ-ONLY mode...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" /v "WriteProtect" /t REG_DWORD /d 1 /f >nul
echo       Done.

echo.
echo ======================================================
echo SUCCESS. The host machine is now blind to your USB.
echo You may safely plug in the gonOS drive.
echo ======================================================
pause
