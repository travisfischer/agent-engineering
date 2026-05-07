# Cloud Coding

Coding environments should be reproducible, provisionable on demand, and agent-operable.

## Core Principle

Any engineer or coding agent should be able to provision a functional development environment with minimal local setup and consistent behavior.

## Commitments

1. One-command environment bootstrap
2. Environment parity over custom local setups
3. Agent-operable from day one
4. Portability across supported providers
5. Deterministic and auditable provisioning

## Required Environment Capabilities

1. Repository access
2. Dependency install and bootstrap
3. Test, lint, and typecheck execution
4. Scoped secret access
5. Support for the repo’s workflow tools
6. Browser-capable validation path when UI work requires it

## Planning Rules

1. New tooling should document how it runs in the default cloud environment.
2. Local-only dependencies should be explicit exceptions.
3. Fresh-provision smoke checks should be part of normal maintenance.
4. Browser-dependent workflows should state whether headless execution is sufficient.
