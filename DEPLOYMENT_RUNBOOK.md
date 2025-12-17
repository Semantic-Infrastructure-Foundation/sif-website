# SIF Website - Deployment Runbook

**Quick reference checklist for deploying SIF website to staging or production**

---

## Pre-Deployment (2 minutes)

```bash
cd /home/scottsen/src/projects/sif-website
```

### 1. Sync Content
```bash
./scripts/sync-docs.sh   # Sync SIF Foundation pages
```

**Expected**: ✅ SIF Foundation pages synced (5-6 files)

### 2. Check Environment Health
```bash
# Staging
curl -s https://sif-staging.mytia.net/health | jq .

# Production
curl -s https://semanticinfrastructurefoundation.org/health | jq .
```

**Expected**: `{"status":"healthy","service":"sif-website"}`

---

## Staging Deployment (10 minutes)

### 1. Deploy to Staging
```bash
./deploy/deploy-container.sh staging
```

**What happens**:
1. Builds container with current docs
2. Tags and pushes to registry
3. Deploys to tia-staging:8082
4. Waits for health check

**Expected**: ✅ Deployment complete! Health check passed

### 2. Run Smoke Tests
```bash
./scripts/smoke-test.sh staging
```

**Tests 6 critical pages**:
- /health, /, /about, /funding, /research, /contact

**Expected**: ✅ ALL SMOKE TESTS PASSED

### 3. Manual Verification
```bash
# Open in browser
open https://sif-staging.mytia.net

# Or curl test
curl -s https://sif-staging.mytia.net/ | grep '<title>'
```

**Verify**:
- □ Homepage loads
- □ Navigation works
- □ Content looks correct

---

## Production Deployment (10 minutes)

⚠️ **Only deploy to production after staging is verified**

### 1. Deploy to Production
```bash
./deploy/deploy-container.sh production
```

**Expected**: ✅ Deployment complete! Health check passed

### 2. Run Smoke Tests
```bash
./scripts/smoke-test.sh production
```

**Expected**: ✅ ALL SMOKE TESTS PASSED

### 3. Monitor for 5 Minutes
```bash
# Watch logs
ssh tia-apps 'podman logs -f sif-website --tail 20'

# Test health
curl -s https://semanticinfrastructurefoundation.org/health | jq .
```

### 4. Final Verification
```bash
# Check critical pages
open https://semanticinfrastructurefoundation.org/
open https://semanticinfrastructurefoundation.org/funding
open https://semanticinfrastructurefoundation.org/about
```

---

## Rollback Procedure

```bash
# List versions
curl https://registry.mytia.net/v2/sif-website/tags/list

# Deploy previous version
ssh tia-apps
podman pull registry.mytia.net/sif-website:v0.9.0
podman stop sif-website
podman rm sif-website
podman run -d --name sif-website \
  -p 0.0.0.0:8011:8000 \
  --health-cmd="curl -f http://localhost:8000/health || exit 1" \
  --health-interval=30s \
  --restart=unless-stopped \
  registry.mytia.net/sif-website:v0.9.0
```

---

## Time Estimates

- **Pre-deployment**: 2 minutes
- **Staging deployment**: 10 minutes
- **Production deployment**: 10 minutes
- **Total**: ~22 minutes

---

## See Also

- **DEPLOYMENT.md**: Complete deployment guide
- **scripts/smoke-test.sh**: Post-deployment smoke tests
