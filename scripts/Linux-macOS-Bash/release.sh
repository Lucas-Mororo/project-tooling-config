# Automatiza release.

# Hoje versão simples.

# Depois você pode integrar:

# semantic-release
# changesets
# conventional commits
# CI/CD

#!/usr/bin/env bash

set -e

echo ""
echo "🚀 Starting release..."
echo ""

pnpm lint
pnpm format:check

git status

echo ""
echo "✅ Ready for release"
