# Goldilocks Scoping

Choose work scope that is small enough to review and reverse, but large enough to deliver a coherent improvement.

## Commitments

1. Atomic change units
2. Small merge units
3. No speculative build-out
4. Quality without overengineering
5. Local improvement only

## Scoping Rules

1. Define a narrow problem statement before implementation.
2. Deliver one coherent outcome per commit and per PR.
3. Keep unrelated cleanup out of the active change unless required for correctness.
4. If scope grows, split the work into explicit follow-ups.

## Goldilocks Tests

1. Is the change too small to meet quality?
2. Is the change too large and carrying unrelated work?
3. Is it just right for the current problem?
