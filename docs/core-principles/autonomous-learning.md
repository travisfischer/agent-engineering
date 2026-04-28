# Autonomous Learning Principle

LLM-powered systems should be designed to improve themselves through evaluation, replay, and iteration.

## Core Principle

Whenever an LLM-powered capability is introduced, it should be possible to evaluate it, modify it, rerun it, compare outcomes, and learn what better results look like.

## Required Properties

1. **Evaluability everywhere**
Treat LLM usage as a candidate for evaluation, with strongest emphasis on user-facing capabilities.

2. **Scoring signals for core capabilities**
Each core capability should emit a signal, rubric score, or comparable quality indicator.

3. **Replayability by default**
The system should support easy rerun or replay of LLM-powered interactions.

4. **Trace capture with controlled variation**
It should be easy to capture traces, vary inputs or prompts, rerun, and compare.

5. **LLM-readable result representation**
Results should be represented in a way that both humans and LLMs can interpret for improvement loops.

## Improvement Loop Pattern

1. Run a capability and capture trace plus outputs.
2. Evaluate output quality.
3. Propose targeted changes.
4. Replay under controlled conditions.
5. Compare quality, cost, latency, and risk.
6. Keep improvements and repeat.
