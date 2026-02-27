# ===============================================
# STIG ID: WN11-SO-000030
# Title: Audit policy using subcategories must be enabled.
# Description: Enables the use of audit policy subcategories rather than
#              legacy category-level audit settings. This is required for
#              all STIG audit subcategory controls (WN11-AU-*) to be
#              effective. Without this setting, subcategory-level audit
#              policies may be overridden by category-level settings.
#              Maps to: HKLM\SYSTEM\CurrentControlSet\Control\Lsa
#              Value: SCENoApplyLegacyAuditPolicy = 1 (DWORD)
# Author: Yousef Nabil
# LinkedIn: https://www.linkedin.com/in/yousef-nabil-79a431287/
# GitHub: https://github.com/YousefNabil-SOC
# Created: <02/27/2026>
# ===============================================

#Requires -RunAsAdministrator

[CmdletBinding()]
param()

$StigID    = "WN11-SO-000030"
$StigTitle = "Audit Policy Using Subcategories Must Be Enabled"

$RegPath   = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
$RegName   = "SCENoApplyLegacyAuditPolicy"
$RegType   = "DWORD"
$RegValue  = 1

Write-Host ""
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host " Remediating: $StigID" -ForegroundColor Cyan
Write-Host " $StigTitle" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan

try {
    # The LSA path should always exist, but check to be safe
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
