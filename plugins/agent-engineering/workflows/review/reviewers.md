# Reviewer Registry

This registry defines a generic default reviewer set for multi-reviewer workflow orchestration.

There are two reviewer layers:

1. `principle` reviewers: evaluate against principle documents in this repo
2. `specialist` reviewers: optional deep reviewers defined by the adopting project

## Output Naming

Each reviewer writes `reviewer-{reviewer_id}.md` to a temporary orchestration directory.

## Trigger Semantics

- `always`: run on every target
- `conditional`: run only when trigger rules match changed paths or metadata

## Default Reviewers

| reviewer_id | reviewer_type | mode | principle_doc | source_prompt | trigger_when | focus |
|---|---|---|---|---|---|---|
| how-we-build-agent-native | principle | always | ${CLAUDE_PLUGIN_ROOT}/principles/how-we-build/agent-native.md |  |  | Agent-operable development workflows |
| how-we-build-coding-agent-plurality | principle | always | ${CLAUDE_PLUGIN_ROOT}/principles/how-we-build/coding-agent-plurality.md |  |  | Shared-core and thin-adapter discipline |
| how-we-build-cloud-coding | principle | always | ${CLAUDE_PLUGIN_ROOT}/principles/how-we-build/cloud-coding.md |  |  | Reproducible environment readiness |
| how-we-build-compound-engineering | principle | always | ${CLAUDE_PLUGIN_ROOT}/principles/how-we-build/compound-engineering.md |  |  | Compounding loop quality and artifacts |
| how-we-build-goldilocks-scoping | principle | always | ${CLAUDE_PLUGIN_ROOT}/principles/how-we-build/goldilocks-scoping.md |  |  | Scope sizing and anti-overbuild |
| how-we-build-observability-and-incidents | principle | always | ${CLAUDE_PLUGIN_ROOT}/principles/how-we-build/observability-and-incidents.md |  |  | Signal quality and incident readiness |
| how-we-build-prompt-and-eval-lifecycle | principle | always | ${CLAUDE_PLUGIN_ROOT}/principles/how-we-build/prompt-and-eval-lifecycle.md |  |  | Prompt versioning and eval gating |
| how-we-build-quality-first | principle | always | ${CLAUDE_PLUGIN_ROOT}/principles/how-we-build/quality-first.md |  |  | Quality bar and verification rigor |
| how-we-build-release-and-rollout | principle | always | ${CLAUDE_PLUGIN_ROOT}/principles/how-we-build/release-and-rollout.md |  |  | Confidence-first release discipline |
| how-we-build-sacred-schema | principle | always | ${CLAUDE_PLUGIN_ROOT}/principles/how-we-build/sacred-schema.md |  |  | Schema rigor and migration safety |
| how-we-build-security-and-privacy | principle | always | ${CLAUDE_PLUGIN_ROOT}/principles/how-we-build/security-and-privacy.md |  |  | Secure-by-default and privacy-by-design |
| core-principles-agent-native | principle | always | ${CLAUDE_PLUGIN_ROOT}/principles/core/agent-native.md |  |  | Product agent-native alignment |
| core-principles-autonomous-learning | principle | always | ${CLAUDE_PLUGIN_ROOT}/principles/core/autonomous-learning.md |  |  | Self-improving loop capability |
| core-principles-llm-model-fluid | principle | always | ${CLAUDE_PLUGIN_ROOT}/principles/core/llm-model-fluid.md |  |  | Model and provider swapability |
| core-principles-markdown-everything | principle | always | ${CLAUDE_PLUGIN_ROOT}/principles/core/markdown-everything.md |  |  | Markdown-first context persistence |
| core-principles-universal-evals | principle | always | ${CLAUDE_PLUGIN_ROOT}/principles/core/universal-evals.md |  |  | Eval coverage for LLM functionality |

## Notes

This repo does not yet ship a default specialist reviewer prompt pack.

Adopting projects can extend this file with specialist reviewers such as:

1. security
2. architecture
3. typescript
4. data migration
5. performance
