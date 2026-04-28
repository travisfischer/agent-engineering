# PR Feedback Workflow

## Goal

Resolve PR review feedback with minimal drift, clear reasoning, and focused fixes.

## Hard Constraints

1. Handle every in-scope unresolved feedback item.
2. Do not bundle unrelated cleanup into feedback fixes.
3. Stop and surface blockers when feedback requires broader re-architecture.
4. Non-actioned feedback should receive concrete technical justification.

## Flow

1. Resolve the target PR.
2. Gather unresolved feedback.
3. Classify each item as valid, questionable, or invalid.
4. Implement focused fixes for valid items.
5. Reply clearly to non-actioned items.
6. Commit and push updates.
7. Return a structured summary.
