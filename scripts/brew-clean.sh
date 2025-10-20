#!/bin/zsh

brew-clean() {
  LOCK_DIR="$(brew --prefix)/var/homebrew/locks"
  REPO_DIR="$(brew --repo)"

  echo "Cleaning stale Homebrew locks..."
  rm -f "$LOCK_DIR"/* 2>/dev/null || true
  rm -f "$REPO_DIR/.git/index.lock" 2>/dev/null || true

  while pgrep -x brew >/dev/null; do
    echo "Waiting for other Homebrew processes to finish..."
    sleep 2
  done

  echo "Done! You can now run brew update or brew install safely."
}
