# ===============================================
# STIG ID: WN11-AC-000010
# Title: The number of allowed bad logon attempts must be configured to 3 or less.
# Description: Configures the local account lockout threshold to a maximum of 3
#              invalid logon attempts to mitigate brute-force attacks against
#              local accounts on Windows 11 workstations.
# Author: Yousef Nabil
# LinkedIn: https://www.linkedin.com/in/yousef-nabil-79a431287/
# GitHub: https://github.com/YousefNabil-SOC
# Created: <02/27/2026>
# ===============================================

#Requires -RunAsAdministrator

[CmdletBinding()]
param()

$StigID      = "WN11-AC-000010"
$StigTitle   = "Account Lockout Threshold"
$TargetValue = 3

Write-Host ""
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host " Remediating: $StigID" -ForegroundColor Cyan
Write-Host " $StigTitle" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan

try {
    # Check current setting before applying change
    $CurrentPolicy = net accounts | Select-String "Lockout threshold"
    Write-Host "[INFO] Current Setting: $($CurrentPolicy.Line.Trim())" -ForegroundColor Yellow

    # Apply account lockout threshold of 3
    net accounts /lockoutthreshold:$TargetValue | Out-Null

    Write-Host "[SUCCESS] Account lockout threshold set to $TargetValue." -ForegroundColor Green
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
net accounts | Select-String "Lockout threshold"
