#!/bin/bash
# SIF Website - Documentation Sync Script
# Syncs SIF Foundation content from SIL repo to website for deployment

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WEBSITE_ROOT="$(dirname "$SCRIPT_DIR")"
SIL_REPO="${WEBSITE_ROOT}/../SIL"
SIF_CONTENT_SOURCE="${SIL_REPO}/foundation/website-content/pages"
WEBSITE_DOCS="${WEBSITE_ROOT}/docs"

echo "========================================="
echo "SIF Foundation Documentation Sync"
echo "========================================="
echo ""

# Check if SIL repo exists
if [ ! -d "$SIL_REPO" ]; then
    echo -e "${RED}ERROR: SIL repository not found at $SIL_REPO${NC}"
    echo "Please ensure SIL repo is cloned at the expected location."
    exit 1
fi

echo -e "${GREEN}✓${NC} Found SIL repo: $SIL_REPO"

# Check if SIF foundation content directory exists
if [ ! -d "$SIF_CONTENT_SOURCE" ]; then
    echo -e "${RED}ERROR: SIF foundation content directory not found${NC}"
    echo "Expected: $SIF_CONTENT_SOURCE"
    exit 1
fi

echo -e "${GREEN}✓${NC} Found SIF foundation content directory"
echo ""

# Create website docs directory if it doesn't exist
mkdir -p "$WEBSITE_DOCS"

# Sync all SIF Foundation pages
echo "Syncing SIF Foundation pages..."
rsync -av --delete \
    --exclude='.git' \
    --exclude='*.pyc' \
    --exclude='__pycache__' \
    "$SIF_CONTENT_SOURCE/" \
    "$WEBSITE_DOCS/"
echo -e "${GREEN}✓${NC} SIF Foundation pages synced"

echo ""
echo "========================================="
echo "Validation"
echo "========================================="
echo ""

# Count synced files
TOTAL_COUNT=$(find "$WEBSITE_DOCS" -name "*.md" 2>/dev/null | wc -l)

echo "Synced files:"
echo "  Total: $TOTAL_COUNT markdown files"
echo ""

# List synced files
echo "Synced pages:"
find "$WEBSITE_DOCS" -name "*.md" -type f -exec basename {} \; | sort

echo ""

# Check for expected SIF Foundation pages
REQUIRED_FILES=(
    "index.md"
    "about.md"
    "funding.md"
    "research.md"
    "contact.md"
)

echo "Checking required files..."
MISSING_FILES=0
for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$WEBSITE_DOCS/$file" ]; then
        echo -e "${GREEN}✓${NC} $file"
    else
        echo -e "${YELLOW}⚠${NC}  Missing (optional): $file"
        MISSING_FILES=$((MISSING_FILES + 1))
    fi
done

echo ""

if [ $TOTAL_COUNT -gt 0 ]; then
    echo -e "${GREEN}=========================================${NC}"
    echo -e "${GREEN}✓ Documentation sync completed successfully${NC}"
    echo -e "${GREEN}  Synced $TOTAL_COUNT files from SIF Foundation content${NC}"
    echo -e "${GREEN}=========================================${NC}"
    exit 0
else
    echo -e "${RED}=========================================${NC}"
    echo -e "${RED}✗ ERROR: No files synced${NC}"
    echo -e "${RED}=========================================${NC}"
    exit 1
fi
