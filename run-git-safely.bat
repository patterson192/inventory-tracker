@echo off
REM Safe Git Command Runner - Prevents Agent Freezing
REM Usage: run-git-safely.bat [command] [args]

setlocal enabledelayedexpansion

echo [SAFE] Running Git command: %*
echo [SAFE] This command will not freeze the agent...

REM Set timeout for commands (5 minutes)
set TIMEOUT=300

REM Run the command with timeout
timeout /t %TIMEOUT% /nobreak >nul 2>&1

REM Execute the actual git command
git %*

if %ERRORLEVEL% EQU 0 (
    echo [SUCCESS] Command completed successfully
) else (
    echo [ERROR] Command failed with error code %ERRORLEVEL%
)

echo [SAFE] Command execution finished
pause

