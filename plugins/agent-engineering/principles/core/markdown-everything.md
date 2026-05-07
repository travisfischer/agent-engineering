# Markdown Everything Principle

By default, any context an agent operates on should be stored as Markdown files.

## Core Principle

1. **Default format is Markdown**
Context that agents read or use should usually be written to Markdown.

2. **Primary exception is JSONL**
Use JSONL for append-only datasets or logs where line-oriented mutation safety matters.

3. **Everything is file-based**
Context should live as files in directories that humans and agents can inspect.

## Why This Matters

1. Markdown is readable by both humans and agents.
2. It provides one consistent interface for context operations.
3. It works well with standard filesystem and shell tooling.
4. It makes persistence, snapshots, and review straightforward.

## Replay and Traceability

1. Render and save context to files before handing it to an agent where possible.
2. Prefer snapshot trees that can be reloaded for replay.
3. Treat dynamic context as point-in-time files, not invisible in-memory state.
