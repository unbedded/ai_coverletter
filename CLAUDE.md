# Claude Code Project Configuration

## Git Preferences
- Use `git switch` instead of `git checkout` for branch operations
- Use `gh pr create` for pull requests (no need for create_pr.md command)
- **Branching Model**: Git Flow
  - `main` - Production releases
  - `develop` - Integration branch  
  - `feature/*` - Branch from develop, merge back to develop
  - Create feature branches: `git switch develop && git switch -c feature/branch-name`

## Git Flow Process (CRITICAL)
**NEVER merge feature → main directly!** Always follow this flow:

1. **Feature Development**: `feature/xyz` → `develop` (via PR)
2. **Release Preparation**: `develop` → `main` (when ready for release)
3. **Keep develop synced**: After any `develop` → `main` merge, ensure develop stays current

**Before creating ANY new feature branch:**
```bash
git switch develop
git pull origin develop
git merge main  # Ensure develop has latest from main
git switch -c feature/new-name
```

**User Communication Pattern:**
- When user says "merge feature into develop" → Create PR to develop branch
- When user says "create PR" → Default to feature → develop (Git Flow)

## Testing & Quality Commands
Currently no specific test/lint commands defined for this project.

## Project-Specific Commands
This project has comprehensive `.claude/commands/` available:
- `write_cover_letter` - Generate tailored cover letters
- `review_experience` - Analyze work_experience.yaml quality  
- `parse_job` - Extract job requirements from descriptions
- `analyze_fit` - Match candidate profile to job requirements

## Common Workflows
1. **Cover Letter Generation**: `write_cover_letter --job_desc_file=job_desc/CompanyName_Role.md`
2. **Experience Review**: `review_experience --check-redundancy --suggest-improvements`
3. **Job Analysis**: `parse_job --input=job_desc/CompanyName_Role.md`