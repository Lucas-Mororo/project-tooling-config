# Valida ambiente do desenvolvedor.

# Verifica:
# Node
# PNPM
# Git
# versões
# tooling

# Muito usado antes de abrir issue interna.

#!/usr/bin/env bash

set -e

echo ""
echo "🩺 Running environment diagnostics..."
echo ""

check_command () {
  if command -v "$1" &> /dev/null
  then
    echo "✅ $1 installed"
  else
    echo "❌ $1 NOT installed"
  fi
}

check_command node
check_command pnpm
check_command git

echo ""

echo "📦 Versions:"
echo "Node: $(node -v)"
echo "PNPM: $(pnpm -v)"
echo "Git : $(git --version)"

echo ""
echo "✅ Doctor completed"
