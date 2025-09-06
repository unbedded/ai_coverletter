#!/bin/bash
# Cover Letter Automation Specific Setup
# Run this AFTER the general Claude Code project setup

set -Eeuo pipefail

FORCE=0

# Help function
show_help() {
    cat << EOF
Usage: $0 [options]

Add cover letter automation to existing Claude Code project.
Must be run AFTER setup_claude_project.sh

Optional:
  -f            Force overwrite existing files
  -h            Show this help message

Examples:
  $0              # Add cover letter automation
  $0 -f           # Force overwrite existing cover letter files

Prerequisites:
  - Run setup_claude_project.sh first
  - Must be in Claude Code project directory (.claude/ must exist)

What gets added:
  - Job application directory structure
  - Claude Code commands: parse_job, generate_cover_letter, analyze_fit
  - Templates for job descriptions and cover letters
  - Source materials templates
  - Example job description for testing

EOF
}

while getopts ":fh" opt; do
  case "$opt" in
    f) FORCE=1 ;;
    h) show_help; exit 0 ;;
    \?) echo "Invalid option: -$OPTARG" >&2; echo "Use -h for help."; exit 2 ;;
    :)  echo "Option -$OPTARG requires an argument." >&2; echo "Use -h for help."; exit 2 ;;
  esac
done

echo "💼 Adding Cover Letter Automation to Claude Code project..."

# Verify we're in a Claude Code project
if [[ ! -d ".claude" ]]; then
  echo "❌ ERROR: Not in a Claude Code project directory."
  echo "   .claude/ directory not found."
  echo "   Run setup_claude_project.sh first!"
  exit 1
fi

if [[ ! -f "README.md" ]]; then
  echo "⚠️  WARNING: No README.md found. Are you sure this is a Claude Code project?"
fi

# Create cover letter specific directories (only if they don't exist)
echo "📁 Creating cover letter directory structure..."
mkdir -p {source_materials,raw_jobs,processed_jobs,cover_letters,applications}

# Helper function for conditional file creation
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

# Create job description parsing command
if create_if_not_exists ".claude/commands/parse_job.md"; then
cat > .claude/commands/parse_job.md << 'EOF'
# Parse Job Description

Convert raw job description into standardized markdown format.

## Usage
```
parse_job <input_file>
```
Example: `parse_job raw_jobs/google_swe_2025-08-30.md`

## Input
Raw job description markdown file (any format)

## Process
1. Read raw job description from file
2. Extract and categorize information using standardized template
3. Save standardized version to `processed_jobs/` with `_std.md` suffix

## Output
Standardized job description ready for cover letter generation
EOF
fi

# Create cover letter generation command
if create_if_not_exists ".claude/commands/generate_cover_letter.md"; then
cat > .claude/commands/generate_cover_letter.md << 'EOF'
# Generate Cover Letter

Create tailored cover letter from standardized job description and source materials.

## Usage
```
generate_cover_letter <std_job_desc_file>
```
Example: `generate_cover_letter processed_jobs/google_swe_2025-08-30_std.md`

## Required Source Files
- `source_materials/resume.md` - Your resume
- `source_materials/skills_qualifications.md` - Detailed qualifications database
- `source_materials/personal_info.md` - Contact information

## Process
1. Read standardized job description
2. Load source materials (resume, skills, personal info)
3. Match job requirements with your qualifications
4. Generate tailored cover letter using specific examples and metrics
5. Save to `cover_letters/` directory

## Output
Professional cover letter in markdown format with:
- Specific examples matching job requirements
- Quantifiable achievements
- Company-specific customization
EOF
fi

# Create job fit analysis command
if create_if_not_exists ".claude/commands/analyze_fit.md"; then
cat > .claude/commands/analyze_fit.md << 'EOF'
# Analyze Job Fit

Analyze how well your qualifications match job requirements.

## Usage
```
analyze_fit <std_job_desc_file>
```

## Process
1. Compare job requirements against your qualifications
2. Calculate match percentage
3. Identify strong matches, gaps, and unique value propositions
4. Provide application recommendation

## Output
Detailed analysis with:
- Overall fit score (0-100%)
- Requirement-by-requirement breakdown
- Strategic recommendations
- Cover letter focus suggestions
EOF
fi

# Create standardized job description template
if create_if_not_exists ".claude/templates/std_job_desc_template.md"; then
cat > .claude/templates/std_job_desc_template.md << 'EOF'
# {JOB_TITLE}

## Company Information
**Company:** {COMPANY_NAME}
**Location:** {LOCATION}
**Employment Type:** {EMPLOYMENT_TYPE}
**Salary Range:** {SALARY_RANGE}

## Job Summary
{JOB_SUMMARY}

## Key Responsibilities
{RESPONSIBILITIES_LIST}

## Required Qualifications
### Experience
{EXPERIENCE_REQUIREMENTS}

### Technical Skills
{TECHNICAL_SKILLS}

### Education
{EDUCATION_REQUIREMENTS}

### Soft Skills
{SOFT_SKILLS}

## Preferred Qualifications
{PREFERRED_QUALIFICATIONS}

## Benefits
{BENEFITS}

## Application Details
- **Deadline:** {DEADLINE}
- **How to Apply:** {APPLICATION_PROCESS}
- **Materials Required:** {REQUIRED_MATERIALS}

---
*Processed: {DATE}*
*Source: {SOURCE_URL}*
EOF
fi

# Create cover letter template
if create_if_not_exists ".claude/templates/cover_letter_template.md"; then
cat > .claude/templates/cover_letter_template.md << 'EOF'
# Cover Letter Template

## Header
{YOUR_NAME}
{YOUR_CONTACT_INFO}

{DATE}

{HIRING_MANAGER_INFO}
{COMPANY_NAME}

## Letter

Dear {HIRING_MANAGER_NAME},

**Opening:** {POSITION_INTEREST_AND_VALUE_HOOK}

**Body 1:** {MATCHED_QUALIFICATIONS_WITH_SPECIFIC_EXAMPLES}

**Body 2:** {ADDITIONAL_VALUE_AND_COMPANY_FIT}

**Closing:** {CALL_TO_ACTION}

Sincerely,
{YOUR_NAME}

---
*Generated: {DATE}*
*For: {COMPANY_NAME} - {JOB_TITLE}*
EOF
fi

# Create source material templates
if create_if_not_exists "source_materials/skills_qualifications.md"; then
cat > source_materials/skills_qualifications.md << 'EOF'
# Software Engineer - TechCorp

**Location:** San Francisco, CA (Remote OK)
**Type:** Full-time  
**Salary:** $120,000 - $160,000

## About TechCorp
TechCorp is building next-generation cloud infrastructure tools used by Fortune 500 companies.

## What You'll Do
- Develop scalable Python/Django backend services
- Build responsive React frontend components
- Collaborate with product team in agile environment
- Optimize PostgreSQL database queries and performance
- Participate in code reviews and technical discussions

## Requirements
- 3+ years professional Python development experience
- Experience with Django or Flask web frameworks
- Frontend skills with React and modern JavaScript
- Database experience with PostgreSQL or similar
- Bachelor's degree in Computer Science or equivalent experience
- Strong written and verbal communication skills
- Experience with Git version control

## Preferred Qualifications
- AWS or cloud platform experience
- Docker and containerization experience
- Experience with microservices architecture
- Open source contributions
- Agile/Scrum methodology experience

## Benefits
- Comprehensive health, dental, vision insurance
- 401(k) with 4% company match
- Unlimited PTO policy
- $2,000 annual professional development budget
- Remote work flexibility
- Stock options

## How to Apply
Send resume and cover letter to: careers@techcorp.com
Application deadline: September 15, 2025
EOF

EOF
fi

if create_if_not_exists "source_materials/resume.md"; then
cat > source_materials/resume.md << 'EOF'
# [Your Name]

*Replace this template with your actual resume content*

**Email:** your.email@example.com  
**Phone:** (555) 123-4567  
**Location:** City, State  

## Professional Summary
[Your 2-3 sentence summary]

## Experience
### [Job Title] | [Company] | [Dates]
- [Achievement with metrics]
- [Achievement with metrics]

## Education
**[Degree]** | [University] | [Year]

## Technical Skills
- **Languages:** [List]
- **Tools:** [List]
EOF
fi

if create_if_not_exists "source_materials/personal_info.md"; then
cat > source_materials/personal_info.md << 'EOF'
# Personal Information

*Fill this out with your actual information*

## Contact Details
- **Full Name:** [Your Name]
- **Email:** [your.email@example.com]
- **Phone:** [(555) 123-4567]
- **LinkedIn:** [your-linkedin]

## Application Preferences
- **Preferred Salary Range:** [$X - $Y]
- **Location Preferences:** [Remote/City preferences]
- **Start Date:** [Availability]
EOF
fi

# Create example job for testing
if create_if_not_exists "raw_jobs/example_swe_2025-08-30.md"; then
cat > raw_jobs/example_swe_2025-08-30.md << 'EOF'

EOF
fi

# Update .gitignore to include cover letter specific ignores
if [[ -f ".gitignore" ]]; then
    echo "" >> .gitignore
    echo "# Cover Letter Automation - Personal Data" >> .gitignore
    echo "source_materials/personal_info.md" >> .gitignore
    echo "source_materials/resume.md" >> .gitignore
    echo "" >> .gitignore
    echo "# Optional: Uncomment to avoid tracking generated files" >> .gitignore
    echo "# applications/" >> .gitignore
    echo "# cover_letters/" >> .gitignore
    echo "✏️  Updated .gitignore with cover letter specific rules"
fi

# Create source materials README
if create_if_not_exists "source_materials/README.md"; then
cat > source_materials/README.md << 'EOF'
# Source Materials

Your core documents for cover letter generation.

## Required Files
1. **resume.md** - Your resume in markdown format
2. **skills_qualifications.md** - Detailed skill:qualification database  
3. **personal_info.md** - Contact information and preferences

## Tips
- Keep skills_qualifications.md updated with new achievements
- Use specific metrics and outcomes in qualifications
- Structure qualifications to mirror common job requirement language
EOF
fi

echo "💼 Cover letter automation setup complete!"
echo ""
echo "📋 What was added:"
echo "   - Job application directories: raw_jobs/, processed_jobs/, cover_letters/, applications/"
echo "   - Claude Code commands: parse_job, generate_cover_letter, analyze_fit"
echo "   - Templates: job description and cover letter formats"
echo "   - Source materials: resume, skills, personal info templates"
echo "   - Example job description for testing"
echo "   - Updated .gitignore for personal data protection"
echo ""
echo "🎯 Next steps:"
echo "   1. Fill out templates in source_materials/"
echo "   2. claude init  # Initialize Claude Code (if not done yet)"
echo "   3. Test with: claude parse_job raw_jobs/example_swe_2025-08-30.md"
echo ""
echo "Ready to automate cover letter generation! 🚀"