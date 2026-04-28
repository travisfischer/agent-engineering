# Prompt and Eval Lifecycle

Prompts are production logic. They need versioning, evaluation, controlled rollout, and rollback.

## Core Principle

No meaningful prompt or model behavior change should be promoted without evaluation evidence and a rollback path.

## Commitments

1. Versioned prompt logic
2. Eval-gated promotion
3. Reproducible comparisons
4. Controlled rollout
5. Rapid rollback

## Lifecycle

1. Define
2. Implement
3. Evaluate
4. Compare
5. Promote
6. Observe
7. Iterate

## Build Rules

1. Every meaningful prompt change should define intended behavior and evaluation plan.
2. Eval definitions should evolve alongside prompts.
3. Promotion decisions should record rationale and evidence.
4. Avoid hidden prompt changes outside versioned control paths.
