---
title: "Research & Systems"
description: "Production systems proving semantic infrastructure works"
---

# Research & Production Systems

SIF's research is **grounded in production systems**. We don't just theorize about semantic infrastructure—we build it, test it, and use it in real workflows.

## The Semantic OS Vision

Our north star is the **Semantic Operating System**: a 7-layer architecture providing semantic infrastructure the way Unix provided OS infrastructure.

### The 7 Layers

**Layer 0: Semantic Memory**
Persistent storage with provenance tracking. Every value knows its computational history.

**Layer 1: USIR (Universal Semantic IR)**
Common intermediate representation for cross-domain knowledge. The "assembly language" of semantics.

**Layer 2: Domain Modules**
Specialized semantic libraries (CAD, chemistry, law, biology) that compose correctly.

**Layer 3: Cross-Domain Operators**
Transformations and queries that work across domain boundaries without losing meaning.

**Layer 4: Deterministic Engines**
Computation orchestration that guarantees reproducibility. Same inputs → same outputs.

**Layer 5: Human Interfaces**
Progressive disclosure, semantic navigation, and glass-box interaction patterns.

**Layer 6: Agent Ether**
Multi-agent coordination substrate. The "TCP/IP for AI agents."

---

## Production Systems (Shipped)

These aren't demos. They're production tools with comprehensive test suites, package distributions, and real users.

---

### Reveal (v0.19.0)

**Layer 5: Human Interfaces**
*Progressive code exploration for developers and AI agents*

**What it does:**
Reveal shows code structure before detail. Instead of reading 10,000 tokens to find one function, you see the outline first (100 tokens), then extract what you need (50 tokens).

**Proof points:**
- **10-150x token reduction** via structure-first exploration
- **~2,000 downloads/month** on PyPI
- **URI-based adapters** (`python://`, `ast://`, `json://`) for semantic navigation
- **Code quality checks** (bugs, security, complexity analysis)

**Gateway value:**
Developers use Reveal → see structure-first thinking → ask "How does this work?" → leads to USIR and Semantic OS concepts.

**Try it:**
```bash
pip install reveal-cli
reveal src/mycode.py            # Structure overview
reveal src/mycode.py my_function # Extract specific function
```

**Repository:** [github.com/scottsen/reveal](https://github.com/scottsen/reveal)

---

### Morphogen (v0.11)

**Layer 4: Deterministic Engines**
*Deterministic cross-domain computation framework*

**What it does:**
Morphogen evaluates computational DAGs (directed acyclic graphs) deterministically. Same input → same output, every time. No hidden state, no surprises.

**Proof points:**
- **1,600+ tests passing** (comprehensive test suite)
- **Deterministic evaluation** with full dependency tracking
- **USIR type system** in production (demonstrates semantic composition)
- **Provenance graphs** showing complete computation history

**Gateway value:**
Shows that semantic operations can compose correctly. Proves that deterministic, reproducible AI computation is feasible at scale.

**Use cases:**
- Scientific simulations requiring reproducibility
- Cross-domain modeling (fluid dynamics + biology + CAD)
- Auditable computation pipelines

**Repository:** [github.com/scottsen/morphogen](https://github.com/scottsen/morphogen)

---

### TiaCAD (v3.1.2)

**Layer 2: Domain Modules**
*Declarative parametric CAD with semantic observability*

**What it does:**
CAD operations as composable semantic transformations. Design as code, not black-box GUI clicks. Every geometry operation preserves type information and tracks provenance.

**Proof points:**
- **1,027 tests passing** (geometry operations, constraints, transformations)
- **Type-preserving operations** (semantic invariants maintained)
- **Composable geometry** (operations chain correctly)
- **Semantic observability** (inspect any value's computational history)

**Gateway value:**
Demonstrates domain-specific semantic infrastructure. Shows how to build on USIR for specialized domains while maintaining semantic guarantees.

**Use cases:**
- Parametric design automation
- Engineering documentation with provenance
- Reproducible manufacturing specifications

**Repository:** [github.com/scottsen/tiacad](https://github.com/scottsen/tiacad)

---

### GenesisGraph (v0.3.0)

**Layer 0: Semantic Memory**
*Cryptographic provenance verification for computational results*

**What it does:**
Every result carries cryptographic proof of its computation history. You can verify "where did this come from?" with mathematical certainty.

**Proof points:**
- **Cryptographic verification** of computation chains
- **Trust assertion protocol** (who computed what, when, how)
- **Provenance as first-class concern** (not an afterthought)
- **Foundation for auditable AI** systems

**Gateway value:**
Enables answering "How do I know this is true?" for AI-generated results. Essential for high-stakes domains (medical, legal, scientific, financial).

**Use cases:**
- Scientific reproducibility (verify research results)
- Auditable AI decisions (regulatory compliance)
- Deepfake detection (distinguish synthetic from real)
- Supply chain verification (track computational provenance)

**Repository:** [github.com/scottsen/genesisgraph](https://github.com/scottsen/genesisgraph)

---

## Research Focus: Agent Ether (Year 1)

The next major milestone is **Agent Ether**: a coordination substrate for multi-agent systems.

**The problem:**
Today's AI agents don't compose. They're isolated LLM calls with ad-hoc tool access. No shared memory, no provenance, no semantic grounding.

**Our approach:**
Agent Ether provides:
- **Shared semantic memory** (GenesisGraph-backed)
- **USIR-based communication** (agents speak same semantic language)
- **Deterministic orchestration** (Morphogen-style computation)
- **Progressive disclosure** (Reveal-style interaction)

**Target:** Research prototype by Q4 2026, production-ready by 2027.

---

## Publications & Documentation

We publish our work continuously:

**Technical documentation:**
- [SIL Core Principles](https://github.com/scottsen/sil-docs/lab/architecture/SIL_CORE_PRINCIPLES.md)
- [Semantic OS Architecture](https://github.com/scottsen/sil-docs/lab/architecture/)
- [Hierarchical Agency Framework](https://github.com/scottsen/sil-docs/docs/canonical/)

**Strategic documentation:**
- [Funding Strategy](/funding)
- SIF Founding Team Brief (coming soon)
- Governance Model (coming soon)

**Philosophy:**
- The Fork: Two Futures for AI (see [homepage](/) for overview)
- Timeline A vs Timeline B (see [homepage](/))

---

## Research Methodology

**How we work:**

1. **Build working systems first** — Theory follows practice
2. **Comprehensive testing** — Every system has extensive test suites
3. **Production deployment** — Tools must work in real workflows
4. **Open documentation** — Publish patterns, publish failures
5. **Progressive disclosure** — Start simple, reveal complexity as needed

**Anti-patterns we avoid:**
- Vaporware (no demos without real code)
- Overfitting to benchmarks (build for real problems)
- Black-box complexity (glass-box transparency always)
- Premature optimization (correctness before speed)

---

## Success Metrics

**Technical:**
- Test coverage >90% across all systems
- Zero data loss in semantic memory operations
- Deterministic reproduction of all computation
- Progressive disclosure achieving 10-100x token efficiency

**Adoption:**
- Major AI labs integrate USIR as IR layer
- Research institutions adopt GenesisGraph for reproducibility
- Regulatory frameworks reference provenance standards
- Multi-agent systems use Agent Ether in production

**Impact:**
- Scientific replication rates improve 20%+
- AI energy efficiency improves 10x via progressive disclosure
- Public trust in AI governance measurably increases
- Timeline B momentum becomes visible

---

## Open Questions

Research areas we're actively exploring:

**Semantic Memory:**
- What's the optimal granularity for provenance tracking?
- How do we handle privacy in cryptographic provenance?
- Can we achieve web-scale semantic memory?

**USIR:**
- What's the minimal viable semantic type system?
- How do we balance expressiveness vs simplicity?
- Can natural language map cleanly to USIR?

**Agent Coordination:**
- What's the right abstraction for multi-agent memory?
- How do we prevent semantic drift in long-running systems?
- Can we guarantee composition without centralization?

---

## Collaborate With Us

**For researchers:**
We're interested in collaborations on semantic memory, provenance systems, and multi-agent coordination. Reach out if you're working on related problems.

**For engineers:**
All four production systems are open source. Contributions welcome. We need help with scaling, optimization, and ecosystem integration.

**For organizations:**
Interested in deploying semantic infrastructure? We can advise on architecture, integration, and best practices.

**Contact:** [See our contact page](/contact)

---

## The Long Game

These systems aren't the end goal—they're proof that the goal is achievable.

**Reveal** proves progressive disclosure works.
**Morphogen** proves deterministic semantic computation scales.
**TiaCAD** proves domain modules can maintain semantic invariants.
**GenesisGraph** proves cryptographic provenance is feasible.

Together, they prove **Timeline B is possible**.

Now we build the rest of the Semantic OS. Join us.
