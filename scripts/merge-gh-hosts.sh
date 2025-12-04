#!/bin/bash

# Merge GitHub hosts.yml configuration
# Combines the public template with work-specific config

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
TEMPLATE_FILE="$DOTFILES_DIR/config/gh/hosts.yml.template"
WORK_CONFIG="$HOME/.work/gh-hosts.yml"
OUTPUT_FILE="$DOTFILES_DIR/config/gh/hosts.yml"

# Start with the template (public GitHub config)
if [ -f "$TEMPLATE_FILE" ]; then
    cp "$TEMPLATE_FILE" "$OUTPUT_FILE"
    echo "✓ Created hosts.yml from template"
else
    echo "⚠ Template file not found: $TEMPLATE_FILE"
    exit 1
fi

# Append work config if it exists
if [ -f "$WORK_CONFIG" ]; then
    echo "" >> "$OUTPUT_FILE"  # Add blank line for separation
    cat "$WORK_CONFIG" >> "$OUTPUT_FILE"
    echo "✓ Merged work-specific config"
else
    echo "ℹ No work config found at $WORK_CONFIG (skipping)"
fi

echo "✓ GitHub hosts configuration merged successfully"
