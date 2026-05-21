Write-Host ""
Write-Host "🚀 Iniciando setup do projeto..."
Write-Host ""

#
# Verifica Node
#
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
  Write-Host "❌ Node.js não encontrado."
  exit 1
}

#
# Verifica PNPM
#
if (-not (Get-Command pnpm -ErrorAction SilentlyContinue)) {
  Write-Host "❌ PNPM não encontrado."
  exit 1
}

#
# Instala dependências
#
Write-Host "📦 Instalando dependências..."
pnpm install

#
# Instala hooks
#
Write-Host "🪝 Instalando git hooks..."
pnpm exec lefthook install

#
# Verifica Git
#
if (-not (Test-Path ".git")) {
  Write-Host "⚠️ Repositório git não encontrado."
} else {
  Write-Host "✅ Git detectado."
}

#
# Finalização
#
Write-Host ""
Write-Host "✅ Setup concluído com sucesso!"
Write-Host ""
Write-Host "Ferramentas configuradas:"
Write-Host "  • ESLint"
Write-Host "  • Prettier"
Write-Host "  • Lefthook"
Write-Host "  • EditorConfig"
Write-Host ""
