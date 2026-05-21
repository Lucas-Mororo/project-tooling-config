# Reset TOTAL do ambiente.

# Faz:

# clean
# reinstala deps
# reinstala hooks

#!/usr/bin/env bash

set -e

echo ""
echo "♻️ Resetting project..."
echo ""

./scripts/clean.sh

pnpm install

pnpm exec lefthook install

echo ""
echo "✅ Reset completed"
