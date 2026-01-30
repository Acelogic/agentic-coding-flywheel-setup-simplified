# Agentic Coding Flywheel Setup - Simplified

![Version](https://img.shields.io/badge/Version-2.2.0-bd93f9?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-macOS%20|%20Linux%20|%20WSL-6272a4?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-50fa7b?style=for-the-badge)
![Shell](https://img.shields.io/badge/Shell-Bash-ff79c6?style=for-the-badge)

<p align="center">
  <strong><a href="https://agent-flywheel.com">agent-flywheel.com</a></strong> — Official ACFS website & tool inventory
</p>

> **Simplified cross-platform installer for [Dicklesworthstone's Agentic Coding Flywheel](https://github.com/Dicklesworthstone/agentic_coding_flywheel_setup).**
>
> The original ACFS requires an Ubuntu VPS. This version runs locally on **macOS, Linux, and WSL** with a single command.

---

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/Acelogic/agentic-coding-flywheel-setup-simplified/main/install.sh | bash
source ~/.zshrc
flywheel install
```

That's it. The installer is **idempotent**—safe to re-run anytime.

---

## Getting Started

### 1. Check Your Setup

```bash
flywheel doctor
```

Shows installed tools, PATH config, shell integrations, auth status, and more.

### 2. Fix Any Issues

```bash
flywheel fix
```

Auto-adds missing PATH entries and shell integrations to your rc file.

### 3. Create a New Project

```bash
flywheel new my-project
cd my-project
```

Or initialize an existing project:

```bash
cd existing-project
flywheel init
```

### 4. Spawn AI Agents

```bash
flywheel spawn my-project      # Spawns 2 Claude agents
# or with more agents:
flywheel spawn my-project 3    # Spawns 3 Claude agents
```

### 5. Start Working

```bash
br create "Build user auth" --type feature
ntm send my-project --cc "Check br ready and start working on the auth task"
ntm dashboard my-project       # Monitor progress
```

---

## TL;DR

**What this gives you:**

- **3 AI Agents** — Claude Code, Codex CLI, Gemini CLI ready to code for you
- **Multi-Agent Orchestration** — NTM spawns and coordinates parallel agent sessions
- **Git-Native Task Tracking** — Beads (br/bv) with PageRank prioritization
- **Persistent Memory** — CASS session search + 3-layer procedural memory (cm)
- **Safety Guardrails** — DCG blocks dangerous commands, UBS scans for bugs
- **Cross-Platform** — Works on macOS, Ubuntu, Debian, Fedora, Arch, WSL

**Why this exists:**

The original [ACFS](https://github.com/Dicklesworthstone/agentic_coding_flywheel_setup) is Ubuntu VPS-only. This installer brings the same 33-tool stack to **your local machine** on any platform.

---

## The Stack

```
┌─────────────────────────────────────────────────────────────────┐
│                   AGENTIC CODING FLYWHEEL                       │
├─────────────────────────────────────────────────────────────────┤
│   ┌─────────┐    ┌─────────┐    ┌─────────┐                    │
│   │ Claude  │    │  Codex  │    │ Gemini  │  ← AI Agents       │
│   └────┬────┘    └────┬────┘    └────┬────┘                    │
│        └──────────────┼──────────────┘                          │
│                       ▼                                         │
│              ┌────────────────┐                                 │
│              │      NTM       │  ← Orchestration                │
│              └────────┬───────┘                                 │
│   ┌───────────────────┼───────────────────┐                    │
│   ▼                   ▼                   ▼                    │
│ ┌─────┐          ┌─────────┐         ┌──────┐                  │
│ │ br  │          │  Mail   │         │ CASS │  ← Data Layer    │
│ │ bv  │          │  DCG    │         │  cm  │                  │
│ └─────┘          └─────────┘         └──────┘                  │
└─────────────────────────────────────────────────────────────────┘
```

### What's Included (33 Tools)

| Category | Tools | Purpose |
|----------|-------|---------|
| **Prerequisites** | tmux, fzf, git, jq, go, bun, uv, cargo | Build tools & runtimes |
| **Shell** | zoxide, atuin | Smart cd, history search |
| **AI Agents** | claude, codex, gemini | The AI coding assistants |
| **Orchestration** | ntm | Multi-agent session manager |
| **Tasks** | br, bv | Git-native issue tracking + TUI |
| **Memory** | cass, cm | Session search (<1ms) + procedural memory |
| **Safety** | dcg, ubs, slb, pt | Block dangerous commands, scan bugs, 2-person approval |
| **Productivity** | ms, s2p, ru, apr, caam, xf | Skills, prompts, repo sync |
| **Utilities** | csctf, tru, rano, giil, brenner | Converters, research tools |

---

## Commands

### Setup

| Command | Description |
|---------|-------------|
| `flywheel install` | Install all 33 tools |
| `flywheel doctor` | Health check (tools, PATH, auth, versions, sessions) |
| `flywheel fix` | Auto-fix PATH and shell integration issues |
| `flywheel update` | Update all installed tools |
| `flywheel upgrade` | Update flywheel itself (git pull) |
| `flywheel uninstall` | Remove everything |

### Projects

| Command | Description |
|---------|-------------|
| `flywheel new NAME` | Create new project directory + git init + flywheel init |
| `flywheel init` | Initialize current directory (br + AGENTS.md + .claude/) |
| `flywheel spawn NAME [N]` | Spawn N Claude agents (default: 2) |

### Info

| Command | Description |
|---------|-------------|
| `flywheel doctor` | Full health check with versions, auth, sessions |
| `flywheel sessions` | List active tmux sessions with management commands |
| `flywheel auth` | Check authentication status for all AI agents |
| `flywheel logs` | View recent CASS sessions and Claude logs |
| `flywheel env` | Environment dump (system, versions, RAM, paths) |
| `flywheel missing` | Show manual install commands for missing tools |

### Maintenance

| Command | Description |
|---------|-------------|
| `flywheel clean` | Kill stale sessions, clean package caches |
| `flywheel version` | Show flywheel version |

---

## Doctor Output

`flywheel doctor` gives you a complete health check:

```
✓ 33/33 tools installed
✓ PATH configured (local/bin, go/bin, cargo/bin)
✓ Shell integrations (ntm, zoxide, atuin)
✓ Tool versions (claude 2.1.20, br 0.1.12, etc.)
✓ Auth status (claude, codex, gemini)
✓ Active sessions
✓ Project status (.beads/, AGENTS.md)
○ Tool freshness (flags tools >30 days old)
```

---

## Daily Workflow

```bash
# Morning: Check what's running
flywheel sessions
flywheel doctor

# Start work
cd my-project
br ready                          # See available tasks
flywheel spawn my-project         # Start agents

# Create tasks
br create "Add user auth" --type feature
br create "Fix login bug" --type bug

# Monitor agents
ntm dashboard my-project

# Before committing
ubs scan .                        # Scan for bugs
cm context "what I worked on"     # Update memory

# End of day
flywheel clean                    # Kill stale sessions
```

---

## Platform Support

| Platform | Package Manager | Status |
|----------|-----------------|--------|
| macOS (Intel & Apple Silicon) | Homebrew | ✓ Full support |
| Ubuntu / Debian | apt | ✓ Full support |
| Fedora / RHEL | dnf | ✓ Full support |
| Arch Linux | pacman | ✓ Full support |
| Windows (WSL) | apt | ✓ Full support |

---

## Comparison: flywheel vs ACFS

| Feature | ACFS | flywheel |
|---------|------|----------|
| Platform | Ubuntu VPS only | macOS, Linux, WSL |
| VPS required | Yes | No (runs locally) |
| Install method | curl \| bash | curl \| bash |
| Tools | 30+ | 33 |
| Doctor command | ✓ | ✓ Enhanced (versions, auth, sessions) |
| Auto-fix command | ✗ | ✓ `flywheel fix` |
| Project scaffolding | ✗ | ✓ `flywheel new` |
| Session management | ✗ | ✓ `flywheel sessions/clean` |
| Self-update | ✗ | ✓ `flywheel upgrade` |

---

## Documentation

| File | Description |
|------|-------------|
| [`AGENTIC_FLYWHEEL_SETUP.md`](AGENTIC_FLYWHEEL_SETUP.md) | Complete installation guide (with/without flywheel) |
| [`NTM_WORKFLOW_GUIDE.md`](NTM_WORKFLOW_GUIDE.md) | Multi-agent workflow patterns & real-world scenarios |

---

## Links

- **Tool Inventory:** [agent-flywheel.com/tldr](https://agent-flywheel.com/tldr)
- **Original ACFS:** [github.com/Dicklesworthstone/agentic_coding_flywheel_setup](https://github.com/Dicklesworthstone/agentic_coding_flywheel_setup)
- **Author (ACFS):** [@Dicklesworthstone](https://github.com/Dicklesworthstone) (Jeffrey Emanuel)

---

## License

MIT
