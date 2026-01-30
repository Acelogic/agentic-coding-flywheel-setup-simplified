# Agentic Coding Flywheel Setup - Simplified

![Version](https://img.shields.io/badge/Version-2.1.0-bd93f9?style=for-the-badge)
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
```

Then install all 33 tools:

```bash
source ~/.zshrc && flywheel install
```

The installer is **idempotent**—safe to re-run anytime.

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

## Usage

### Initialize a Project

```bash
cd ~/your-project
flywheel init
```

Creates:
- `.beads/` — Task tracking database
- `AGENTS.md` — Project context for AI agents
- `.claude/` — Claude-specific settings

### Spawn AI Agents

```bash
# Start coordination server
am

# Spawn 2 Claude agents
ntm spawn my-project --cc=2

# Send them work
ntm send my-project --cc "Check br ready for tasks and start working."

# Monitor
ntm dashboard my-project
```

### Daily Workflow

```bash
br ready                          # See available tasks
br create "Add auth" --type feature
bv                                # Open task TUI
cm context "implementing auth"    # Get memory context
ubs scan .                        # Scan for bugs before commit
```

---

## Commands

| Command | Description |
|---------|-------------|
| `flywheel doctor` | Health check — see what's installed |
| `flywheel install` | Install all 33 tools |
| `flywheel init` | Initialize project (br + AGENTS.md) |
| `flywheel update` | Update all tools |
| `flywheel missing` | Show manual install commands |
| `flywheel uninstall` | Remove everything (tools + flywheel) |

---

## Platform Support

| Platform | Package Manager | Status |
|----------|-----------------|--------|
| macOS (Intel & Apple Silicon) | Homebrew | ✓ |
| Ubuntu / Debian | apt | ✓ |
| Fedora / RHEL | dnf | ✓ |
| Arch Linux | pacman | ✓ |
| Windows (WSL) | apt | ✓ |

---

## Documentation

| File | Description |
|------|-------------|
| [`AGENTIC_FLYWHEEL_SETUP.md`](AGENTIC_FLYWHEEL_SETUP.md) | Complete installation guide (with/without flywheel) |
| [`NTM_WORKFLOW_GUIDE.md`](NTM_WORKFLOW_GUIDE.md) | Multi-agent workflow patterns & real-world scenarios |

---

## Comparison: flywheel vs ACFS

| Feature | ACFS | flywheel |
|---------|------|----------|
| Platform | Ubuntu VPS only | macOS, Linux, WSL |
| VPS required | Yes | No (runs locally) |
| Install method | curl \| bash | curl \| bash |
| Tools | 30+ | 33 |
| Idempotent | ✓ | ✓ |
| Doctor command | ✓ | ✓ |

---

## Links

- **Tool Inventory:** [agent-flywheel.com/tldr](https://agent-flywheel.com/tldr)
- **Original ACFS:** [github.com/Dicklesworthstone/agentic_coding_flywheel_setup](https://github.com/Dicklesworthstone/agentic_coding_flywheel_setup)
- **Author (ACFS):** [@Dicklesworthstone](https://github.com/Dicklesworthstone) (Jeffrey Emanuel)

---

## License

MIT
