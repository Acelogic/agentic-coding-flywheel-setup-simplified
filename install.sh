#!/usr/bin/env bash
#
# Flywheel Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/Acelogic/agentic-coding-flywheel/main/install.sh | bash
#

set -e

REPO="https://github.com/Acelogic/agentic-coding-flywheel"
INSTALL_DIR="$HOME/.local/share/flywheel"
BIN_DIR="$HOME/.local/bin"

echo "Installing Agentic Coding Flywheel..."

# Clone or update
if [[ -d "$INSTALL_DIR" ]]; then
    echo "Updating existing installation..."
    cd "$INSTALL_DIR" && git pull --quiet
else
    echo "Cloning repository..."
    git clone --quiet "$REPO" "$INSTALL_DIR"
fi

# Create bin directory and symlink
mkdir -p "$BIN_DIR"
ln -sf "$INSTALL_DIR/flywheel" "$BIN_DIR/flywheel"
chmod +x "$INSTALL_DIR/flywheel"

# Detect shell config
if [[ -n "$ZSH_VERSION" ]] || [[ "$SHELL" == */zsh ]]; then
    RC_FILE="$HOME/.zshrc"
else
    RC_FILE="$HOME/.bashrc"
fi

# Add to PATH if needed
if ! echo "$PATH" | grep -q "$BIN_DIR"; then
    echo "" >> "$RC_FILE"
    echo "# Flywheel" >> "$RC_FILE"
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$RC_FILE"
    echo "Added ~/.local/bin to PATH in $RC_FILE"
fi

echo ""
echo "✓ Flywheel installed to $INSTALL_DIR"
echo "✓ Symlinked to $BIN_DIR/flywheel"
echo ""
echo "Next steps:"
echo "  1. Reload your shell:  source $RC_FILE"
echo "  2. Install tools:      flywheel install"
echo "  3. Check status:       flywheel doctor"
echo ""
