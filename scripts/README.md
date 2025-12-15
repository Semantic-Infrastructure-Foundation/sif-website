# SIF Website Scripts

Automation scripts for the SIF website.

## LLMs.txt Generation

Scripts to generate llms.txt files for LLM consumption (following https://llms-txt.io standard).

### Quick Usage

```bash
# Generate both llms.txt and llms-full.txt
./scripts/generate-llms.sh

# Or generate individually:
./scripts/generate-llms-nav.sh      # Navigation structure (llms.txt)
./scripts/generate-llms-full.sh     # Complete content (llms-full.txt)
```

### When to Regenerate

Run `./scripts/generate-llms.sh` after:

1. **Content updates** - Any changes to markdown files in `docs/pages/`
2. **New pages** - Adding new routes/pages (update scripts to include them)
3. **Before deployment** - Ensure llms.txt files are current
4. **Structure changes** - If navigation or reading paths change

### What Gets Generated

**`static/llms.txt` (101 lines, 8KB)**
- Navigation structure for LLM agents
- Quick start guides and reading paths
- Links to all pages and external resources
- Key concepts summary
- Generated from curated template

**`static/llms-full.txt` (1,589 lines, 60KB)**
- Complete content from all 8 SIF pages
- Auto-generated from markdown files in `docs/pages/`
- Frontmatter removed, clean content only
- Structured with clear section headers and URLs

### Files

- `generate-llms.sh` - Main script, runs both generators
- `generate-llms-nav.sh` - Generates llms.txt (navigation)
- `generate-llms-full.sh` - Generates llms-full.txt (complete content)
- `validate-llms.sh` - Validates generated files for consistency

### Automation

**During development:**
```bash
# Add to .git/hooks/pre-commit (optional)
./scripts/generate-llms.sh
git add static/llms*.txt
```

**In CI/CD:**
```bash
# Add to deployment workflow
./scripts/generate-llms.sh
```

### Validation

After generation, verify files are correct:

```bash
./scripts/validate-llms.sh
```

This checks:
- Files exist and have reasonable sizes
- Required sections present in llms.txt
- All 8 documents included in llms-full.txt
- Correct titles and structure
- Valid markdown format

## Other Scripts

- `sync-docs.sh` - Sync canonical docs from SIL repo
- `validate-deployment.sh` - Health checks for deployed site
- `auto-deploy-docs.sh` - Automated doc deployment
- `test-auto-discovery.py` - Test document auto-discovery

## Notes

- **SIL vs SIF**: SIF has simpler structure (8 pages vs SIL's 30+ docs)
- **Manual curation**: llms.txt is manually curated, llms-full.txt is auto-generated
- **Version control**: Both generated files are checked into git
- **Updates**: If you change the nav script, regenerate and commit the output
