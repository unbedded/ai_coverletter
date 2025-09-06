#!/bin/bash
# Git workflow helpers for Claude Code projects

# Quick commit with conventional commit format
quick_commit() {
    local type="${1:-feat}"
    local message="${2:-update}"
    git add .
    git commit -m "${type}: ${message}"
    echo "✅ Committed: ${type}: ${message}"
}

# Create and push feature branch
new_feature() {
    local branch_name="${1:-feature/$(date +%Y%m%d-%H%M)}"
    git checkout -b "$branch_name"
    echo "🌟 Created branch: $branch_name"
}

# Sync with main and clean up
sync_main() {
    git checkout main
    git pull origin main
    git branch --merged | grep -v "main\|master" | xargs -n 1 git branch -d 2>/dev/null || true
    echo "🔄 Synced with main and cleaned up merged branches"
}

# Show helpful git status
project_status() {
    echo "📊 Project Status:"
    echo "   Current branch: $(git branch --show-current)"
    echo "   Uncommitted changes: $(git status --porcelain | wc -l | tr -d ' ')"
    echo "   Last commit: $(git log -1 --pretty=format:'%h - %s (%cr)')"
    echo "   Remotes: $(git remote -v | head -1 | awk '{print $2}' || echo 'none')"
}

# Export functions for use in other scripts
export -f quick_commit new_feature sync_main project_status
