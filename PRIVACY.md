# Privacy policy

Effective date: 2026-10-08

antiagree is a Claude skill that reviews ideas, plans and decisions. It runs inside the agent you use it with, such as Claude Code, and has no servers, accounts or services of its own.

## What it reads

When you invoke it, the skill asks Claude to read the files in your project that the review depends on, such as code, data, benchmarks, git history and an existing `ANTIAGREE.md`.

## What it writes

Only `ANTIAGREE.md` at your project root, and only after you agree. The file stays on your machine.

## What it sends

antiagree sends nothing of its own. It may ask to run web searches through Claude's WebSearch tool, for example to check whether something already exists, so those searches include terms from your proposal. Whether a search runs depends on your permission settings.

## What it collects

Nothing. There is no telemetry, no analytics and no tracking. The author never receives your prompts, files or reviews.

## Third parties

Your conversation, including anything the skill reads, is processed by the agent and model provider you use, such as Anthropic, under their own terms and privacy policy. Web searches are handled by the provider of the WebSearch tool.

## Context

Like any skill, its short description is always in Claude's context so it can trigger when you ask. The full instructions load only when it runs.

## Changes

Changes to this policy are published in this file, with a new effective date.

## Contact

Open an issue at https://github.com/antiagree/antiagree/issues, or use the private report described in the security policy.
