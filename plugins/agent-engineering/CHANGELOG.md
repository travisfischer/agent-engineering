# Changelog

## 0.2.0

- Restructured as a Claude Code marketplace plugin (`plugins/agent-engineering/`).
- Added `.claude-plugin/marketplace.json` and `.claude-plugin/plugin.json`.
- Internal references updated to `${CLAUDE_PLUGIN_ROOT}` for portability.
- Removed the legacy `scripts/install.sh` vendoring installer; install via `/plugin marketplace add` instead.
- Removed `plans/` scaffolding from the package; host repos create these directories on first artifact write.

## 0.1.0

- Initial package: workflows for brainstorm, plan, review, PR feedback, and open-PR; principle-based review system.
