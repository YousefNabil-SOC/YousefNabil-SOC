# ===============================================
# STIG ID: WN11-CC-000060
# Title: Connections to non-domain networks when connected to a domain
#        authenticated network must be blocked.
# Description: Prevents Windows from simultaneously connecting to a domain
#              network and a non-domain network. This eliminates the risk of
#              an attacker using a secondary network connection to pivot
#              through a domain-connected endpoint.
#              Maps to: HKLM\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy
#              Value: fBlockNonDomain = 1 (DWORD)
# Author: Yousef Nabil
# LinkedIn: https://www.linkedin.com/in/yousef-nabil-79a431287/
# GitHub: https://github.com/YousefNabil-SOC
# Created: <02/27/2026>
# ===============================================

#Requires -RunAsAdministrator

[CmdletBinding()]
param()

$StigID    = "WN11-CC-000060"
$StigTitle = "Block Connections to Non-Domain Networks While on Domain Network"

$RegPath   = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy"
$RegName   = "fBlockNonDomain"
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
