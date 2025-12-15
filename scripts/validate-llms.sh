#!/usr/bin/env bash
# Validate llms.txt files for consistency and correctness

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "Validating LLMs.txt files..."
echo ""

ERRORS=0

# Check files exist
echo "→ Checking files exist..."
if [ ! -f "$PROJECT_ROOT/static/llms.txt" ]; then
  echo "  ❌ static/llms.txt missing"
  ERRORS=$((ERRORS + 1))
else
  echo "  ✅ static/llms.txt exists"
fi

if [ ! -f "$PROJECT_ROOT/static/llms-full.txt" ]; then
  echo "  ❌ static/llms-full.txt missing"
  ERRORS=$((ERRORS + 1))
else
  echo "  ✅ static/llms-full.txt exists"
fi

echo ""

# Check file sizes are reasonable
echo "→ Checking file sizes..."
NAV_SIZE=$(stat -f%z "$PROJECT_ROOT/static/llms.txt" 2>/dev/null || stat -c%s "$PROJECT_ROOT/static/llms.txt")
FULL_SIZE=$(stat -f%z "$PROJECT_ROOT/static/llms-full.txt" 2>/dev/null || stat -c%s "$PROJECT_ROOT/static/llms-full.txt")

if [ "$NAV_SIZE" -lt 1000 ]; then
  echo "  ⚠️  llms.txt is very small ($NAV_SIZE bytes)"
  ERRORS=$((ERRORS + 1))
elif [ "$NAV_SIZE" -gt 20000 ]; then
  echo "  ⚠️  llms.txt is very large ($NAV_SIZE bytes)"
else
  echo "  ✅ llms.txt size OK ($NAV_SIZE bytes)"
fi

if [ "$FULL_SIZE" -lt 10000 ]; then
  echo "  ⚠️  llms-full.txt is very small ($FULL_SIZE bytes)"
  ERRORS=$((ERRORS + 1))
elif [ "$FULL_SIZE" -gt 200000 ]; then
  echo "  ⚠️  llms-full.txt is very large ($FULL_SIZE bytes)"
else
  echo "  ✅ llms-full.txt size OK ($FULL_SIZE bytes)"
fi

echo ""

# Check structure
echo "→ Checking structure..."

# llms.txt should have key sections
REQUIRED_SECTIONS=("Quick Navigation" "Key Concepts" "Reading Paths" "Note to LLMs")
for section in "${REQUIRED_SECTIONS[@]}"; do
  if grep -q "## $section" "$PROJECT_ROOT/static/llms.txt"; then
    echo "  ✅ Found section: $section"
  else
    echo "  ❌ Missing section: $section"
    ERRORS=$((ERRORS + 1))
  fi
done

echo ""

# llms-full.txt should have all 8 documents
echo "→ Checking llms-full.txt has all pages..."
EXPECTED_DOCS=8
ACTUAL_DOCS=$(grep -c "^## Document:" "$PROJECT_ROOT/static/llms-full.txt" || echo "0")

if [ "$ACTUAL_DOCS" -eq "$EXPECTED_DOCS" ]; then
  echo "  ✅ Found all $EXPECTED_DOCS documents"
else
  echo "  ❌ Expected $EXPECTED_DOCS documents, found $ACTUAL_DOCS"
  ERRORS=$((ERRORS + 1))
fi

echo ""

# Check for valid markdown
echo "→ Checking markdown validity..."
if grep -q "^# Semantic Infrastructure Foundation" "$PROJECT_ROOT/static/llms.txt"; then
  echo "  ✅ llms.txt has correct title"
else
  echo "  ❌ llms.txt title incorrect"
  ERRORS=$((ERRORS + 1))
fi

if grep -q "^# Semantic Infrastructure Foundation - Complete Documentation" "$PROJECT_ROOT/static/llms-full.txt"; then
  echo "  ✅ llms-full.txt has correct title"
else
  echo "  ❌ llms-full.txt title incorrect"
  ERRORS=$((ERRORS + 1))
fi

echo ""

# Summary
echo "════════════════════════════════════════════════════════"
if [ "$ERRORS" -eq 0 ]; then
  echo "  ✅ All validation checks passed"
  echo "════════════════════════════════════════════════════════"
  exit 0
else
  echo "  ❌ Validation failed with $ERRORS error(s)"
  echo "════════════════════════════════════════════════════════"
  echo ""
  echo "Run './scripts/generate-llms.sh' to regenerate files"
  exit 1
fi
