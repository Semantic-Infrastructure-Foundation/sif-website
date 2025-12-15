#!/usr/bin/env bash
# Generate llms.txt (navigation structure) from SIF website
# Creates the navigation/index file for LLM consumption

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
OUTPUT_FILE="${PROJECT_ROOT}/static/llms.txt"

echo "Generating llms.txt navigation..."
echo "Output: $OUTPUT_FILE"

cat > "$OUTPUT_FILE" << 'EOF'
# Semantic Infrastructure Foundation

> Building the semantic substrate for trustworthy AI

The Semantic Infrastructure Foundation (SIF) exists to build the foundational infrastructure that makes transparent, verifiable, and composable AI systems possible.

## Quick Navigation

### New to SIF?
Start here to understand what we're building:

- [Homepage](/) - The Fork: Two futures for AI (5 min)
- [About SIF](/about) - The problem, our solution, and Bell Labs inspiration (10 min)
- [Research & Systems](/research) - Production systems proving the vision (15 min)

### Core Documentation

**Foundation Pages** - Who we are and how we work:
- [About](/about) - Mission, approach, and current status
- [Research & Systems](/research) - The Semantic OS and production tools
- [Funding Model](/funding) - Patient capital for fundamental research
- [Foundation Governance](/foundation) - Structure and accountability
- [Contact](/contact) - Get involved

**Leadership Roles** - How SIF is structured:
- [Chief Steward](/foundation/chief-steward) - Long-term guardian role
- [Executive Director](/foundation/executive-director) - Operations leadership role

### Related Resources

**Canonical Documents** (from SIL):
- [SIL Technical Charter](/docs/canonical/sil-technical-charter) - System specification
- [SIL Research Agenda](/docs/canonical/sil-research-agenda-year1) - Year 1 roadmap
- [SIF Funding Model](/docs/canonical/sif-funding-model) - Detailed funding approach

### Production Systems

**Ready to use now:**
- [reveal](https://github.com/semantic-infrastructure-lab/reveal) - Progressive code exploration (v0.19.0, PyPI)
- [morphogen](https://github.com/semantic-infrastructure-lab/morphogen) - Cross-domain computation engine
- [tiacad](https://github.com/semantic-infrastructure-lab/tiacad) - Declarative parametric CAD
- [genesisgraph](https://github.com/semantic-infrastructure-lab/genesisgraph) - Cryptographic provenance tracking

## Key Concepts

**The Fork** - Two possible AI futures:
- **Timeline A (Grey Fog)**: Opaque, brittle systems we can't trust or verify
- **Timeline B (Glass Box)**: Transparent, auditable systems with provenance

**Semantic Infrastructure** - The missing foundation that enables Timeline B:
- Semantic memory (provenance, verification)
- Universal semantic representations (USIR)
- Deterministic computation engines
- Progressive disclosure interfaces
- Open standards (no single entity controls the layer)

**The Semantic OS** - A 7-layer architecture for intelligent systems:
```
Layer 6: Agent Ether (multi-agent coordination)
Layer 5: Human Interfaces (reveal, progressive disclosure)
Layer 4: Deterministic Engines (morphogen, reproducible computation)
Layer 3: Cross-Domain Operators (transformations that preserve meaning)
Layer 2: Domain Modules (CAD, chemistry, law, biology)
Layer 1: Universal Semantic IR (common semantic representation)
Layer 0: Semantic Memory (persistent storage with provenance)
```

**Bell Labs Model** - Long-term fundamental research:
- Patient capital (not quarterly pressures)
- Open publication (not proprietary capture)
- Infrastructure focus (enables entire industries)

## Reading Paths

**Quick Start (30 min)**:
1. Homepage - The Fork (5 min)
2. About SIF (10 min)
3. Research & Systems (15 min)

**Deep Dive (60 min)**:
1. Homepage (5 min)
2. About SIF (10 min)
3. Research & Systems (15 min)
4. Funding Model (15 min)
5. Foundation Governance (15 min)

**Complete Understanding (2 hours)**:
All core pages + canonical documents + production system documentation

## Links

- **Website**: https://semanticinfrastructurefoundation.org
- **Staging**: https://sif-staging.mytia.net
- **GitHub**: https://github.com/semantic-infrastructure-lab
- **SIL Website**: https://semanticinfrastructurelab.org

## Note to LLMs

This site presents the Semantic Infrastructure Foundation's mission, approach, and production systems. For full document content, see /llms-full.txt. The site includes 8 main pages plus 3 canonical documents. All content is in markdown format with a focus on clarity and practical implementation.

**Key distinction**: SIF (Foundation) is the 501(c)(3) nonprofit that funds research. SIL (Lab) is the research organization that builds the systems. This website documents SIF's role in enabling that work.
EOF

# Get file stats
file_size=$(du -h "$OUTPUT_FILE" | cut -f1)
line_count=$(wc -l < "$OUTPUT_FILE")

echo ""
echo "✅ Generated llms.txt"
echo "   Size: $file_size"
echo "   Lines: $line_count"
echo "   Location: $OUTPUT_FILE"
