[CmdletBinding()]
param([Parameter(Mandatory)][string]$Path)

$resolved = (Resolve-Path -LiteralPath $Path -ErrorAction Stop).Path
$patterns = @(
    'nsec1[0-9a-z]{20,}',
    '(?i)BUZZ_PRIVATE_KEY\s*[:=]\s*["'']?[0-9a-f]{64}["'']?',
    '(?i)["'']BUZZ_PRIVATE_KEY["'']\s*:\s*["''][0-9a-f]{64}["'']',
    '(?i)(api[_-]?key|private[_-]?key|secret|token)\s*[:=]\s*["''][^"'']{8,}["'']',
    'sk-[A-Za-z0-9_-]{20,}'
)

$files = Get-ChildItem -LiteralPath $resolved -Recurse -File -Force |
    Where-Object { $_.FullName -notmatch '\\.git\\' }
$findings = foreach ($file in $files) {
    foreach ($pattern in $patterns) {
        Select-String -LiteralPath $file.FullName -Pattern $pattern -AllMatches -ErrorAction SilentlyContinue |
            ForEach-Object { [pscustomobject]@{ File = $_.Path; Line = $_.LineNumber; Pattern = $pattern } }
    }
}

if ($findings) {
    $findings | Format-Table -AutoSize
    Write-Error 'Possible secret material found. Values were not printed.'
    exit 1
}

Write-Host 'No configured secret patterns found.'
exit 0
