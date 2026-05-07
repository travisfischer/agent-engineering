# agent-engineering

Workflows, principles, and review system for AI-native software teams.

This plugin provides shared workflow contracts and principle-based reviewers that you can invoke from Claude Code as slash commands.

## Slash commands

| Command | Purpose |
|---|---|
| `/project:brainstorm` | Explore requirements and approaches before writing a requirement document. |
| `/project:plan` | Turn a brainstorm or feature idea into a structured plan. |
| `/project:review` | Review staged changes against active principle reviewers. |
| `/project:pr-feedback` | Process and apply PR feedback. |
| `/project:open-pr` | Draft and open a PR with proper framing. |

## What's inside

- **`skills/`** — canonical skill specs plus per-runtime adapter skills.
- **`commands/`** — slash command definitions for Claude Code.
- **`workflows/`** — workflow contracts (checklists, templates, output schemas) referenced by skills and commands.
- **`principles/`** — engineering principle documents:
  - `core/` — six core product/team principles.
  - `how-we-build/` — twelve "how we build" principles. These are the source of truth for principle-based reviewers.
- **`review.presets/`** — ready-made `review.local.md` configurations (`all-principles`, `minimal`, `quality-and-security`, `llm-systems`).
- **`review.local.md.example`** — schema reference for host-repo `review.local.md` overrides.
- **`.codex-plugin/`** — Codex runtime adapters for the same workflows.

## Configuring reviewers

By default, `/project:review` runs all `mode=always` principle reviewers from [`workflows/review/reviewers.md`](./workflows/review/reviewers.md).

To narrow the active reviewers, copy a preset to `review.local.md` at your host repo root:

```bash
cp review.presets/quality-and-security.md /path/to/host-repo/review.local.md
```

Or write a custom `review.local.md` using the schema in [`review.local.md.example`](./review.local.md.example):

```md
---
reviewers_include:
  - how-we-build-quality-first
  - how-we-build-security-and-privacy
review_context: |
  Focus on quality bar and data handling.
---
```

`reviewers_exclude` wins on conflict. `review_context` is passed to every reviewer.

## Artifact policy

Workflows write outputs into the host repo:

- `plans/brainstorms/` — brainstorm artifacts
- `plans/requirements/` — requirements / plan artifacts
- `plans/reviews/` — review reports

These paths are relative to the host repo root. The plugin does not prescribe whether to commit them, but they are most useful when committed and accumulate as durable team context.
