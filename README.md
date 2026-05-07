# agent-engineering

Workflows, principles, and review system for AI-native software teams. Distributed as a Claude Code marketplace plugin.

## Install

In Claude Code:

```
/plugin marketplace add travisfischer/agent-engineering
/plugin install agent-engineering@agent-engineering
```

That's it — the plugin lives in Claude Code's plugin cache, not in your project repo. Nothing is copied into your codebase as a side effect of install.

## What you get

Five slash commands:

| Command | Purpose |
|---|---|
| `/project:brainstorm` | Explore requirements and approaches before writing requirements. |
| `/project:plan` | Turn a brainstorm into a structured plan. |
| `/project:review` | Review staged changes against active principle reviewers. |
| `/project:pr-feedback` | Process and apply PR feedback. |
| `/project:open-pr` | Draft and open a PR with proper framing. |

Plus a principle-based review system with two principle sets:

- [`principles/core/`](./plugins/agent-engineering/principles/core/) — six core product/team principles (agent-native, autonomous-learning, llm-model-fluid, markdown-everything, universal-evals).
- [`principles/how-we-build/`](./plugins/agent-engineering/principles/how-we-build/) — twelve "how we build" principles (quality-first, security-and-privacy, observability-and-incidents, sacred-schema, and more).

Reviewers run from [`workflows/review/reviewers.md`](./plugins/agent-engineering/workflows/review/reviewers.md). To narrow the active set, copy a preset to `review.local.md` at your host repo root or write a custom one — see [the inner README](./plugins/agent-engineering/README.md#configuring-reviewers).

## Repo layout

This repo is a Claude Code plugin marketplace:

```
.
├── .claude-plugin/
│   └── marketplace.json         # marketplace manifest
└── plugins/
    └── agent-engineering/       # the plugin
        ├── .claude-plugin/
        │   └── plugin.json
        ├── .codex-plugin/       # Codex runtime support
        ├── skills/              # canonical + adapter skills
        ├── commands/            # slash command definitions
        ├── workflows/           # workflow contracts
        ├── principles/          # principle docs (the review source-of-truth)
        ├── review.presets/      # ready-made reviewer configurations
        ├── README.md
        ├── CHANGELOG.md
        └── LICENSE
```

See [the inner README](./plugins/agent-engineering/README.md) for the plugin-internal layout and configuration details.

## Artifact policy

Workflows write outputs into your host repo:

- `plans/brainstorms/`
- `plans/requirements/`
- `plans/reviews/`

These are most useful when committed and accumulate as durable team context.

## Adding a principle reviewer

1. Add the principle document under [`plugins/agent-engineering/principles/core/`](./plugins/agent-engineering/principles/core/) or [`principles/how-we-build/`](./plugins/agent-engineering/principles/how-we-build/).
2. Add a row to [`plugins/agent-engineering/workflows/review/reviewers.md`](./plugins/agent-engineering/workflows/review/reviewers.md) using `reviewer_type: principle` and pointing `principle_doc` to the new file (relative to `${CLAUDE_PLUGIN_ROOT}`).

## Codex support

Codex adapters are under [`plugins/agent-engineering/.codex-plugin/`](./plugins/agent-engineering/.codex-plugin/). Codex marketplace install is not yet wired up; for now Codex users can clone and reference these directly.

## License

[MIT](./LICENSE)
