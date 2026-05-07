# Agent-Native Principle

Agents are first-class operators, not bolt-on assistants.

If a user can do it, an agent should have a supported path to the same outcome.

## Core Principle

Agents should have outcome-level parity with users, using composable primitives so new capabilities can be expressed in prompts and improved over time.

## Constitutional Commitments

1. **Action parity**
Every meaningful user action should have an agent path to the same outcome.

2. **Primitive tools, prompt-defined behavior**
Tools should expose atomic capabilities. Decision logic should live primarily in prompts and reasoning loops, not in rigid workflow code.

3. **Composable features**
New capabilities should often be expressible by composing existing tools and context, not by adding dedicated backend logic each time.

4. **Emergent capability over predefined flows**
The system should handle valid requests that were not hardcoded in advance by combining tools and reasoning.

5. **Improvement over time**
Behavior should improve through better prompts, stronger context, evals, and observed usage patterns, not only code changes.

## Planning and Build Rules

1. Map new UI or API capabilities to agent capabilities before implementation.
2. Prefer adding or refining primitives before introducing workflow-shaped tools.
3. Define what context the agent needs at runtime.
4. Define clear completion conditions for long-running or multi-step tasks.

## Default Quality Checks

1. Can the agent achieve the same user outcome?
2. Are the underlying tools reusable by future features?
3. Did we embed judgment in code that belongs in prompts or policy?
4. Does the agent have enough context to act correctly?
5. Can failures be observed and turned into improvements?
