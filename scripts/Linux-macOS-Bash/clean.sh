# Remove:

# caches
# builds
# node_modules
# turbo
# dist

# Muito útil quando tooling quebra.

#!/usr/bin/env bash

set -e

echo ""
echo "🧹 Cleaning project..."
echo ""

rm -rf node_modules
rm -rf dist
rm -rf build
rm -rf coverage
rm -rf .next
rm -rf .turbo

echo ""
echo "✅ Clean completed"
