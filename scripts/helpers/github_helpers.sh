#!/bin/bash
# GitHub CLI helpers for Claude Code projects

# Create PR with template
create_pr() {
    local title="${1:-Update from $(git branch --show-current)}"
    local body="${2:-Automated update from Claude Code project}"
    
    gh pr create --title "$title" --body "$body" --draft
    echo "📝 Created draft PR: $title"
}

# Quick PR workflow
quick_pr() {
    local message="${1:-feat: update project}"
    
    # Commit changes
    git add .
    git commit -m "$message"
    git push -u origin "$(git branch --show-current)"
    
    # Create PR
    gh pr create --title "$message" --body "Automated update from Claude Code workflow" --draft
    echo "🚀 Committed, pushed, and created draft PR"
}

# List and manage PRs
list_prs() {
    echo "📋 Open PRs:"
    gh pr list
}

# Merge current PR
merge_pr() {
    gh pr merge --merge --delete-branch
    git checkout main
    git pull
    echo "✅ PR merged and branch cleaned up"
}

export -f create_pr quick_pr list_prs merge_pr
