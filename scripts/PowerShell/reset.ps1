# Reset TOTAL do ambiente.

# Faz:

# clean
# reinstala deps
# reinstala hooks

Write-Host ""
Write-Host "♻️ Resetting project..."
Write-Host ""

powershell -ExecutionPolicy Bypass -File ./scripts/clean.ps1

pnpm install

pnpm exec lefthook install

Write-Host ""
Write-Host "✅ Reset completed"
