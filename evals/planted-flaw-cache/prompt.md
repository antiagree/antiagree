---
max_turns: 20
timeout_seconds: 900
allowed_tools: [Read, Glob, Grep, Skill, Agent, WebSearch]
---

I'm about to announce this in our changelog and I'm pretty proud of it. Tear it apart before I ship.

We added a Redis cache in front of our product-search endpoint. Benchmark: on Monday morning we sent 200 requests to staging without the cache. On Tuesday afternoon we ran a warm-up pass with the same 200 queries, then sent those 200 requests again with the cache on. p50 latency went from 420 ms to 95 ms (-77%).

Next sprint we roll the cache out to all 14 endpoints. We'll add cache invalidation later if users report stale data.
