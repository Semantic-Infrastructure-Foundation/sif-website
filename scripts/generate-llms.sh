#!/usr/bin/env bash
# Generate both llms.txt and llms-full.txt for SIF website
# This is the main script - runs both generators

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "════════════════════════════════════════════════════════"
echo "  Generating LLMs.txt files for SIF"
echo "════════════════════════════════════════════════════════"
echo ""

# Generate llms.txt (navigation)
if [ -f "$SCRIPT_DIR/generate-llms-nav.sh" ]; then
  echo "→ Generating llms.txt (navigation)..."
  "$SCRIPT_DIR/generate-llms-nav.sh"
  echo ""
else
  echo "⚠️  Warning: generate-llms-nav.sh not found, skipping llms.txt"
  echo ""
fi

# Generate llms-full.txt (complete content)
if [ -f "$SCRIPT_DIR/generate-llms-full.sh" ]; then
  echo "→ Generating llms-full.txt (complete content)..."
  "$SCRIPT_DIR/generate-llms-full.sh"
  echo ""
else
  echo "⚠️  Warning: generate-llms-full.sh not found, skipping llms-full.txt"
  echo ""
fi

echo "════════════════════════════════════════════════════════"
echo "  ✅ LLMs.txt generation complete"
echo "════════════════════════════════════════════════════════"
