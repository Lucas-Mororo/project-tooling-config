#!/usr/bin/env bash
set -euo pipefail

# Script para copiar arquivos de tooling do template para um repositório alvo.
# Uso: ./scripts/bootstrap-copy.sh /caminho/para/repo [--force]

SRC_DIR=$(dirname "${BASH_SOURCE[0]}")/..
TARGET=${1:-}
FORCE=false

if [ "$TARGET" = "" ]; then
  echo "Uso: $0 /caminho/para/repo [--force]"
  exit 2
fi

if [ "${2:-}" = "--force" ]; then
  FORCE=true
fi

echo "Copiando tooling from $SRC_DIR to $TARGET"

FILES=(
  "lefthook.yml"
  "eslint.config.js"
  ".editorconfig"
  ".gitignore"
  "configs"
)

for f in "${FILES[@]}"; do
  src="$SRC_DIR/$f"
  dest="$TARGET/$f"

  if [ ! -e "$src" ]; then
    echo "Aviso: arquivo/folder não existe no template: $src"
    continue
  fi

  if [ -e "$dest" ] && [ "$FORCE" = false ]; then
    read -p "O destino '$dest' já existe. Sobrescrever? [y/N] " ans
    case "$ans" in
      [Yy]*) ;;
      *) echo "Pulando $dest"; continue ;;
    esac
  fi

  echo "Copiando $f -> $dest"
  rm -rf "$dest"
  cp -R "$src" "$dest"
done

echo "Cópia concluída. Recomendo executar no destino:"
cat <<EOF
pnpm install
pnpm exec lefthook install
pnpm run lint:fix
pnpm run format
pnpm run format:check
EOF

exit 0
