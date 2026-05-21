# Valida ambiente do desenvolvedor.

# Verifica:
# Node
# PNPM
# Git
# versões
# tooling

# Muito usado antes de abrir issue interna.

Write-Host ""
Write-Host "🩺 Running environment diagnostics..."
Write-Host ""

function Test-Command {
  param($cmd)

  if (Get-Command $cmd -ErrorAction SilentlyContinue) {
    Write-Host "✅ $cmd installed"
  } else {
    Write-Host "❌ $cmd NOT installed"
  }
}

Test-Command node
Test-Command pnpm
Test-Command git

Write-Host ""
Write-Host "📦 Versions:"
Write-Host "Node: $(node -v)"
Write-Host "PNPM: $(pnpm -v)"
Write-Host "Git : $(git --version)"

Write-Host ""
Write-Host "✅ Doctor completed"
