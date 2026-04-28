# Review Workflow

## Goal

Run principle and specialist reviews in parallel and produce actionable findings while persisting only one final review artifact.

## Output Contract

Persist one final review file. Use temporary per-reviewer files only for orchestration handoff during execution.

## Flow

1. Resolve target and changed files.
2. Load reviewer config and reviewer registry.
3. Resolve reviewer run set deterministically.
4. Dispatch one reviewer per selected reviewer source in parallel.
5. Synthesize reviewer outputs into one final review artifact.
6. Clean up temporary artifacts.
7. Return concise results.
