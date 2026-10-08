---
max_turns: 20
timeout_seconds: 900
allowed_tools: [Read, Glob, Grep, Skill, Agent, WebSearch]
---

Tear this apart. Be brutal, don't spare me.

Our /orders page is slow. EXPLAIN ANALYZE on its main query shows a sequential scan on `orders` (2.1M rows) filtering by `customer_id`, taking 1.8 s. There is no index on `orders.customer_id`.

Plan: a migration with `CREATE INDEX CONCURRENTLY idx_orders_customer_id ON orders (customer_id);`, run off-peak. Then re-run EXPLAIN ANALYZE to confirm an index scan, and compare p95 page latency for a week. Rollback is `DROP INDEX CONCURRENTLY`. Postgres 16.
