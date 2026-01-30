# Agentic Coding Flywheel

Cross-platform installer for [Dicklesworthstone's Agentic Coding Flywheel](https://agent-flywheel.com/) - **33 tools** for AI-powered multi-agent development.

> Run multiple AI agents (Claude, Codex, Gemini) in parallel with task tracking, persistent memory, and safety guardrails.

## Getting Started

### 1. Install Flywheel

```bash
git clone https://github.com/Acelogic/agentic-coding-flywheel ~/.local/share/flywheel && \
  mkdir -p ~/.local/bin && \
  ln -sf ~/.local/share/flywheel/flywheel ~/.local/bin/flywheel
```

> **Note:** If `~/.local/bin` isn't in your PATH, `flywheel install` will add it automatically.
>
> Clone elsewhere? Just update the symlink path: `ln -sf /your/path/flywheel ~/.local/bin/flywheel`

### 2. Install All Tools

```bash
# See what you already have
flywheel doctor

# Install everything (idempotent - safe to re-run)
flywheel install

# Reload your shell
source ~/.zshrc  # or ~/.bashrc
```

### 3. Start a New Project

```bash
cd ~/Developer/my-project

# Initialize project with task tracking + AGENTS.md
flywheel init

# This creates:
# - .beads/        Task tracking database
# - AGENTS.md      Project context for AI agents
# - .claude/       Claude-specific settings
```

### 4. Spawn AI Agents

```bash
# Start the coordination server (run once)
am

# Spawn 2 Claude agents for your project
ntm spawn my-project --cc=2

# Send them work
ntm send my-project --cc "Check br ready for tasks. Claim one and start working."

# Monitor progress
ntm dashboard my-project
```

### 5. Daily Workflow

```bash
# Check available tasks
br ready

# Create new tasks
br create "Add user authentication" --type feature
br create "Fix login bug" --type bug

# Open task UI
bv

# Get memory context before complex work
cm context "implementing auth" --json

# Scan for bugs before committing
ubs scan .
```

## Commands

| Command | Description |
|---------|-------------|
| `flywheel doctor` | Health check - see what's installed |
| `flywheel install` | Install all 33 tools |
| `flywheel init` | Initialize project (br + AGENTS.md) |
| `flywheel update` | Update all tools |
| `flywheel missing` | Show manual install commands |
| `flywheel uninstall` | Remove tools (`--all` for everything) |

## What's Included (33 Tools)

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

| Category | Tools | Purpose |
|----------|-------|---------|
| **Prerequisites** | tmux, fzf, git, jq, go, bun, uv, cargo | Build tools & runtimes |
| **Shell** | zoxide, atuin | Smart cd, history search |
| **AI Agents** | claude, codex, gemini | The AI coding assistants |
| **Orchestration** | ntm | Multi-agent session manager |
| **Tasks** | br, bv | Git-native issue tracking + UI |
| **Memory** | cass, cm | Session search + procedural memory |
| **Safety** | dcg, ubs, slb, pt | Block dangerous commands, scan bugs |
| **Productivity** | ms, s2p, ru, apr, caam, xf | Skills, prompts, repo sync |
| **Utilities** | csctf, tru, rano, giil, brenner | Converters, research tools |

## Supported Platforms

| Platform | Package Manager | Status |
|----------|-----------------|--------|
| macOS (Intel & Apple Silicon) | Homebrew | ✓ Full support |
| Ubuntu/Debian | apt | ✓ Full support |
| Fedora/RHEL | dnf | ✓ Full support |
| Arch Linux | pacman | ✓ Full support |
| Windows (WSL) | apt | ✓ Full support |

## Documentation

| File | Description |
|------|-------------|
| [`AGENTIC_FLYWHEEL_SETUP.md`](AGENTIC_FLYWHEEL_SETUP.md) | Complete installation guide with manual options |
| [`NTM_WORKFLOW_GUIDE.md`](NTM_WORKFLOW_GUIDE.md) | Multi-agent workflow patterns & real-world scenarios |

## Without Flywheel Script

Don't want to use the flywheel script? See [`AGENTIC_FLYWHEEL_SETUP.md`](AGENTIC_FLYWHEEL_SETUP.md) for manual installation commands for each platform.

## Links

- **Official Website:** https://agent-flywheel.com
- **Tool Inventory:** https://agent-flywheel.com/tldr
- **Original Author:** [@Dicklesworthstone](https://github.com/Dicklesworthstone) (Jeffrey Emanuel)
- **ACFS (Ubuntu):** https://github.com/Dicklesworthstone/agentic_coding_flywheel_setup

## License

MIT - Same as the original ACFS tools.
