---
name: review-core
description: Run the shared review workflow with parallel principle and specialist reviewers and synthesize findings.
---

# Review Orchestrator

## Required References

1. `agent-workflows/review/workflow.md`
2. `agent-workflows/review/reviewers.md`
2. `agent-workflows/review/output-template.md`
3. `agent-workflows/review/checklist.md`

## Core Behavior

1. Resolve target.
2. Load reviewer config if present.
3. Resolve reviewer run set.
4. Dispatch one reviewer subagent per selected reviewer in parallel.
5. Synthesize one final review artifact.
6. Clean up temporary handoff files.
