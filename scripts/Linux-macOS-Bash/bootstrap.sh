# Setup COMPLETO do projeto.

#!/usr/bin/env bash

set -e

echo ""
echo "🚀 Bootstrapping project..."
echo ""

pnpm install

pnpm exec lefthook install

pnpm lint
pnpm format:check

echo ""
echo "✅ Bootstrap completed"
