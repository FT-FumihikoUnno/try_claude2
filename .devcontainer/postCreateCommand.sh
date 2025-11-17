#!/bin/bash
set -e

# claude install by npm
# https://code.claude.com/docs/en/setup#npm
echo "Installing Claude Code..."
if npm install -g @anthropic-ai/claude-code; then
    echo "✓ Claude Code installed successfully"
else
    echo "✗ Failed to install Claude Code. Please install manually with: npm install -g @anthropic-ai/claude-code"
    echo "Continuing with container setup..."
fi

echo "Verifying installation..."
claude --version || echo "⚠️  Claude installed but requires authentication. Run 'claude' to authenticate."

echo ""
echo "⚠️  Post-setup required:"
echo "  1. Run: gh auth login"
echo "  2. Run: claude"
