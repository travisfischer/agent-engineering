# Universal Evals Principle

Every LLM-powered capability should have an evaluation story.

## Core Principle

If a capability depends on LLM behavior, there should be a clear path to evaluate it and detect regressions.

## Evaluation Tiers

1. **Project-wide evaluations**
System-level checks across core capabilities.

2. **Context-specific evaluations**
Checks scoped to a workspace, tenant, domain, or integration context.

3. **Capability-level evaluations**
Targeted checks for a single feature or workflow.

## Required Evaluation Properties

1. Easy to create and run
2. Structured scoring outputs
3. Clear regression detection
4. Traceability and comparability across runs
5. Machine-readable outputs for autonomous loops

## Build Rules

1. No LLM-powered feature is complete without a defined evaluation path.
2. Feature proposals should state how quality is scored and how regressions are detected.
3. Evaluation should be designed for repeated execution as the system evolves.
