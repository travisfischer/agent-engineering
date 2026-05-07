# LLM Model Fluid Principle

LLM-powered systems should remain provider-agnostic and model-agnostic wherever practical.

## Core Principle

1. **No hard-coded model dependency**
System components should not be tightly coupled to one model, provider, or agent runtime.

2. **Swappability by default**
Any model used in development or production should be easy to replace without rewriting features.

3. **Continuous evaluation over static choice**
Model choice is an ongoing decision based on observed trade-offs, not a one-time architecture decision.

## Why This Matters

The model landscape changes quickly. Good architecture preserves freedom to optimize for:

1. Quality
2. Reliability
3. Latency
4. Cost

## System Design Requirements

1. Centralize model configuration and routing.
2. Capture per-call metadata for quality, cost, and latency comparison.
3. Treat tier labels such as `FAST`, `CHEAP`, and `SMART` as functional roles rather than fixed model names.

## Development Requirements

1. Validate important features across more than one provider family when feasible.
2. Make model comparison routine rather than exceptional.
3. Treat single-provider lock-in as a design smell unless explicitly justified.
