#!/bin/bash
set -e
mkdir -p bench
cat > ANTIAGREE.md <<'MD'
# antiagree ledger

## 2026-09-01 - Context router (4 layers)
- Hypothesis: routing context through the 4-layer router cuts tokens by at least 10% on the 8-task bench, with the same success rate.
- Test: full bench, 8 tasks x 3 runs per arm (by 2026-10-01)
- GO if tokens drop 10% or more with a CI that excludes zero / KILL if the CI includes zero
- Status: open
MD
cat > bench/RESULTS.md <<'MD'
# Bench results - 2026-10-02

Context router (4 layers) vs baseline, 8 tasks x 3 runs per arm.

| Metric | Baseline | Router |
| --- | --- | --- |
| Tokens per task (median) | 41.2k | 39.6k |
| Token change (95% CI) | | -4% (-15% to +8%) |
| Success | 22/24 | 22/24 |
MD
cat > README.md <<'MD'
# ctxrouter
A context router for coding agents: four layers (dedupe, rank, trim, summarize) decide what reaches the model's context window.
MD
