#!/usr/bin/env bash
# Generate llms-full.txt from SIF documentation
# Concatenates all public-facing documentation into a single file for LLM consumption

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
OUTPUT_FILE="${PROJECT_ROOT}/static/llms-full.txt"
DOCS_DIR="${PROJECT_ROOT}/docs/pages"

echo "Generating llms-full.txt from SIF documentation..."
echo "Docs dir: $DOCS_DIR"
echo "Output: $OUTPUT_FILE"

# Check docs directory exists
if [ ! -d "$DOCS_DIR" ]; then
  echo "Error: Docs directory not found at $DOCS_DIR"
  exit 1
fi

# Start with header
cat > "$OUTPUT_FILE" << 'EOF'
# Semantic Infrastructure Foundation - Complete Documentation
# Generated for LLM consumption
# Source: https://semanticinfrastructurefoundation.org
# Staging: https://sif-staging.mytia.net

This file contains the complete public-facing documentation for the Semantic Infrastructure Foundation.

---

EOF

# Function to add a document
add_document() {
  local file=$1
  local title=$2
  local url=$3

  if [ ! -f "$file" ]; then
    echo "Warning: File $file not found, skipping"
    return
  fi

  local filename=$(basename "$file")

  echo "Adding: $filename → $url"

  echo "" >> "$OUTPUT_FILE"
  echo "# ======================================================================" >> "$OUTPUT_FILE"
  echo "# $title" >> "$OUTPUT_FILE"
  echo "# ======================================================================" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
  echo "## Document: $filename" >> "$OUTPUT_FILE"
  echo "## Path: $url" >> "$OUTPUT_FILE"
  echo "## URL: https://semanticinfrastructurefoundation.org$url" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"

  # Remove frontmatter and add content
  awk '
    BEGIN { in_frontmatter=0; frontmatter_count=0 }
    /^---$/ {
      frontmatter_count++
      if (frontmatter_count <= 2) {
        in_frontmatter = !in_frontmatter
        next
      }
    }
    !in_frontmatter { print }
  ' "$file" >> "$OUTPUT_FILE"

  echo "" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
}

# Add pages in logical order
add_document "$DOCS_DIR/index.md" "HOMEPAGE" "/"
add_document "$DOCS_DIR/about.md" "ABOUT SIF" "/about"
add_document "$DOCS_DIR/research.md" "RESEARCH & PRODUCTION SYSTEMS" "/research"
add_document "$DOCS_DIR/funding.md" "FUNDING MODEL" "/funding"
add_document "$DOCS_DIR/contact.md" "CONTACT" "/contact"
add_document "$DOCS_DIR/foundation/index.md" "FOUNDATION GOVERNANCE" "/foundation"
add_document "$DOCS_DIR/foundation/chief-steward.md" "CHIEF STEWARD ROLE" "/foundation/chief-steward"
add_document "$DOCS_DIR/foundation/executive-director.md" "EXECUTIVE DIRECTOR ROLE" "/foundation/executive-director"

# Add footer
cat >> "$OUTPUT_FILE" << 'EOF'

---

# ========================================
# END OF DOCUMENTATION
# ========================================

## Summary

This file contains all public-facing documentation for the Semantic Infrastructure Foundation website:

**Main Pages (8):**
- Homepage (/) - The Fork: Two futures for AI
- About (/about) - Mission, approach, Bell Labs inspiration
- Research (/research) - Production systems and Semantic OS
- Funding (/funding) - Hybrid foundation funding model
- Contact (/contact) - Ways to engage with SIF
- Foundation (/foundation) - Governance model
- Chief Steward (/foundation/chief-steward) - Guardian role
- Executive Director (/foundation/executive-director) - Operations role

**Key Themes:**
- Timeline A (Grey Fog) vs Timeline B (Glass Box)
- Semantic infrastructure as missing foundation
- Production systems proving the vision (Reveal, Morphogen, TiaCAD, GenesisGraph)
- Anti-capture governance and funding
- Transparency and honest assessment

**Organizational Status (December 2025):**
- Early formation stage
- Solo founder (Scott Senkeresty)
- 4 production systems shipped
- No 501(c)(3) filed yet
- No funding or team
- Building in the open with full transparency

**Key Distinction:**
SIF (Foundation) = 501(c)(3) nonprofit that funds research
SIL (Lab) = Research organization that builds the systems
This website documents SIF's role in enabling and funding SIL's work.
EOF

# Add generation timestamp
echo "" >> "$OUTPUT_FILE"
echo "Generated: $(date -u +"%Y-%m-%d %H:%M:%S UTC")" >> "$OUTPUT_FILE"

# Get file stats
file_size=$(du -h "$OUTPUT_FILE" | cut -f1)
line_count=$(wc -l < "$OUTPUT_FILE")

echo ""
echo "✅ Generated llms-full.txt"
echo "   Size: $file_size"
echo "   Lines: $line_count"
echo "   Location: $OUTPUT_FILE"
