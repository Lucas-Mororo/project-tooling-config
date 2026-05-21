# Dar permissão Linux/macOS:
# chmod +x scripts/setup.sh
#!/usr/bin/env bash

set -e

echo ""
echo "🚀 Iniciando setup do projeto..."
echo ""

#
# Verifica Node
#
if ! command -v node &> /dev/null
then
  echo "❌ Node.js não encontrado."
  exit 1
fi

#
# Verifica PNPM
#
if ! command -v pnpm &> /dev/null
then
  echo "❌ PNPM não encontrado."
  exit 1
fi

#
# Instala dependências
#
echo "📦 Instalando dependências..."
pnpm install

#
# Instala hooks
#
echo "🪝 Instalando git hooks..."
pnpm exec lefthook install

#
# Valida git
#
if [ ! -d ".git" ]; then
  echo "⚠️ Repositório git não encontrado."
else
  echo "✅ Git detectado."
fi

#
# Finalização
#
echo ""
echo "✅ Setup concluído com sucesso!"
echo ""
echo "Ferramentas configuradas:"
echo "  • ESLint"
echo "  • Prettier"
echo "  • Lefthook"
echo "  • EditorConfig"
echo ""
