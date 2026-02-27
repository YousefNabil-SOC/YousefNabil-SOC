# ===============================================
# STIG ID: WN11-AU-000050
# Title: The system must be configured to audit Detailed Tracking -
#        Process Creation successes.
# Description: Enables success auditing for the Process Creation subcategory
#              under Detailed Tracking. This allows security personnel to track
#              process execution on the endpoint, which is critical for
#              incident response and forensic investigation.
# Author: Yousef Nabil
# LinkedIn: https://www.linkedin.com/in/yousef-nabil-79a431287/
# GitHub: https://github.com/YousefNabil-SOC
# Created: <02/27/2026>
# ===============================================

#Requires -RunAsAdministrator

[CmdletBinding()]
param()

$StigID    = "WN11-AU-000050"
$StigTitle = "Audit Detailed Tracking - Process Creation Successes"

Write-Host ""
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host " Remediating: $StigID" -ForegroundColor Cyan
Write-Host " $StigTitle" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan

try {
    # Check current audit setting before applying
    Write-Host "[INFO] Current setting before remediation:" -ForegroundColor Yellow
    auditpol /get /subcategory:"Process Creation"

    # Enable Success auditing for Process Creation
    auditpol /set /subcategory:"Process Creation" /success:enable /failure:disable | Out-Null

    Write-Host "[SUCCESS] Process Creation success auditing enabled." -ForegroundColor Green
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
auditpol /get /subcategory:"Process Creation"
