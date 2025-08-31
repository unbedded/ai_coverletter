#!/bin/bash
# General Claude Code Project Setup Script
# For non-coding projects that may use minimal Python helper scripts

set -Eeuo pipefail

PROJECT_NAME=""
FORCE=0
SETUP_GITHUB=0

# Help function
show_help() {
    cat << EOF
Usage: $0 -p <project_name> [options]

Setup a Claude Code project with optional helpers and integrations.

Required:
  -p <name>     Project name (required)

Optional:
  -f            Force overwrite existing files  
  -g            Setup GitHub CLI integration
  -h            Show this help message

Examples:
  $0 -p job_automation           # Basic setup
  $0 -p job_automation -g        # Setup with GitHub CLI helpers
  $0 -p job_automation -f -g     # Force overwrite + GitHub helpers

What gets created:
  - .claude/ directory structure for Claude Code
  - Git repository with workflow helpers
  - Python virtual environment for utility scripts
  - Helper scripts for git, GitHub, and development workflow
  - README and documentation templates

EOF
}

while getopts ":p:fgh" opt; do
  case "$opt" in
    p) PROJECT_NAME="$OPTARG" ;;
    f) FORCE=1 ;;
    g) SETUP_GITHUB=1 ;;
    h) show_help; exit 0 ;;
    \?) echo "Invalid option: -$OPTARG" >&2; echo "Use -h for help."; exit 2 ;;
    :)  echo "Option -$OPTARG requires an argument." >&2; echo "Use -h for help."; exit 2 ;;
  esac
done

if [[ -z "$PROJECT_NAME" ]]; then
  echo "ERROR: Project name required."
  echo "Usage: ./setup_claude_project.sh -p <project_name> [-f] [-g]"
  echo "  -p <name>  Project name (required)"
  echo "  -f         Force overwrite existing files"
  echo "  -g         Setup GitHub CLI integration" 
  exit 2
fi

echo "🚀 Setting up Claude Code project: $PROJECT_NAME"

# Create basic Claude Code directory structure
mkdir -p {.claude/{commands,prompts,templates},scripts,data,output}

echo "📁 Basic Claude Code structure created!"

# --- Optional Python Virtual Environment (for helper scripts) ---
if [[ -n "${VIRTUAL_ENV:-}" ]]; then
  echo "==> Using active venv: $VIRTUAL_ENV"
elif [[ -d ".venv" ]]; then
  echo "==> Activating existing .venv"
  source .venv/bin/activate
else
  echo "==> Creating .venv for optional Python helper scripts"
  if python3 -m venv .venv 2>/dev/null; then
    :
  else
    echo "python3-venv not available; falling back to virtualenv"
    python3 -m pip install --user virtualenv
    python3 -m virtualenv .venv
  fi
  source .venv/bin/activate
fi

# Install minimal Python packages for utility scripts
echo "==> Installing basic Python packages for helper scripts"
python -m pip install -U pip
pip install pyyaml requests click rich  # Basic packages for file processing + rich for nice CLI output

# --- Git Setup and Best Practices ---
echo "==> Setting up Git and GitHub integration"

# Initialize git if not already a repo
if [[ ! -d ".git" ]]; then
  git init
  echo "📦 Initialized git repository"
fi

# Create comprehensive .gitignore
cat > .gitignore << 'EOF'
# Python virtual environment
.venv/
__pycache__/
*.pyc
.mypy_cache/
.pytest_cache/

# Data files (uncomment if you want to track them)
# data/
# output/

# Personal/sensitive information
config/personal/
*.env
.env*

# System files
.DS_Store
*.swp
*.swo
*~
*.log

# Temporary files
tmp/
temp/

# IDE files
.vscode/settings.json
.idea/
*.sublime-workspace
*.sublime-project

# OS generated files
Thumbs.db
EOF

# Create helper scripts for git workflow
mkdir -p scripts/helpers

# Git workflow helper
cat > scripts/helpers/git_helpers.sh << 'EOF'
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
EOF

# GitHub CLI helper (conditional based on -g flag and availability)
if [[ $SETUP_GITHUB -eq 1 ]]; then
    if command -v gh >/dev/null 2>&1; then
        cat > scripts/helpers/github_helpers.sh << 'EOF'
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
EOF
        echo "🐙 GitHub CLI helpers created"
    else
        cat > scripts/helpers/github_helpers.sh << 'EOF'
#!/bin/bash
# GitHub helpers (GitHub CLI not installed)

echo "💡 Install GitHub CLI for enhanced GitHub integration:"
echo "   brew install gh  # macOS"
echo "   sudo apt install gh  # Ubuntu" 
echo "   # Then rerun with -g flag after: gh auth login"

# Basic git remote helpers
setup_github() {
    local repo_name="${1:-$PROJECT_NAME}"
    echo "🔗 To set up GitHub remote:"
    echo "   1. Create repo at: https://github.com/new"
    echo "   2. Run: git remote add origin https://github.com/yourusername/$repo_name.git"
    echo "   3. Run: git push -u origin main"
}

export -f setup_github
EOF
        echo "⚠️  GitHub CLI not found - created basic helpers instead"
        echo "   Install 'gh' CLI and rerun with -g for full GitHub integration"
    fi
else
    echo "⏭️  Skipping GitHub CLI setup (use -g flag to enable)"
fi

# Make helper scripts executable
chmod +x scripts/helpers/*.sh

# Create development workflow helpers
cat > scripts/helpers/dev_helpers.sh << 'EOF'
#!/bin/bash
# Development workflow helpers

# Clean up generated files
clean_output() {
    echo "🧹 Cleaning output directories..."
    rm -rf output/* data/temp/* 
    echo "✅ Output directories cleaned"
}

# Backup important files
backup_sources() {
    local backup_dir="backups/$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$backup_dir"
    cp -r source_materials/ "$backup_dir/"
    cp -r .claude/ "$backup_dir/"
    echo "💾 Backed up to: $backup_dir"
}

# Quick project setup check
check_setup() {
    echo "🔍 Setup Check:"
    echo "   Git repo: $([[ -d .git ]] && echo '✅' || echo '❌')"
    echo "   Virtual env: $([[ -n "${VIRTUAL_ENV:-}" ]] && echo '✅' || echo '❌')"
    echo "   Claude config: $([[ -d .claude ]] && echo '✅' || echo '❌')"
    echo "   GitHub CLI: $(command -v gh >/dev/null && echo '✅' || echo '❌')"
}

export -f clean_output backup_sources check_setup
EOF

chmod +x scripts/helpers/dev_helpers.sh

# Create main README
cat > README.md << EOF
# $PROJECT_NAME

Claude Code project for [describe your project purpose].

## Setup
\`\`\`bash
./setup_claude_project.sh -p $PROJECT_NAME
source .venv/bin/activate  # For Python helper scripts
claude init  # Initialize Claude Code
\`\`\`

## Project Structure
- \`.claude/\` - Claude Code configuration
  - \`commands/\` - Custom Claude Code commands
  - \`prompts/\` - Reusable prompts
  - \`templates/\` - Document templates
- \`scripts/\` - Python helper utilities
  - \`helpers/\` - Git, GitHub, and development workflow helpers
- \`data/\` - Input data files
- \`output/\` - Generated output files

## Helper Scripts
Load helpers into your shell:
\`\`\`bash
source scripts/helpers/git_helpers.sh
source scripts/helpers/github_helpers.sh  
source scripts/helpers/dev_helpers.sh
\`\`\`

### Git Workflow Helpers
- \`quick_commit "feat" "added new feature"\` - Conventional commit
- \`new_feature "feature/my-branch"\` - Create feature branch
- \`sync_main\` - Update main branch and cleanup
- \`project_status\` - Show git status summary

### GitHub Helpers (requires \`gh\` CLI)
- \`quick_pr "feat: new feature"\` - Commit, push, create draft PR
- \`create_pr "title" "description"\` - Create PR with custom details
- \`list_prs\` - Show open PRs
- \`merge_pr\` - Merge current PR and cleanup

### Development Helpers
- \`check_setup\` - Verify project setup
- \`clean_output\` - Clean generated files
- \`backup_sources\` - Backup important files

## Usage
[Add your specific workflow instructions here]

## Claude Code Commands
[List your custom commands here]
EOF

# Create example templates (respecting FORCE flag)
create_if_not_exists() {
    local file="$1"
    
    if [[ ! -f "$file" || $FORCE -eq 1 ]]; then
        echo "📝 Created: $file"
        return 0
    else
        echo "⏭️  Skipped existing: $file (use -f to overwrite)"
        return 1
    fi
}

# Create example command
if create_if_not_exists ".claude/commands/example_command.md"; then
cat > .claude/commands/example_command.md << 'EOF'
# Example Command

Brief description of what this command does.

## Usage
```
example_command <input> [options]
```

## Process
1. Step 1 description
2. Step 2 description
3. Step 3 description

## Input
- Description of expected input

## Output
- Description of generated output
EOF
fi

# Create example prompt
if create_if_not_exists ".claude/prompts/example_prompt.md"; then
cat > .claude/prompts/example_prompt.md << 'EOF'
# Example Prompt Template

You are helping with [specific task].

## Input
[Description of input format]

## Task
[Clear description of what needs to be done]

## Instructions
1. [Specific instruction 1]
2. [Specific instruction 2]
3. [Specific instruction 3]

## Output Format
[Description of expected output format]
EOF
fi

# Create example template
if create_if_not_exists ".claude/templates/example_template.md"; then
cat > .claude/templates/example_template.md << 'EOF'
# Example Template

Replace this with your actual template content.

## Section 1
{PLACEHOLDER_1}

## Section 2
{PLACEHOLDER_2}

---
*Generated on: {DATE}*
EOF
fi

# Create placeholder directories with README files
cat > scripts/README.md << 'EOF'
# Helper Scripts

Python utility scripts for data processing and automation.

## Usage
Make sure virtual environment is activated:
```bash
source .venv/bin/activate
python scripts/your_script.py
```
EOF

cat > data/README.md << 'EOF'
# Data Directory

Input data files for processing.

## Organization
- Use clear, descriptive filenames
- Include dates in filenames when relevant
- Consider subdirectories for different data types
EOF

cat > output/README.md << 'EOF'
# Output Directory

Generated output files from Claude Code commands.

## Organization
- Organized by command/task type
- Timestamped for tracking
- Ready for use in downstream processes
EOF

echo "✅ Claude Code project setup complete!"
echo ""
echo "🎯 Next steps:"
echo "   1. source .venv/bin/activate  # For Python scripts"
echo "   2. claude init  # Initialize Claude Code in this directory"
echo "   3. Customize .claude/ configuration for your specific use case"
echo "   4. Add your custom commands to .claude/commands/"
echo "   5. Test with: claude <your_command>"
echo ""
echo "📚 Project ready for Claude Code development!"
echo "   - Basic directory structure: ✅"
echo "   - Python environment for helpers: ✅" 
echo "   - Git tracking configured: ✅"
echo "   - Example templates created: ✅"