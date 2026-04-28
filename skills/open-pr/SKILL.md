---
name: open-pr-core
description: Prepare branch state safely, create focused commits, and open a high-signal PR.
---

# Open Pull Request Workflow

## Hard Constraints

1. Use the canonical base branch.
2. Stop on rebase conflicts.
3. Auto-push and auto-open by default unless policy says otherwise.
4. Run required validation before opening the PR.

## Output Contract

Return a final execution summary that includes:

1. Branch decision
2. Rebase result
3. Commit list
4. PR URL
5. Warnings or manual interventions
