# Open PR Workflow

## Goal

Open a high-signal pull request with safe branch hygiene and focused commits.

## Hard Constraints

1. Use the repository’s canonical base branch.
2. Never continue through unresolved rebase conflicts.
3. Auto-push and open PR by default unless local policy says otherwise.
4. Validate required checks before opening the PR.
5. Do not hide partial state transitions.

## Flow

1. Run preflight checks.
2. Capture working state and preserve WIP if needed.
3. Fetch latest base branch.
4. Resolve branch strategy.
5. Rebase onto base branch.
6. Restore WIP if applicable.
7. Create focused commits.
8. Run validation checks.
9. Generate PR body.
10. Push and open the PR.
11. Return an execution summary.
