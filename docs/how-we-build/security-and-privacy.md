# Security and Privacy

Security and privacy are design constraints, not later hardening phases.

## Core Principle

Every meaningful system change should preserve or improve confidentiality, integrity, availability, and privacy.

## Commitments

1. Secure by default
2. Privacy by design
3. Least privilege everywhere
4. Defense in depth
5. Explicit trust boundaries

## Rules

1. Non-trivial features should include security and privacy considerations.
2. Define data sensitivity and access boundaries before implementation.
3. Prefer proven security patterns and libraries.
4. Threat-model high-risk changes.
5. Slow down and escalate when security risk is unclear.

## Agent-Specific Security

1. Treat prompt inputs and tool outputs as untrusted.
2. Scope agent tools and credentials to least privilege.
3. Require explicit safeguards for destructive or high-impact actions.
4. Log and review security-sensitive agent actions.
5. Include prompt-injection and data-exfiltration scenarios in review and eval design.
