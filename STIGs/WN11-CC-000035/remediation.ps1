# ===============================================
# STIG ID: WN11-CC-000035
# Title: The system must be configured to ignore NetBIOS name release
#        requests except from WINS servers.
# Description: Configures Windows to ignore NetBIOS name release requests
#              from non-WINS servers. This mitigates NetBIOS name spoofing
#              attacks that could redirect network traffic.
#              Maps to: HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters
#              Value: NoNameReleaseOnDemand = 1 (DWORD)
# Author: Yousef Nabil
# LinkedIn: https://www.linkedin.com/in/yousef-nabil-79a431287/
# GitHub: https://github.com/YousefNabil-SOC
# Created: <02/27/2026>
# ===============================================

#Requires -RunAsAdministrator

[CmdletBinding()]
param()

$StigID    = "WN11-CC-000035"
$StigTitle = "Ignore NetBIOS Name Release Requests Except from WINS"

$RegPath   = "HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters"
$RegName   = "NoNameReleaseOnDemand"
$RegType   = "DWORD"
$RegValue  = 1

Write-Host ""
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host " Remediating: $StigID" -ForegroundColor Cyan
Write-Host " $StigTitle" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan

try {
    # Ensure the registry path exists (it typically does)
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
