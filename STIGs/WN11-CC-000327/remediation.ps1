# ===============================================
# STIG ID: WN11-CC-000327
# Title: PowerShell Transcription must be enabled on Windows 11.
# Description: Enables PowerShell Transcription which records all input and
#              output of PowerShell sessions to text log files. Combined with
#              Script Block Logging, this provides complete PowerShell audit
#              capability. Transcripts are saved to a designated output directory.
#              Maps to: HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription
#              Value: EnableTranscripting = 1 (DWORD)
# Author: Yousef Nabil
# LinkedIn: https://www.linkedin.com/in/yousef-nabil-79a431287/
# GitHub: https://github.com/YousefNabil-SOC
# Created: <02/27/2026>
# ===============================================

#Requires -RunAsAdministrator

[CmdletBinding()]
param()

$StigID         = "WN11-CC-000327"
$StigTitle      = "PowerShell Transcription Must Be Enabled"

$RegPath        = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"
$TranscriptDir  = "C:\PSTranscripts"

Write-Host ""
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host " Remediating: $StigID" -ForegroundColor Cyan
Write-Host " $StigTitle" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan

try {
    # Create the registry path if it does not exist
    if (-not (Test-Path $RegPath)) {
        Write-Host "[INFO] Registry path not found. Creating: $RegPath" -ForegroundColor Yellow
        New-Item -Path $RegPath -Force | Out-Null
    }

    # Enable transcription
    Set-ItemProperty -Path $RegPath -Name "EnableTranscripting"     -Value 1 -Type DWORD -Force
    # Set the output directory
    Set-ItemProperty -Path $RegPath -Name "OutputDirectory"         -Value $TranscriptDir -Type String -Force
    # Include invocation header in transcripts
    Set-ItemProperty -Path $RegPath -Name "EnableInvocationHeader"  -Value 1 -Type DWORD -Force

    # Create the transcript output directory if it does not exist
    if (-not (Test-Path $TranscriptDir)) {
        Write-Host "[INFO] Creating transcript directory: $TranscriptDir" -ForegroundColor Yellow
        New-Item -ItemType Directory -Path $TranscriptDir -Force | Out-Null
    }

    Write-Host "[SUCCESS] PowerShell Transcription enabled. Transcripts will be saved to: $TranscriptDir" -ForegroundColor Green
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
Get-ItemProperty -Path $RegPath -ErrorAction SilentlyContinue |
    Select-Object EnableTranscripting, OutputDirectory, EnableInvocationHeader
