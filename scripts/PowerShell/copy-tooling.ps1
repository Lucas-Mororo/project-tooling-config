param(
  [Parameter(Mandatory=$true)][string]$TargetPath,
  [switch]$Force
)

Write-Host "Copiando tooling para: $TargetPath"

$scriptPath = (Resolve-Path -Path $MyInvocation.MyCommand.Path).Path
$scriptDir = Split-Path -Parent $scriptPath
$repoRoot = Resolve-Path -Path (Join-Path $scriptDir '..\..')

$items = @(
  'lefthook.yml',
  'eslint.config.js',
  '.editorconfig',
  '.gitignore',
  'configs'
)

foreach ($item in $items) {
  $src = Join-Path -Path $repoRoot -ChildPath $item
  $dest = Join-Path -Path $TargetPath -ChildPath $item

  if (-not (Test-Path $src)) {
    Write-Warning "Template não contém: $src"
    continue
  }

  if ((Test-Path $dest) -and (-not $Force)) {
    $ans = Read-Host "'$dest' existe. Sobrescrever? (y/N)"
    if ($ans -notin @('y','Y')) { Write-Host "Pulando $dest"; continue }
  }

  if (Test-Path $dest) { Remove-Item -Recurse -Force $dest }
  Copy-Item -Path $src -Destination $dest -Recurse -Force
  Write-Host "Copiado: $item"
}

Write-Host "Concluído. No destino run:"
Write-Host "pnpm install" -ForegroundColor Cyan
Write-Host "pnpm exec lefthook install" -ForegroundColor Cyan
Write-Host "pnpm run lint:fix" -ForegroundColor Cyan
Write-Host "pnpm run format" -ForegroundColor Cyan
Write-Host "pnpm run format:check" -ForegroundColor Cyan

Exit 0
