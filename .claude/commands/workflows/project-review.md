---
name: project:review
description: Run parallel principle reviews against local changes or a PR target.
argument-hint: "[PR number, PR URL, branch name, or latest]"
---

# Review (Claude Adapter)

Use:

1. `skills/review-orchestrator/SKILL.md`
2. `agent-workflows/review/workflow.md`
3. `agent-workflows/review/reviewers.md`
4. `agent-workflows/review/output-template.md`
5. `agent-workflows/review/checklist.md`
6. `review.local.md.example` as the schema reference for local overrides

Persist one synthesized review file under:

`plans/reviews/review-{YYYYMMDD}-{HHMM}-{target-slug}.md`
