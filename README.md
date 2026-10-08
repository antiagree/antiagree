<p align="center"><img src="assets/icon.png" width="128" alt="antiagree logo"></p>

<h1 align="center">antiagree</h1>

antiagree is a Claude skill that reviews your idea, plan, architecture, benchmark or decision the way an outside reviewer with no stake in it would. It checks your claims against the code and the data, looks for what already exists, tries to kill the proposal with the strongest argument it can find, and keeps only what survives.

It doesn't fake harshness. When your plan is sound, it says **GO**.

```
> Verdict: ITERATE. The benchmark measures a 100% hit rate, which production won't have.
> The rollout plan ships a correctness risk with no safeguard.
> Biggest risk: serving stale product data (price, stock) across 14 endpoints, with user
> complaints as the only way to detect it.
> Next step: replay a sample of real production query logs against the cache and measure
> hit rate and p50/p95/p99. GO if the improvement holds at the real hit rate.
```
<sub>Output from the `planted-flaw-cache` eval case on Sonnet 5.5, trimmed.</sub>

## What it does

- **Reads before it judges.** It reads the code, data, benchmarks and git history before judging, and labels every claim: FACT, STRONGLY SUPPORTED, HYPOTHESIS or SPECULATION. No invented percentages.
- **Reviews your session.** Run `/antiagree` with nothing after it and it audits the decisions you and Claude made in this conversation: what was verified, what was only agreed to, and where the goal drifted. It declares that it's anchored, because it helped make those decisions.
- **Checks whether it already exists.** Before you build something, it searches for prior art and asks what is actually different.
- **Holds you to your kill criteria.** It can record experiments and their GO / KILL thresholds in `ANTIAGREE.md`. The next review reads them first, so you can't move the bar after the result is in.
- **Gives a verdict, not a list.** GO, ITERATE, RETHINK or KILL; the biggest risk; the cheapest experiment that settles the question; and the one fact that would change its mind. It closes with the uncomfortable truth, what to keep, what to change, what not to build, and what's still unknown.
- **Calibrated.** It names what your plan gets right before attacking it, credits the safeguards you already built in, and doesn't demand more proof than the decision needs.
- **Answers in your language.** `no me des la razón` works too.

## Install

**Claude Code:**

```
/plugin marketplace add antiagree/antiagree
/plugin install antiagree@antiagree
```

**Other agents with Agent Skills** (Codex, Cursor, Gemini CLI...): copy `skills/antiagree/` into the agent's skills directory, e.g. `~/.claude/skills/antiagree/` for Claude Code without the plugin.

## Use

```
/antiagree                                # review this session's decisions
/antiagree our plan to split the monolith # review anything
/antiagree quick bench/RESULTS.md         # verdict card + top three findings
```

Or just ask: "attack my plan", "be brutally honest", "don't just agree with me".

Once invoked, it keeps the stance for the rest of the session until you tell it to stop.

## Evals

`evals/` holds five cases for `claude plugin eval`. Four run with and without the plugin; `session-review` runs with the plugin only.

| Case | What it tests |
| --- | --- |
| `planted-flaw-cache` | A benchmark with planted flaws (warm-cache measurement, confounded arms, deferred invalidation). |
| `sound-plan-no-theater` | A plan that is actually sound, with "be brutal" in the prompt. Does it say GO or invent problems? |
| `activity-vs-impact-es` | (Spanish) A busy month and a confidence interval that includes zero. |
| `ledger-holds-you-to-it` | A kill criterion in `ANTIAGREE.md` that the latest results met. |
| `session-review` | A session that agreed its way into a plan with unverified numbers. |

Results from 2026-10-08 with `claude plugin eval`, three runs per case, Opus 5.5 as the judge:

| Model | With antiagree | Without |
| --- | --- | --- |
| Sonnet 5.5 | 15/15 | 0/12 |
| Opus 5.5 | 15/15 | 3/12 |
| Haiku 4.5 | 2/15 | 0/12 |

- Without the plugin, Sonnet and Opus still find the planted flaws, but they invent problems in the sound plan and give no decision rule for the benchmark. Sonnet also misses the ledger's kill criterion.
- Haiku 4.5 isn't there yet: with the plugin it still over-criticizes the sound plan, skips the ledger, and reviews only the latest decision of the session.

We wrote these cases, so treat the numbers as signals, not proof.

## Privacy

antiagree is a single skill: instructions only, with no hooks, no MCP servers and no telemetry. Like any skill, its short description is always in Claude's context so it can trigger when you ask; the full instructions load only when it runs. During a review it reads files in your project and may ask to run web searches through Claude's WebSearch tool, for example to check whether something already exists, so those searches include terms from your proposal. It sends nothing anywhere else. It writes `ANTIAGREE.md` only when you agree to it.

## License

MIT
