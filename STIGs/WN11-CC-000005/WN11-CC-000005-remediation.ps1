# ===============================================
# STIG ID: WN11-CC-000005
# Title: Camera access from the lock screen must be disabled.
# Description: Disables the ability to access the camera from the Windows lock
#              screen. This prevents unauthorized physical access to camera
#              functionality before a user authenticates to the system.
#              Maps to: HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization
#              Value: NoLockScreenCamera = 1 (DWORD)
# Author: Yousef Nabil
# LinkedIn: https://www.linkedin.com/in/yousef-nabil-79a431287/
# GitHub: https://github.com/YousefNabil-SOC
# Created: <02/27/2026>
# ===============================================

#Requires -RunAsAdministrator

[CmdletBinding()]
param()

$StigID    = "WN11-CC-000005"
$StigTitle = "Camera Access from the Lock Screen Must Be Disabled"

$RegPath   = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$RegName   = "NoLockScreenCamera"
$RegType   = "DWORD"
$RegValue  = 1

Write-Host ""
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host " Remediating: $StigID" -ForegroundColor Cyan
Write-Host " $StigTitle" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan

try {
    # Create registry path if it does not exist
    if (-not (Test-Path $RegPath)) {
        Write-Host "[INFO] Registry path not found. Creating: $RegPath" -ForegroundColor Yellow
        New-Item -Path $RegPath -Force | Out-Null
    }

    # Apply the registry value (idempotent)
    Set-ItemProperty -Path $RegPath -Name $RegName -Value $RegValue -Type $RegType -Force

    Write-Host "[SUCCESS] $RegName set to $RegValue at $RegPath" -ForegroundColor Green
}
catch {
    Write-Host "[ERROR] Failed to apply remediation: $_" -ForegroundColor Red
    exit 1
}

# -----------------------------------------------
# Verification Command:
# -----------------------------------------------
Write-Host ""
Write-Host "--- Verification ---" -ForegroundColor Magenta
Get-ItemProperty -Path $RegPath -Name $RegName -ErrorAction SilentlyContinue |
    Select-Object $RegName
