# Automatiza release.

# Hoje versão simples.

# Depois você pode integrar:

# semantic-release
# changesets
# conventional commits
# CI/CD

Write-Host ""
Write-Host "🚀 Starting release..."
Write-Host ""

pnpm lint
pnpm format:check

git status

Write-Host ""
Write-Host "✅ Ready for release"
