param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Message
)

# Stage every changed/new path except .claude/ and CLAUDE.md.
# We enumerate via `git status --porcelain` so the exclusion is done in
# PowerShell rather than via git pathspec magic (which gets mangled by PS
# argument parsing on some setups).

$lines = git status --porcelain
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

$paths = @()
foreach ($line in $lines) {
    if ([string]::IsNullOrWhiteSpace($line)) { continue }
    # Porcelain format: 2-char status, space, path (or "old -> new" for renames)
    $path = $line.Substring(3)
    if ($path -match ' -> ') { $path = ($path -split ' -> ')[1] }
    $path = $path.Trim('"')
    if ($path -like '.claude/*' -or $path -eq '.claude' -or $path -eq 'CLAUDE.md') { continue }
    $paths += $path
}

if ($paths.Count -eq 0) {
    Write-Host "No changes to commit."
    exit 0
}

Write-Host "Staging:"
$paths | ForEach-Object { Write-Host "  $_" }

git add -- $paths
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

git commit -m $Message
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

git push origin master
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "All changes have been pushed!"
