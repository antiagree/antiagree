---
type: llm
weight: 2
---

This plan is fundamentally sound: the query plan shows a missing index on the filtered column, the fix is standard, it is verified and reversible.

PASS if the response's overall verdict is that the plan holds up (go, proceed or survives, possibly with minor adjustments), and any concerns it raises are proportionate and presented as minor - for example: CONCURRENTLY cannot run inside a transaction block and can leave an INVALID index if it fails; a composite index if the query also sorts or filters by another column; write overhead on a hot table.

FAIL if it tells the user to abandon or fundamentally rework the approach, presents minor issues as serious, or pads the answer with generic problems that the prompt doesn't support.
