# ===============================================
# STIG ID: WN11-CC-000315
# Title: The Windows Installer feature 'Always install with elevated
#        privileges' must be disabled.
# Description: Disables the AlwaysInstallElevated policy which would allow
#              low-privileged users to install software with SYSTEM-level
#              privileges. This is a well-known privilege escalation vector.
#              Requires setting both the HKLM and HKCU registry values to 0.
# Author: Yousef Nabil
# LinkedIn: https://www.linkedin.com/in/yousef-nabil-79a431287/
# GitHub: https://github.com/YousefNabil-SOC
# Created: <02/27/2026>
# ===============================================

#Requires -RunAsAdministrator

[CmdletBinding()]
param()

$StigID    = "WN11-CC-000315"
$StigTitle = "Windows Installer - Always Install with Elevated Privileges Must Be Disabled"

$RegName   = "AlwaysInstallElevated"
$RegType   = "DWORD"
$RegValue  = 0

# Both HKLM and HKCU must be set per STIG requirement
$RegPaths  = @(
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer",
    "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Installer"
)

Write-Host ""
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host " Remediating: $StigID" -ForegroundColor Cyan
Write-Host " $StigTitle" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan

foreach ($RegPath in $RegPaths) {
    try {
        # Create path if it does not exist
        if (-not (Test-Path $RegPath)) {
            Write-Host "[INFO] Creating registry path: $RegPath" -ForegroundColor Yellow
            New-Item -Path $RegPath -Force | Out-Null
        }

        # Apply the setting (idempotent)
        Set-ItemProperty -Path $RegPath -Name $RegName -Value $RegValue -Type $RegType -Force
        Write-Host "[SUCCESS] $RegName = $RegValue applied at: $RegPath" -ForegroundColor Green
    }
    catch {
        Write-Host "[ERROR] Failed at $RegPath : $_" -ForegroundColor Red
    }
}

# -----------------------------------------------
# Verification Command:
# -----------------------------------------------
Write-Host ""
Write-Host "--- Verification ---" -ForegroundColor Magenta
foreach ($RegPath in $RegPaths) {
    Write-Host "Path: $RegPath" -ForegroundColor White
    Get-ItemProperty -Path $RegPath -Name $RegName -ErrorAction SilentlyContinue |
        Select-Object $RegName
}
