# Sacred Schema

Schema is one of the most persistent and expensive-to-change layers in a system. Treat it with extra rigor.

## Core Principle

Any schema change should trigger a deliberate slow-down moment: pause, reason carefully, and review deeply before merge.

## Commitments

1. Schema-first seriousness
2. Quality-first at the data layer
3. Human review for schema changes
4. Specialized schema review
5. Design for extensibility

## Planning Rules

1. No schema change is complete without written design rationale.
2. Changes should explain why existing structures are insufficient.
3. High-risk changes should include rollback or mitigation strategy.
4. Backfills and transformations should be explicit and testable.
5. Prefer the smallest safe scope first.

## Review Checklist

1. Is the domain model correct and durable?
2. Are names clear and stable?
3. Are relationships explicit and integrity-preserving?
4. Are indexes justified by real access patterns?
5. Is the migration or backfill plan safe and observable?
