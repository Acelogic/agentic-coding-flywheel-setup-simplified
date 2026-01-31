# NTM Agentic Workflow Guide

A practical guide for leveraging the Dicklesworthstone multi-agent workflow to maximize development velocity. This document covers patterns, strategies, and real-world examples for orchestrating AI agents effectively.

**Part of the Agentic Coding Flywheel:** https://agent-flywheel.com/

> This guide works with or without the `flywheel` script. The script automates installation, but all tools can be installed manually via `flywheel missing`.

---

## The Admin/Worker Model

⚠️ **Critical Concept:** There are two types of agents in this workflow:

### Admin Agent (Orchestrator)
- Runs `flywheel` commands
- Creates tasks with `br`
- Spawns workers with `ntm spawn`
- Assigns work with `ntm send`
- Monitors progress
- Reviews results
- **Does NOT write code directly**

### Worker Agents (Implementers)
- Spawned by the admin via `ntm spawn`
- Receive instructions via `ntm send`
- Do the actual coding work
- Use MCP Agent Mail for file coordination
- Update task status with `br update`

```
┌─────────────────────────────────────────────────────────────┐
│                      ADMIN AGENT                            │
│      (flywheel start, br create, ntm spawn/send)            │
└────────────────────────┬────────────────────────────────────┘
                         │
         ┌───────────────┼───────────────┐
         ▼               ▼               ▼
    ┌─────────┐    ┌─────────┐    ┌─────────┐
    │ Worker  │    │ Worker  │    │ Worker  │
    │ (codes) │    │ (codes) │    │ (codes) │
    └─────────┘    └─────────┘    └─────────┘
```

**Why this matters:**
- Admin maintains high-level oversight
- Workers can run in parallel without stepping on each other
- MCP Agent Mail handles file locking between workers
- Clear separation of orchestration vs implementation

---

## Philosophy

The NTM workflow is built on three principles:

1. **Parallel Execution** - Multiple worker agents implement different parts simultaneously
2. **Specialization** - Each agent type has strengths; use them strategically
3. **Coordination** - Workers coordinate through MCP Agent Mail, admin coordinates through NTM

```
Traditional: You → Agent → Result → You → Agent → Result → ...

NTM Style:   Admin → [Worker₁, Worker₂, Worker₃] → [Result₁, Result₂, Result₃] → Merged Result
```

---

## Agent Characteristics

| Agent | Best For | Personality |
|-------|----------|-------------|
| **Claude Code** | Complex reasoning, architecture, refactoring, debugging | Thorough, considers edge cases, asks clarifying questions |
| **Codex CLI** | Quick implementations, scripts, boilerplate | Fast, direct, code-focused |
| **Gemini CLI** | Research, documentation, alternative perspectives | Broad knowledge, good at summarization |

### Recommended Configurations

```bash
# Exploratory work (figuring out approach)
ntm spawn explore --cc=2 --gmi=1

# Implementation sprint
ntm spawn impl --cc=1 --cod=2

# Complex refactoring
ntm spawn refactor --cc=3

# Documentation & testing
ntm spawn docs --cc=1 --gmi=1 --cod=1
```

---

## Core Workflows

### Workflow 0: Admin Agent Setup (Start Here)

Before spawning workers, the admin agent should:

```bash
# 1. Get admin context
flywheel start                    # Outputs admin agent instructions

# 2. ASK the user what agents they want
# "Which AI agents? (Claude, Codex, Gemini) How many?"

# 3. Check/create tasks
br ready                          # See existing tasks
br create "Task description" --type feature

# 4. Spawn workers (use --no-user since admin is separate)
ntm spawn myproject --cc=2 --no-user        # 2 Claude workers (example)
# Other options based on user preference:
# ntm spawn myproject --cod=2 --no-user     # 2 Codex workers
# ntm spawn myproject --cc=1 --gmi=1 --no-user  # 1 Claude + 1 Gemini

# 5. Assign work (DO NOT code yourself!)
ntm send myproject --pane=0 "Read ARCHITECTURE.md, run br ready, claim a task, implement it"
ntm send myproject --pane=1 "Read ARCHITECTURE.md, run br ready, claim a task, implement it"

# 6. Monitor
ntm status myproject              # Check worker status
br list                           # Check task status

# 7. Review when workers finish
git diff                          # See what workers produced
ubs scan .                        # Check for bugs
```

**Remember:**
- Ask user which agents and how many before spawning
- Use `--no-user` since you (admin) are in a separate session
- You orchestrate, workers implement

---

### Workflow 1: Parallel Exploration

Use when you're unsure of the best approach.

```bash
# 1. Spawn diverse agents
ntm spawn explore --cc=2 --gmi=1

# 2. Send the same problem to all agents with different framings
ntm send explore --cc "Explore approach A for implementing user auth using JWT"
ntm send explore --gmi "Research best practices for user auth in 2026, focusing on security"

# 3. Let them work, then check outputs
ntm copy explore --all

# 4. Review and pick the best approach
ntm dashboard explore
```

### Workflow 2: Divide and Conquer

Split a large task into parallel subtasks.

```bash
# 1. Create tasks
br create "Implement API endpoints" --type feature
br create "Write frontend components" --type feature
br create "Add database migrations" --type feature

# 2. Spawn agents
ntm spawn impl --cc=3

# 3. Assign each Claude to a subtask
ntm send impl --pane=1 "Work on API endpoints. Check br ready for context."
ntm send impl --pane=2 "Build frontend components. Check br ready for context."
ntm send impl --pane=3 "Create database migrations. Check br ready for context."

# 4. Monitor progress
ntm dashboard impl
```

### Workflow 3: Review Chain

One agent implements, another reviews.

```bash
# 1. Spawn implementation + review
ntm spawn review --cc=2

# 2. First Claude implements
ntm send review --pane=1 "Implement the login flow with proper error handling"

# 3. Wait for completion, then have second Claude review
ntm send review --pane=2 "Review the changes made by the other agent. Look for bugs, security issues, and improvements. The changes are in git diff."

# 4. First Claude addresses feedback
ntm send review --pane=1 "Address the review feedback"
```

### Workflow 4: Research → Implement

Gemini researches, Claude implements.

```bash
# 1. Spawn research team
ntm spawn research --gmi=1 --cc=1

# 2. Gemini does research
ntm send research --gmi "Research the best approach for implementing rate limiting in a Node.js API. Compare token bucket vs sliding window. Output a recommendation."

# 3. Copy Gemini's output
ntm copy research --gmi

# 4. Send to Claude with research context
ntm send research --cc "Implement rate limiting based on this research: [paste Gemini output]. Use the recommended approach."
```

---

## Session Management

### Naming Conventions

Use descriptive, project-based names:

```bash
ntm spawn auth-feature --cc=2      # Feature work
ntm spawn bugfix-login --cc=1      # Bug fixes
ntm spawn explore-caching --cc=2   # Exploration
ntm spawn refactor-api --cc=3      # Refactoring
```

### Listing Sessions

```bash
# See all active sessions
ntm list

# Detailed view
ntm list -v
```

### Attaching to Sessions

```bash
# Attach to specific pane
ntm attach myproject --pane=1

# Open dashboard
ntm dashboard myproject
```

### Cleanup

```bash
# Kill specific session
ntm kill myproject

# Kill all NTM sessions
ntm kill --all
```

---

## Communication Patterns

### Broadcasting

Send the same message to all agents of a type:

```bash
# All Claude instances
ntm send proj --cc "Update: the API schema changed. Check api/schema.ts"

# All agents
ntm send proj --all "Stop current work. We're changing direction."
```

### Targeted Messages

Send to specific agent instances:

```bash
# First Claude only
ntm send proj --pane=1 "Focus on the backend"

# Second Claude only
ntm send proj --pane=2 "Focus on the frontend"
```

### Context Injection

Before starting work, inject shared context:

```bash
# Get memory context and share
CONTEXT=$(cm context "implementing auth" --json)
ntm send proj --all "Context for this session: $CONTEXT"

# Or use br for task context
ntm send proj --all "Check br ready for current tasks. Claim one and work on it."
```

---

## Integration with Other Tools

### With CASS Memory (cm)

```bash
# Before starting work
cm context "your task description" --json

# This returns:
# - relevantBullets: Rules that might help
# - antiPatterns: Things to avoid
# - historySnippets: Past solutions
# - suggestedCassQueries: Deeper searches
```

### With Beads (br/bv)

```bash
# Initialize in project
cd your-project
flywheel init              # With flywheel script
# OR:
br init                    # Manual initialization

# Create tasks before spawning agents
br create "Implement user registration" --type feature --priority 1
br create "Add email verification" --type feature --priority 2
br create "Write tests for auth" --type task --priority 3

# Agents can query tasks
ntm send proj --cc "Run br ready to see available tasks. Claim one with br update."

# Visual task management
bv  # Opens TUI
```

### With MCP Agent Mail (Critical for Multi-Agent)

MCP Agent Mail is essential for worker coordination. It prevents file conflicts when multiple workers edit the same codebase.

**The admin agent should ensure it's running:**
```bash
flywheel doctor                   # Shows MCP Agent Mail status
flywheel fix                      # Fixes issues including starting the server
```

**Workers automatically use MCP Agent Mail for:**
- **File reservations** - Lock files before editing, prevent conflicts
- **Messaging** - Send updates to other workers
- **Handoffs** - Coordinate sequential work

**Key MCP tools workers use:**
```
file_reservation_paths     # Reserve files before editing
release_file_reservations  # Release when done
send_message              # Notify other agents
fetch_inbox               # Check for messages
```

**Worker coordination pattern:**
```
Worker 1: "I'm editing src/auth.ts" → reserves file
Worker 2: "I need auth.ts" → sees reservation, waits or works on something else
Worker 1: "Done with auth.ts" → releases file
Worker 2: "auth.ts available" → can now edit
```

This happens automatically through the MCP tools. Workers just need to use the reservation tools before editing shared files.

### With CASS (Session Search)

Search past sessions for solutions:

```bash
# Find how you solved something before
cass search "rate limiting implementation"

# Robot mode for agents
cass search "authentication error handling" --robot --fields minimal
```

---

## Safety Layer Integration

The flywheel includes multiple safety mechanisms that work automatically:

### DCG (Destructive Command Guard)

DCG intercepts dangerous commands before they execute:

```
Agent attempts: git reset --hard HEAD~5
DCG blocks:     ⛔ BLOCKED: git reset --hard destroys uncommitted work
                Suggested: git stash or git commit first
```

**Protected commands:**
- `rm -rf` on project/home directories
- `git reset --hard`, `git checkout .`
- `DROP TABLE`, `DELETE FROM` without WHERE
- `chmod 777`, `chown -R`

DCG is automatic once installed - no configuration needed.

### SLB (Simultaneous Launch Button)

For high-risk operations, require two-person approval:

```bash
# Wrap risky operation
slb wrap "terraform destroy" --reason "Cleaning up staging environment"

# Another person (or agent) must approve
slb approve <operation-id>
```

Use SLB for:
- Production deployments
- Database migrations
- Infrastructure changes
- Bulk file operations

### UBS (Ultimate Bug Scanner)

Scan code before committing:

```bash
# Scan current directory
ubs scan .

# Scan specific files
ubs scan src/auth/*.ts

# JSON output for agents
ubs scan . --json
```

**Workflow integration:**
```bash
# Have agent scan before PR
ntm send proj --cc "Run ubs scan on your changes before creating a PR"
```

---

## Real-World Scenarios

### Scenario 1: Starting a New Feature

```bash
# 1. Initialize project (if not already)
flywheel init                   # With flywheel script
# OR manually:
br init                         # Initialize task tracking
# Create AGENTS.md with project context

# 2. Get context from memory
cm context "user authentication with OAuth" --json

# 3. Create tasks
br create "Research OAuth providers" --type task
br create "Implement OAuth flow" --type feature
br create "Add user session handling" --type feature
br create "Write auth tests" --type task

# 4. Spawn research + implementation team
ntm spawn auth --cc=2 --gmi=1

# 5. Start with research
ntm send auth --gmi "Research OAuth 2.0 best practices for web apps in 2026. Compare Auth0, Clerk, and custom implementation."

# 6. Meanwhile, Claude explores the codebase
ntm send auth --pane=1 "Explore how authentication currently works in this codebase. Check for existing patterns."
ntm send auth --pane=2 "Check br ready and claim the OAuth research task."

# 7. Monitor and coordinate
ntm dashboard auth
```

### Scenario 2: Debugging a Production Issue

```bash
# 1. Search past sessions for similar issues
cass search "memory leak production" --limit 5

# 2. Spawn focused debugging team
ntm spawn debug --cc=2

# 3. Parallel investigation
ntm send debug --pane=1 "Investigate the memory leak. Start with heap snapshots and profiling."
ntm send debug --pane=2 "Review recent commits for potential causes. Check git log --since='1 week ago'"

# 4. Share findings
ntm copy debug --all
# Review outputs, then synthesize

ntm send debug --pane=1 "Based on both investigations, implement a fix for the identified issue."
```

### Scenario 3: Large Refactoring

```bash
# 1. Create detailed task breakdown
br create "Refactor: Extract service layer" --type refactor
br create "Refactor: Update API routes to use services" --type refactor
br create "Refactor: Migrate tests" --type refactor
br create "Refactor: Update documentation" --type refactor

# 2. Spawn refactoring team
ntm spawn refactor --cc=3

# 3. Assign domains
ntm send refactor --pane=1 "Claim and work on extracting the service layer. Use br update to claim."
ntm send refactor --pane=2 "Wait for service layer extraction, then update API routes."
ntm send refactor --pane=3 "After routes are updated, migrate and update tests."

# 4. Use MCP Agent Mail for file reservations to prevent conflicts
# Agents will auto-coordinate through the mail server
```

### Scenario 4: Documentation Sprint

```bash
# 1. Spawn doc team
ntm spawn docs --cc=1 --gmi=1

# 2. Gemini generates outline
ntm send docs --gmi "Generate a comprehensive documentation outline for this project. Include API docs, architecture, and getting started guide."

# 3. Claude implements
ntm send docs --cc "Based on the documentation outline, write the Getting Started guide. Make it practical with real examples."

# 4. Parallel work on different sections
# Use br to track which sections are done
```

---

## Tips & Best Practices

### Do's

1. **Start with context** - Always run `cm context` before complex tasks
2. **Use tasks** - Create `br` tasks before spawning agents
3. **Name sessions well** - Use descriptive names like `auth-feature` not `test1`
4. **Review outputs** - Use `ntm copy` to gather and compare agent work
5. **Kill idle sessions** - Don't leave agents running unnecessarily

### Don'ts

1. **Don't over-parallelize** - 2-3 agents is usually optimal
2. **Don't micromanage** - Let agents work; check results periodically
3. **Don't ignore conflicts** - Use MCP Agent Mail for file coordination
4. **Don't forget to commit** - Agents make changes; commit good work

### Performance Tips

```bash
# Check agent resource usage
ntm stats myproject

# If agents are slow, reduce parallelism
ntm spawn light --cc=1  # Instead of --cc=3

# For long-running tasks, use background mode
ntm send proj --cc "Work on this..." --detach
```

---

## Quick Reference Card

```
┌─────────────────────────────────────────────────────────────┐
│                    NTM QUICK REFERENCE                      │
├─────────────────────────────────────────────────────────────┤
│ SPAWN                                                       │
│   ntm spawn NAME --cc=N --cod=N --gmi=N                     │
│                                                             │
│ SEND                                                        │
│   ntm send NAME --cc "prompt"      # All Claude             │
│   ntm send NAME --pane=1 "prompt"    # First Claude           │
│   ntm send NAME --all "prompt"     # All agents             │
│                                                             │
│ MANAGE                                                      │
│   ntm list                         # List sessions          │
│   ntm dashboard NAME               # Open TUI               │
│   ntm copy NAME --all              # Copy outputs           │
│   ntm kill NAME                    # End session            │
│                                                             │
│ INTEGRATE                                                   │
│   cm context "task" --json         # Get memory context     │
│   br ready                         # See available tasks    │
│   cass search "query"              # Search past sessions   │
│   am                               # Start mail server      │
│                                                             │
│ SAFETY                                                      │
│   dcg                              # Auto-blocks risky cmds  │
│   ubs scan .                       # Scan for bugs          │
│   slb wrap "cmd"                   # Two-person approval    │
│   bv --robot-triage                # Task prioritization    │
└─────────────────────────────────────────────────────────────┘
```

**Full tool inventory:** https://agent-flywheel.com/tldr

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Agents not responding | Check `ntm dashboard` for errors |
| File conflicts | Ensure MCP Agent Mail is running: `am` |
| Lost context | Re-inject with `cm context` |
| Session died | Check `tmux list-sessions` directly |
| Too slow | Reduce agent count or check system resources |

---

## Next Steps

1. **Practice** - Start with simple 1-2 agent sessions
2. **Build muscle memory** - The commands become natural quickly
3. **Customize** - Adjust agent counts for your workload
4. **Share patterns** - Document what works for your team

---

---

## Management Commands

> **Note:** The `flywheel` script is optional but recommended. Agents should use the individual tools (`br`, `cm`, `cass`, `ntm`, etc.) directly.

### With Flywheel Script

```bash
flywheel doctor            # Health check - see what's installed
flywheel install           # Install all tools
flywheel init              # Initialize a new project
flywheel update            # Update all tools
flywheel missing           # See what's missing
flywheel uninstall         # Remove everything (tools + flywheel)
```

### Without Flywheel Script

```bash
# Check what's installed (all platforms)
which ntm br bv cass cm dcg ubs slb claude codex gemini

# Initialize a project manually
cd your-project
br init                    # Initialize task tracking
# Create AGENTS.md with project context (see template below)

# Update tools manually
# macOS:
brew update && brew upgrade dicklesworthstone/tap/bv dicklesworthstone/tap/cass
# All platforms:
go install github.com/Dicklesworthstone/slb/cmd/slb@latest
npm update -g @anthropic-ai/claude-code
# Re-run install scripts for curl-installed tools to update them
```

### AGENTS.md Template (for manual setup)

```markdown
# Project Name

## Overview
Brief description of the project.

## Tech Stack
- Language:
- Framework:

## Conventions
- Follow existing patterns
- Write tests for new features

## Notes for AI Agents
- Check `br ready` for available tasks
- Use `cm context "task"` for memory context
- Run `ubs scan .` before committing
```

---

*This workflow guide accompanies the Agentic Flywheel Setup. See README.md for installation instructions.*
