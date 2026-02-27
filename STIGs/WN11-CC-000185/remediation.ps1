# ===============================================
# STIG ID: WN11-CC-000185
# Title: The default autorun behavior must be configured to prevent
#        autorun commands.
# Description: Disables AutoRun by configuring the default behavior to
#              prevent the execution of autorun commands when media is
#              inserted. This prevents malware from automatically executing
#              from removable media or optical drives.
#              Maps to: HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer
#              Value: NoAutorun = 1 (DWORD)
# Author: Yousef Nabil
# LinkedIn: https://www.linkedin.com/in/yousef-nabil-79a431287/
# GitHub: https://github.com/YousefNabil-SOC
# Created: <02/27/2026>
# ===============================================

#Requires -RunAsAdministrator

[CmdletBinding()]
param()

$StigID    = "WN11-CC-000185"
$StigTitle = "Default AutoRun Behavior Must Prevent AutoRun Commands"

$RegPath   = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$RegName   = "NoAutorun"
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

    # Apply the setting (idempotent)
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
