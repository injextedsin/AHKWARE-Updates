@echo off
mode 80, 20
title AHKWARE Loader
chcp 65001 >nul
color 3

:: Auto-update and version check system for AHKWARE Loader
setlocal EnableDelayedExpansion
set "localVersion=1.0.1"  :: Set to the current version you're running

:: Assign the URLs to variables
set "versionCheckURL=https://raw.githubusercontent.com/celestialxdev/AHKWARE-Updates/main/version.txt"
set "updateURL=https://raw.githubusercontent.com/celestialxdev/AHKWARE-Updates/main/latest.exe"

set "mainScript=latest.exe"
set "oldVersionsFolder=Old Versions"

:: Display loading screen
echo 	****************************************
echo 	*                                      *
echo 	*         AHKWARE LOADER               *
echo 	*                                      *
echo 	*    Checking for updates...           *
echo 	*                                      *
echo 	****************************************
echo.

:: Check if the latest.exe exists, if not, download it
if not exist "!mainScript!" (
    echo !mainScript! not found. Downloading the latest version...
    powershell -Command "Invoke-WebRequest -Uri '!updateURL!' -OutFile '!mainScript!'"
    echo Latest version downloaded successfully.
)

:: Download the latest version number from GitHub
powershell -Command "Invoke-WebRequest -Uri '!versionCheckURL!' -OutFile remote_version.txt"
set /p remoteVersion=<remote_version.txt

:: Compare versions
if "!remoteVersion!" neq "!localVersion!" (
    echo New version available: !remoteVersion! Updating now...

    :: Create Old Versions folder if it doesn't exist
    if not exist "!oldVersionsFolder!" mkdir "!oldVersionsFolder!"

    :: Backup the current version before updating (only if it's not the latest version)
    if exist "!mainScript!" (
        set timestamp=%date:~-4%-%date:~4,2%-%date:~7,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%
        ren "!mainScript!" "ahkware_!timestamp!.exe"
        move "ahkware_!timestamp!.exe" "!oldVersionsFolder!\" 
    )

    :: Download and replace with the latest version
    powershell -Command "Invoke-WebRequest -Uri '!updateURL!' -OutFile '!mainScript!'"
    echo Update complete. Launching the latest version...
) else (
    echo You are already running the latest version: !localVersion!
    echo Press Enter to continue...
    pause >nul
)

:: Launch the main AHKWARE executable
start "" "!mainScript!"
exit
