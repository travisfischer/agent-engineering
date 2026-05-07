---
name: project:review
description: Run parallel principle reviews against local changes or a PR target.
argument-hint: "[PR number, PR URL, branch name, or latest]"
---

# Review (Claude Adapter)

Use:

1. `${CLAUDE_PLUGIN_ROOT}/skills/review-orchestrator/SKILL.md`
2. `${CLAUDE_PLUGIN_ROOT}/workflows/review/workflow.md`
3. `${CLAUDE_PLUGIN_ROOT}/workflows/review/reviewers.md`
4. `${CLAUDE_PLUGIN_ROOT}/workflows/review/output-template.md`
5. `${CLAUDE_PLUGIN_ROOT}/workflows/review/checklist.md`
6. `${CLAUDE_PLUGIN_ROOT}/review.local.md.example` as the schema reference for local overrides

Persist one synthesized review file under:

`plans/reviews/review-{YYYYMMDD}-{HHMM}-{target-slug}.md`
