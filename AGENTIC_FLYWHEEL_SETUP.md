# Agentic Coding Flywheel - Complete Installation Guide

Cross-platform installer for [Dicklesworthstone's Agentic Coding Flywheel](https://agent-flywheel.com/) - 33 tools for AI-powered development with multi-agent orchestration, persistent memory, and task management.

**Official Website:** https://agent-flywheel.com/

**Tool Inventory:** https://agent-flywheel.com/tldr

**Author:** Jeffrey Emanuel ([@Dicklesworthstone](https://github.com/Dicklesworthstone))

---

## Quick Start

### With Flywheel Script (Recommended)

```bash
# Clone and add to PATH (one-liner)
git clone https://github.com/Acelogic/agentic-coding-flywheel ~/.local/share/flywheel && \
  mkdir -p ~/.local/bin && \
  ln -sf ~/.local/share/flywheel/flywheel ~/.local/bin/flywheel

# Check your setup
flywheel doctor

# Install everything
flywheel install

# Initialize a project
cd your-project && flywheel init
```

> **Note:** If `~/.local/bin` isn't in your PATH, `flywheel install` will add it automatically.

### Without Flywheel Script

#### macOS
```bash
# Prerequisites
brew install tmux fzf git jq go zoxide atuin
curl -fsSL https://bun.sh/install | bash
curl -LsSf https://astral.sh/uv/install.sh | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# AI agents
npm install -g @anthropic-ai/claude-code @openai/codex @google/gemini-cli

# Core stack
curl -fsSL https://raw.githubusercontent.com/Dicklesworthstone/ntm/main/install.sh | bash -s -- --easy-mode
curl -fsSL https://raw.githubusercontent.com/Dicklesworthstone/beads_rust/main/install.sh | bash
brew install dicklesworthstone/tap/bv dicklesworthstone/tap/cass
curl -fsSL https://raw.githubusercontent.com/Dicklesworthstone/cass_memory_system/main/install.sh | bash
```

#### Ubuntu/Debian Linux
```bash
# Prerequisites
sudo apt update && sudo apt install -y tmux fzf git jq golang-go
curl -fsSL https://bun.sh/install | bash
curl -LsSf https://astral.sh/uv/install.sh | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -fsSL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
curl -fsSL https://setup.atuin.sh | bash

# AI agents
npm install -g @anthropic-ai/claude-code @openai/codex @google/gemini-cli

# Core stack (all use cross-platform install scripts)
curl -fsSL https://raw.githubusercontent.com/Dicklesworthstone/ntm/main/install.sh | bash -s -- --easy-mode
curl -fsSL https://raw.githubusercontent.com/Dicklesworthstone/beads_rust/main/install.sh | bash
curl -fsSL https://raw.githubusercontent.com/Dicklesworthstone/beads_viewer/main/install.sh | bash
curl -fsSL https://raw.githubusercontent.com/Dicklesworthstone/coding_agent_session_search/main/install.sh | bash -s -- --easy-mode
curl -fsSL https://raw.githubusercontent.com/Dicklesworthstone/cass_memory_system/main/install.sh | bash
```

#### Initialize Project (all platforms)
```bash
cd your-project
br init
# Create AGENTS.md with project info (see template in NTM_WORKFLOW_GUIDE.md)
```

**Supported Platforms:**
- **macOS** (Intel & Apple Silicon) - via Homebrew
- **Ubuntu/Debian** - via apt
- **Fedora/RHEL** - via dnf
- **Arch Linux** - via pacman
- **Windows (WSL)** - via apt (Ubuntu WSL recommended)

---

## What Gets Installed (33 Tools)

```
┌─────────────────────────────────────────────────────────────────────┐
│                     AGENTIC CODING FLYWHEEL                        │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│   ┌─────────┐    ┌─────────┐    ┌─────────┐                        │
│   │ Claude  │    │  Codex  │    │ Gemini  │  ← AI Agents           │
│   └────┬────┘    └────┬────┘    └────┬────┘                        │
│        └──────────────┼──────────────┘                              │
│                       ▼                                             │
│              ┌────────────────┐                                     │
│              │      NTM       │  ← Orchestration                    │
│              └────────┬───────┘                                     │
│                       │                                             │
│   ┌───────────────────┼───────────────────┐                        │
│   ▼                   ▼                   ▼                        │
│ ┌─────┐          ┌─────────┐         ┌──────┐                      │
│ │ br  │          │  Mail   │         │ CASS │  ← Data Layer        │
│ │ bv  │          │  DCG    │         │  cm  │                      │
│ └─────┘          │  UBS    │         └──────┘                      │
│                  │  SLB    │                                        │
│                  └─────────┘                                        │
└─────────────────────────────────────────────────────────────────────┘
```

### Prerequisites (8)
| Tool | Purpose |
|------|---------|
| tmux | Terminal multiplexer |
| fzf | Fuzzy finder |
| git | Version control |
| jq | JSON processor |
| go | Go language |
| bun | JavaScript runtime |
| uv | Python package manager |
| cargo | Rust toolchain |

### Shell Enhancements (2)
| Tool | Purpose |
|------|---------|
| zoxide | Smart cd replacement |
| atuin | Shell history search |

### AI Agents (3)
| Tool | Purpose |
|------|---------|
| claude | Claude Code CLI |
| codex | OpenAI Codex CLI |
| gemini | Google Gemini CLI |

### Core Stack (5)
| Tool | Purpose | Command |
|------|---------|---------|
| **ntm** | Multi-agent orchestration | `ntm spawn proj --cc=2` |
| **br** | Git-native issue tracking | `br create "task"` |
| **bv** | Task UI with PageRank | `bv` |
| **cass** | Session search (<1ms) | `cass search "query"` |
| **cm** | 3-layer procedural memory | `cm context "task"` |

### Safety Tools (4)
| Tool | Purpose | Command |
|------|---------|---------|
| **dcg** | Block dangerous commands | Auto-active |
| **ubs** | Bug scanner (1000+ patterns) | `ubs scan .` |
| **slb** | Two-person approval | `slb wrap "cmd"` |
| **pt** | Process triage | `pt` |

### Productivity (6)
| Tool | Purpose |
|------|---------|
| **ms** | Skill manager (Thompson sampling) |
| **s2p** | Source-to-prompt TUI |
| **ru** | Multi-repo sync |
| **apr** | Automated plan reviser |
| **caam** | Account manager (auth switching) |
| **xf** | X/Twitter archive search |

### Utilities (5)
| Tool | Purpose | Platform |
|------|---------|----------|
| **csctf** | Chat conversation to file | All |
| **tru** | Toon renderer | All |
| **rano** | Annotation tool | All |
| **giil** | iCloud image downloader | macOS only |
| **brenner** | Research orchestration | All |

---

## Installation

### One-Line Install (if flywheel not yet installed)

```bash
git clone https://github.com/Acelogic/agentic-coding-flywheel ~/.local/share/flywheel && \
  mkdir -p ~/.local/bin && \
  ln -sf ~/.local/share/flywheel/flywheel ~/.local/bin/flywheel && \
  flywheel install
```

### Manual Component Installation

If you prefer installing components individually:

#### Prerequisites
```bash
# macOS
brew install tmux fzf git jq go

# Ubuntu/Debian
sudo apt install -y tmux fzf git jq golang-go

# All platforms (cross-platform installers)
curl -fsSL https://bun.sh/install | bash
curl -LsSf https://astral.sh/uv/install.sh | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

#### Shell Enhancements
```bash
# macOS
brew install zoxide atuin

# Linux
curl -fsSL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
curl -fsSL https://setup.atuin.sh | bash
```

#### AI Agents (all platforms)
```bash
npm install -g @anthropic-ai/claude-code @openai/codex @google/gemini-cli
```

#### Core Stack (all platforms - cross-platform install scripts)
```bash
curl -fsSL https://raw.githubusercontent.com/Dicklesworthstone/ntm/main/install.sh | bash -s -- --easy-mode
curl -fsSL https://raw.githubusercontent.com/Dicklesworthstone/beads_rust/main/install.sh | bash
curl -fsSL https://raw.githubusercontent.com/Dicklesworthstone/beads_viewer/main/install.sh | bash
curl -fsSL https://raw.githubusercontent.com/Dicklesworthstone/coding_agent_session_search/main/install.sh | bash -s -- --easy-mode
curl -fsSL https://raw.githubusercontent.com/Dicklesworthstone/cass_memory_system/main/install.sh | bash
```

#### Safety Tools (all platforms)
```bash
curl -fsSL https://raw.githubusercontent.com/Dicklesworthstone/destructive_command_guard/main/install.sh | bash -s -- --easy-mode
curl -fsSL https://raw.githubusercontent.com/Dicklesworthstone/ultimate_bug_scanner/master/install.sh | bash
go install github.com/Dicklesworthstone/slb/cmd/slb@latest
```

---

## Verification

```bash
flywheel doctor
```

Expected output:
```
╔══════════════════════════════════════════════════════════════╗
║     AGENTIC CODING FLYWHEEL v2.1.0                          ║
╚══════════════════════════════════════════════════════════════╝

  Platform: macos (arm64) | Package Manager: brew

Prerequisites:
  ✓ tmux, fzf, git, jq, go, bun, uv, cargo

Core Stack:
  ✓ ntm, br, bv, cass, cm

Safety Tools:
  ✓ dcg, ubs, slb, pt

...

Summary: 33/33 tools installed
```

---

## Quick Reference

```bash
# Project setup
cd your-project
flywheel init                   # With flywheel: Initialize project
# OR manually:
br init                         # Initialize task tracking
# Then create AGENTS.md with project context

# Start a session
am                              # Start MCP Agent Mail server
ntm spawn myproject --cc=2      # Spawn 2 Claude agents
cm context "task" --json        # Get memory context
ntm send myproject --cc "..."   # Send to agents

# Task management
br create "Task" --type feature # Create task
bv                              # Open task UI
br ready                        # Show unblocked work

# Safety
dcg explain "rm -rf /"          # See why command blocked
ubs scan .                      # Scan for bugs
slb wrap "dangerous cmd"        # Require approval

# Search & memory
cass search "query"             # Search sessions
cm context "task" --json        # Get relevant rules
```

---

## System Requirements

| Setup | RAM | Agents |
|-------|-----|--------|
| Minimal | 8GB | 1-2 |
| Standard | 16-32GB | 3-5 |
| Full | 64GB+ | 10+ |

**Rule of thumb:** ~2GB RAM per agent

---

## Comparison: flywheel vs ACFS

| Feature | ACFS | flywheel |
|---------|------|----------|
| Platform | Ubuntu only | macOS/Linux/WSL |
| VPS required | Yes | No |
| Tools | 35 | 33 |
| Doctor command | ✓ | ✓ |
| Update command | ✓ | ✓ |
| Idempotent | ✓ | ✓ |

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| `command not found` | Run `source ~/.zshrc` or restart terminal |
| Tool not installing | Check `flywheel missing` for manual command |
| MCP not running | Start with `am` command |
| DCG blocking valid command | Use `dcg explain "cmd"` to understand why |

---

## Resources

| Resource | URL |
|----------|-----|
| Official Website | https://agent-flywheel.com |
| Tool Inventory | https://agent-flywheel.com/tldr |
| ACFS GitHub | https://github.com/Dicklesworthstone/agentic_coding_flywheel_setup |
| All Repos | https://github.com/Dicklesworthstone |

---

*Last updated: January 2026*
