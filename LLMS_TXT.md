# LLMs.txt Files for SIF Website

Quick reference for maintaining llms.txt files.

## What Are These Files?

Following the [llms.txt standard](https://llms-txt.io), we provide two files for LLM agent consumption:

- **`/llms.txt`** - Navigation structure, quick start guides, key concepts
- **`/llms-full.txt`** - Complete documentation in one file

## Regenerate After Changes

```bash
# Simple - just run this after editing content:
./scripts/generate-llms.sh

# That's it! Commit the changes:
git add static/llms*.txt
git commit -m "docs: Regenerate llms.txt files"
```

## When to Regenerate

✅ After editing any page in `docs/pages/`
✅ After adding new pages
✅ Before deployment
✅ After changing navigation structure

## Files Generated

| File | Lines | Size | Purpose | How Generated |
|------|-------|------|---------|---------------|
| `static/llms.txt` | 101 | 8KB | Navigation & discovery | `generate-llms-nav.sh` |
| `static/llms-full.txt` | 1,589 | 60KB | Complete content | `generate-llms-full.sh` |

## Scripts

- `./scripts/generate-llms.sh` - **Run this one** (generates both files)
- `./scripts/validate-llms.sh` - **Then run this** (validates consistency)
- `./scripts/generate-llms-nav.sh` - Navigation only
- `./scripts/generate-llms-full.sh` - Full content only
- See `./scripts/README.md` for complete details

## Verify Generation

```bash
# Quick check - files exist and have content
ls -lh static/llms*.txt

# Should see:
# -rw-rw-r-- 60K llms-full.txt
# -rw-rw-r-- 8K  llms.txt

# Full validation - structure, content, consistency
./scripts/validate-llms.sh
```

## Served URLs

Once deployed:
- https://semanticinfrastructurefoundation.org/llms.txt
- https://semanticinfrastructurefoundation.org/llms-full.txt

## Need Help?

See comprehensive docs: `/home/scottsen/src/tia/docs/LLMS_TXT_AUTOMATION.md`
