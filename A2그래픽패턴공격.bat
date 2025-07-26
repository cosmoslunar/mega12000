@echo off
title Graphic Pattern Attacker
color 0C

echo [CHECK] USB Debugging must be enabled.
powershell -ExecutionPolicy Bypass -File check_adb.ps1
if %errorlevel% neq 0 (
  echo [ERROR] USB debugging disabled or no device connected.
  pause
  exit /b
)

echo [ATTACK] Starting graphic pattern brute-force...
python adb_pattern_brute.py

if %errorlevel% equ 0 (
  echo [SUCCESS] Pattern cracked! >> cracked.txt
) else (
  echo [FAILED] Attack failed. >> failed.txt
)
pause
