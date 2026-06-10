---
name: obsidian-vault
description: >
  Obsidian vault integration for project documentation and Claude session context management.
  Vault root: ~/edvmorango/. Each project maps to its own vault directory.

  Trigger this skill whenever the user mentions: obsidian, vault, sync docs, update vault,
  ADR, architecture decision, project summary, save context, save session, load context,
  resume session, handoff, create handoff, compress context, project documentation, "what was
  I working on", or any request to document a feature/decision/work to the vault.

  Also trigger proactively after completing a significant feature, architectural decision, or
  long session — offer to sync or save context even if not asked.
---

# Obsidian Vault Integration

## Core Config

- **Vault root**: `~/edvmorango/`
- **Project name**: `basename` of git repo root (`git rev-parse --show-toplevel`) or `pwd` if not in a repo
- **All files**: Markdown format

## Vault Structure Per Project

```
~/edvmorango/<project>/
├── README.md           # overview, goals, tech stack, architecture
├── tasks.md            # open/in-progress/done tasks (product projects only)
├── practices.md        # conventions, gotchas, patterns (append-only)
├── adrs/               # Architecture Decision Records
│   └── YYYY-MM-DD-<title>.md
└── context/            # Claude session handoffs
    └── YYYY-MM-DD-<topic>.md
```

---

## Mode 1: Sync

**When**: user says "sync vault", "update docs", "update vault", after completing a feature/ADR, or proactively at session end.

### Steps

1. Detect project:
   ```bash
   basename $(git rev-parse --show-toplevel 2>/dev/null || pwd)
   ```
2. Create `~/edvmorango/<project>/` if absent
3. Read: `git log --oneline -20`, changed files since last relevant commit, key source files
4. Update or create each document based on what changed

### README.md

Update when tech stack, architecture, or major features change.

```markdown
# <project>

<tagline — one sentence: what it is and for whom>

**Problem:** [pain being solved]
**Solution:** [how this project solves it]

## Architecture

### Technology Stack
- **Language**: ...
- **Runtime/Framework**: ...
- **Database**: ...
- **Key libs**: ...

### Project Structure
[code tree with brief annotation per directory/file]

## Core Domains
[per domain: entity fields, key queries/commands, status flows]

## Persistence Layer
[repository pattern, key design decisions, row model separation if any]

## Error Handling
[exception hierarchy as tree]

## Auth
[auth mechanism, context/role hierarchy as tree]

## Build & Development

### Prerequisites
[runtime, infra, tooling]

### Commands
[most-used commands with brief note]

### Code Style
[conventions, linting rules, patterns enforced]

## Testing
[framework, DB strategy, base class pattern, example]
```

### tasks.md _(product/feature projects only)_

Skip for configuration/tooling repos (e.g. home-manager, dotfiles). Create only for projects with product features or user-facing work. Refresh on every sync. Derive from: git log, TODOs/FIXMEs, conversation context.

```markdown
# Tasks

## In Progress

### T-XX — <feature name>

**What:** [brief description]

**Done when:**
- [acceptance criterion]
- [acceptance criterion]

---

## Backlog

### T-XX — <feature name>
...

---

## Done (recent)
- T-XX — <feature name>
- T-XX — <feature name>
```

### practices.md

Append-only — never delete existing entries, only add. Accumulate conventions, gotchas, non-obvious patterns discovered.

```markdown
# Practices

## Conventions
[naming, structure, style decisions specific to this project]

## Gotchas
[traps, non-obvious behaviors, things that wasted time once]

## Patterns
[recurring solutions, preferred approaches]

## Tools & Config
[tooling quirks, useful flags, env setup notes]
```

### adrs/<date>-<title>.md

Create when architectural decision was made. Title = kebab-case summary. Only create for real architectural choices — not routine tasks.

```markdown
# ADR: <human-readable title>

**Status:** Accepted
**Date:** YYYY-MM-DD
**Context:** [project area, e.g. "Infrastructure", "API design"]

---

## Context

### Problem
[what problem or need triggered this decision]

### Requirements
- [constraint or quality requirement]
- [constraint or quality requirement]

---

## Options Considered

### 1. <Option Name>

**Pros:**
- ...

**Cons:**
- ...

### 2. <Option Name> (Selected)

**Pros:**
- ...

**Cons:**
- ...

---

## Decision

[one clear statement of what was decided]

## Related Decisions
- [linked ADR or decision area]
```

---

## Mode 2: Context Write (Save Session)

**When**: user says "save context", "save session", "create handoff", "compress context", or proactively offer at end of long/significant session.

### Steps

1. Detect project name
2. Create `~/edvmorango/<project>/context/` if absent
3. If topic isn't clear from conversation, ask: "What should I call this session? (e.g. 'auth-refactor', 'db-migration')"
4. Generate filename: `YYYY-MM-DD-<topic>.md` using today's date
5. Write context file

### Context File Format

```markdown
# Session: <topic>

**Date:** YYYY-MM-DD
**Project:** <project>

## What Was Done
[concise summary of work completed — what changed and why, not a commit log]

## Key Decisions
[important choices made this session, with brief rationale — focus on non-obvious ones]

## Current State
[exact state of the work: what's done, what's partial, what's broken, what's pending]

## Next Steps
[concrete next actions in priority order — specific enough to act on cold]

## Open Questions
[unresolved issues, blockers, things to investigate or decide]

## Key Files
[files most central to this work — path + one-line note on relevance]

## Context Notes
[anything that would save a future Claude session time: env quirks, undocumented constraints,
shortcuts discovered, what NOT to try again and why]
```

**Quality bar**: the goal is that a fresh Claude session reading this file can pick up exactly where this one left off — no re-investigation needed. Write for a reader with zero prior context.

---

## Mode 3: Context Read (Resume Session)

**When**: user says "load context", "resume session", "what was I working on", or starts a session in a project that has vault context.

### Steps

1. Detect project name
2. List `~/edvmorango/<project>/context/` sorted by modification date descending
3. Present last 5 (or fewer if less exist):
   ```
   Available sessions for <project>:
   1. 2026-06-10 — auth-refactor
   2. 2026-06-08 — database-migration
   3. 2026-06-05 — api-design
   4. 2026-06-01 — setup
   5. 2026-05-28 — initial
   
   Which to load? (or "latest" for most recent)
   ```
4. Read selected file
5. Summarize key points explicitly: current state, next steps, open questions — don't just dump the file

---

## Combined: End-of-Session

When user ends a significant session, offer both together:
> "Want me to save session context and sync vault docs before we finish?"

Run sync first (so practices/tasks are current), then write context file.
