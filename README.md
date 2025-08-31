# coverletter

Claude Code project for [describe your project purpose].

## Setup
```bash
./setup_claude_project.sh -p coverletter
source .venv/bin/activate  # For Python helper scripts
claude init  # Initialize Claude Code
```

## Project Structure
- `.claude/` - Claude Code configuration
  - `commands/` - Custom Claude Code commands
  - `prompts/` - Reusable prompts
  - `templates/` - Document templates
- `scripts/` - Python helper utilities
  - `helpers/` - Git, GitHub, and development workflow helpers
- `data/` - Input data files
- `output/` - Generated output files

## Helper Scripts
Load helpers into your shell:
```bash
source scripts/helpers/git_helpers.sh
source scripts/helpers/github_helpers.sh  
source scripts/helpers/dev_helpers.sh
```

### Git Workflow Helpers
- `quick_commit "feat" "added new feature"` - Conventional commit
- `new_feature "feature/my-branch"` - Create feature branch
- `sync_main` - Update main branch and cleanup
- `project_status` - Show git status summary

### GitHub Helpers (requires `gh` CLI)
- `quick_pr "feat: new feature"` - Commit, push, create draft PR
- `create_pr "title" "description"` - Create PR with custom details
- `list_prs` - Show open PRs
- `merge_pr` - Merge current PR and cleanup

### Development Helpers
- `check_setup` - Verify project setup
- `clean_output` - Clean generated files
- `backup_sources` - Backup important files

## Usage
[Add your specific workflow instructions here]

## Claude Code Commands
[List your custom commands here]
