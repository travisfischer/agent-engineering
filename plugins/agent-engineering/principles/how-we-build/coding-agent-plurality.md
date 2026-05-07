# Coding Agent Plurality

Software projects should be buildable by more than one coding-agent environment with minimal divergence in behavior and outcomes.

## Core Principle

Keep shared workflow logic portable, and keep runtime-specific adapters thin.

## Design Rules

1. **Shared-first logic**
Core instructions, templates, and checklists should live in shared Markdown files.

2. **Thin adapters**
Runtime-specific entry points should be lightweight wrappers that reference shared artifacts.

3. **Equivalent outcomes**
Different agent environments should produce the same classes of outputs from the same repo state.

4. **Controlled duplication**
Some syntax-level duplication is acceptable, but workflow logic should not fork without reason.

5. **Repository-native artifacts**
Outputs should follow repository conventions instead of hidden runtime-specific storage.
