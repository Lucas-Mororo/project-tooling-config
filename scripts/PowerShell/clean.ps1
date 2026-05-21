# Remove:

# caches
# builds
# node_modules
# turbo
# dist

# Muito útil quando tooling quebra.

Write-Host ""
Write-Host "🧹 Cleaning project..."
Write-Host ""

Remove-Item -Recurse -Force node_modules -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force dist -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force build -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force coverage -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force .next -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force .turbo -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "✅ Clean completed"
