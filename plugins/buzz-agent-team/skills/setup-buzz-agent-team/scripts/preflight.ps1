[CmdletBinding()]
param()

$ErrorActionPreference = 'Continue'

function Test-Command {
    param([Parameter(Mandatory)][string]$Name)
    $command = Get-Command $Name -ErrorAction SilentlyContinue
    if (-not $command) {
        return [pscustomobject]@{ Check = $Name; Status = 'missing'; Detail = '' }
    }
    $version = try { (& $Name --version 2>&1 | Select-Object -First 1) -join ' ' } catch { 'present' }
    [pscustomobject]@{ Check = $Name; Status = 'present'; Detail = $version }
}

$commands = 'git','bash','docker','node','pnpm','rustc','cargo','just','hermes','buzz','codex'
$results = foreach ($name in $commands) { Test-Command -Name $name }

$buzzDesktop = Join-Path $env:LOCALAPPDATA 'Buzz\buzz-desktop.exe'
$results += [pscustomobject]@{
    Check = 'Buzz Desktop'
    Status = if (Test-Path -LiteralPath $buzzDesktop) { 'present' } else { 'missing' }
    Detail = $buzzDesktop
}

$hermesRoot = if (-not [string]::IsNullOrWhiteSpace($env:HERMES_HOME)) {
    $env:HERMES_HOME
} else {
    Join-Path $env:LOCALAPPDATA 'hermes'
}
$results += [pscustomobject]@{
    Check = 'Hermes config directory'
    Status = if (Test-Path -LiteralPath $hermesRoot) { 'present' } else { 'missing' }
    Detail = $hermesRoot
}

foreach ($name in 'BUZZ_RELAY_URL','BUZZ_PRIVATE_KEY') {
    $value = [Environment]::GetEnvironmentVariable($name)
    $results += [pscustomobject]@{
        Check = "$name (process env)"
        Status = if ([string]::IsNullOrWhiteSpace($value)) { 'unset' } else { 'set' }
        Detail = if ([string]::IsNullOrWhiteSpace($value)) { '' } else { '[value intentionally hidden]' }
    }
}

$results | Format-Table -AutoSize

# Build-from-source tools and buzz-cli may be absent even when the packaged
# desktop plus Hermes ACP pilot is healthy. Fail only when the two core local
# runtimes are unavailable.
$coreMissing = ($results | Where-Object {
    $_.Check -in 'Buzz Desktop','hermes' -and $_.Status -eq 'missing'
}).Count
if ($coreMissing -gt 0) { exit 2 }
exit 0
