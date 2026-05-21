# Setup COMPLETO do projeto.

Write-Host ""
Write-Host "🚀 Bootstrapping project..."
Write-Host ""

pnpm install

pnpm exec lefthook install

pnpm lint
pnpm format:check

Write-Host ""
Write-Host "✅ Bootstrap completed"
