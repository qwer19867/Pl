@echo off
chcp 65001 >nul
title OPENCODE-TEST
echo === Diagnostic run of opencode TUI ===
echo Start: %DATE% %TIME%
opencode
echo.
echo === opencode exited with code %ERRORLEVEL% at %TIME% ===
echo.
echo This window will stay open for 20 seconds for inspection.
timeout /t 20 >nul
exit
