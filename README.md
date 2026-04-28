# Agent Engineering

`agent-engineering` is an installable workflow and skill package for AI-native software teams.

It packages:

1. project and engineering principle docs
2. shared workflow contracts for brainstorm, planning, review, PR feedback, and PR opening
3. principle-based review orchestration
4. official Codex and Claude runtime adapters

## Package Shape

This repo is structured as a plugin-style package:

1. [`.codex-plugin/plugin.json`](/Users/stream/code/agent-engineering/.codex-plugin/plugin.json) defines the package manifest
2. [skills/](/Users/stream/code/agent-engineering/skills) contains the canonical installable skills
3. [agent-workflows/](/Users/stream/code/agent-engineering/agent-workflows) contains shared workflow contracts, templates, and checklists
4. [docs/](/Users/stream/code/agent-engineering/docs) contains principle documents used directly by the review system
5. [`.codex/`](/Users/stream/code/agent-engineering/.codex) and [`.claude/`](/Users/stream/code/agent-engineering/.claude) are the official runtime support surfaces

## What This Package Supports

### Included

1. Principle-based review workflows
2. Review presets via [review.presets/](/Users/stream/code/agent-engineering/review.presets)
3. Brainstorm workflow
4. Planning workflow
5. PR feedback workflow
6. Open PR workflow

### Not included

1. Environment bootstrap hooks by default
2. GitHub-specific automation assumptions
3. Specialist reviewer persona pack
4. Marketplace metadata for a shared plugin registry

## Specialist Reviewer Personas

This package currently ships principle reviewers, not specialist reviewer personas.

The difference is:

1. **Principle reviewers**
   Review against a principle document such as `quality-first` or `security-and-privacy`.

2. **Specialist reviewer personas**
   Review from a role-oriented prompt such as:
   - security reviewer
   - architecture reviewer
   - TypeScript reviewer
   - data migration reviewer
   - performance reviewer

In the source repo, those personas were separate reviewer prompts that acted like focused sub-reviewers. They are useful when you want expert-style passes in addition to principle checks. This package does not yet include them because they need a cleaner public packaging story.

## Official Runtime Support

The official runtime surfaces in this package are:

1. [`.codex/`](/Users/stream/code/agent-engineering/.codex)
2. [`.claude/`](/Users/stream/code/agent-engineering/.claude)

The current default command names are:

1. Claude: `project:brainstorm`, `project:plan`, `project:review`, `project:pr-feedback`, `project:open-pr`
2. Codex: `project-brainstorm`, `project-plan`, `project-review`, `project-pr-feedback`, `project-open-pr`

These are publishable defaults. Host projects may rename them, but they are not placeholders that must be changed before use.

## Install and Use

### Install command

Use the installer instead of manually copying package files:

```bash
./scripts/install.sh --target /path/to/host-repo
```

Default behavior:

1. installs shared docs, workflows, skills, plans, and review presets
2. installs both `.codex/` and `.claude/` runtime adapters
3. installs `review.local.md` from the `all-principles` preset
4. uses `symlink` mode so the host repo tracks this package directly
5. merges file-by-file into existing directories instead of replacing whole top-level folders

### Common install variants

Install with copied files instead of symlinks:

```bash
./scripts/install.sh --target /path/to/host-repo --mode copy
```

Install only Codex support:

```bash
./scripts/install.sh --target /path/to/host-repo --runtimes codex
```

Install only Claude support:

```bash
./scripts/install.sh --target /path/to/host-repo --runtimes claude
```

Install with a narrower review preset:

```bash
./scripts/install.sh --target /path/to/host-repo --preset quality-and-security
```

Preview without writing files:

```bash
./scripts/install.sh --target /path/to/host-repo --dry-run
```

Overwrite an existing installation:

```bash
./scripts/install.sh --target /path/to/host-repo --force
```

Note:

1. In `symlink` mode, package files are symlinked into the host repo.
2. `review.local.md` is always copied, not symlinked, so host projects can customize it safely.

### Turn on all principle reviewers

If the host repo includes the review workflow files and the referenced principle docs, the default review adapter will run all `mode=always` principle reviewers from:

- [agent-workflows/review/reviewers.md](/Users/stream/code/agent-engineering/agent-workflows/review/reviewers.md)

Run:

1. Claude: `project:review`
2. Codex: `project-review`

Review artifacts are persisted under:

- `plans/reviews/`

This is the default contract. If a host project wants a different output path, update matching references in:

1. `agent-workflows/review/workflow.md`
2. `.claude/commands/workflows/project-review.md`
3. `.codex/prompts/workflows/project-review.md`

### Use a preset reviewer set

To narrow the active principle reviewers, copy one preset to `review.local.md` in the host repo:

1. [review.presets/all-principles.md](/Users/stream/code/agent-engineering/review.presets/all-principles.md)
2. [review.presets/minimal.md](/Users/stream/code/agent-engineering/review.presets/minimal.md)
3. [review.presets/quality-and-security.md](/Users/stream/code/agent-engineering/review.presets/quality-and-security.md)
4. [review.presets/llm-systems.md](/Users/stream/code/agent-engineering/review.presets/llm-systems.md)

Then run:

1. Claude: `project:review`
2. Codex: `project-review`

### Enable only selected principles manually

Create `review.local.md` at the host repo root and use exact reviewer IDs from:

- [agent-workflows/review/reviewers.md](/Users/stream/code/agent-engineering/agent-workflows/review/reviewers.md)

Example:

```md
---
reviewers_include:
  - how-we-build-quality-first
  - how-we-build-security-and-privacy
reviewers_exclude:
  - how-we-build-cloud-coding
  - how-we-build-agent-native
disable_default_specialists: false
review_context: |
  Focus on code quality, verification rigor, security posture, and data handling.
---
```

`reviewers_exclude` wins on conflict, and `review_context` is passed to every reviewer.

## Add a New Principle Reviewer

1. Add the new principle document under:
   - `docs/how-we-build/`, or
   - `docs/core-principles/`
2. Add a row to [agent-workflows/review/reviewers.md](/Users/stream/code/agent-engineering/agent-workflows/review/reviewers.md)
3. Use `reviewer_type: principle` and point `principle_doc` to the new file

Example row:

```md
| how-we-build-testing-discipline | principle | always | docs/how-we-build/testing-discipline.md |  |  | Test design and regression discipline |
```

## Review Artifact Policy

The default persisted output locations are:

1. `plans/brainstorms/`
2. `plans/requirements/`
3. `plans/reviews/`

These are publishable defaults and intentionally part of the package contract. They are also configurable if a host project wants a different artifact layout.

## Notes

This package intentionally avoids product-specific architecture, environment setup, and service-specific operational guidance. It is meant to be portable across repositories while still being directly runnable in Codex and Claude-style environments.
