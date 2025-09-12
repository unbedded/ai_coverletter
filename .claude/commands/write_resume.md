# Resume Generation Command

**Purpose**: Generate tailored resumes from structured experience database and work history

## Command Usage

```bash
write_resume [OPTIONS]
```

### Options

- `--job_file=<job_description_file>` - Job description file for intelligent targeting (optional)
- `--target_role=<role>` - Target job role/title for resume tailoring (optional)
- `--company=<company>` - Target company for customization (optional)
- `--format=<format>` - Output format: `standard`, `technical`, `executive`, `academic` (default: standard)
- `--length=<pages>` - Target length: `1`, `2`, `full` (default: 2)
- `--emphasis=<focus>` - Emphasis area: `technical`, `management`, `ai`, `robotics`, `patents` (optional)
- `--output_file=<path>` - Custom output filename (default: auto-generated)
- `--include_references` - Include references section
- `--no_contact_header` - Exclude contact information header

### Examples

```bash
# Standard 2-page resume
write_resume

# AI-focused resume for specific role
write_resume --target_role="Senior AI Engineer" --emphasis=ai --format=technical

# Executive summary for management position
write_resume --target_role="Engineering Manager" --format=executive --emphasis=management

# Academic format with full experience
write_resume --format=academic --length=full --include_references
```

## Required Source Files

The command requires these source files to generate resumes:

### Primary Data Sources
- `source_materials/work_experience.yaml` - Detailed experience database with quantified results
- `source_materials/work_history.yaml` - Employment timeline, education, and resume formatting data
- `source_materials/personal_info.md` - Contact details and preferences

### Optional Enhancement Files
- `job_desc/[Company_Role].md` - Job description for targeted resume generation

## Process Overview

### Step 1: Data Integration
1. Load employment history and personal information from work_history.yaml
2. Load detailed experiences from work_experience.yaml database
3. Parse job description from --job_file for intelligent targeting requirements
4. Extract contact information from personal_info.md

### Step 2: Content Selection and Prioritization
1. **Experience Matching**: Select most relevant experiences based on:
   - Target role requirements (if provided)
   - Specified emphasis area
   - Quantified impact and results
   - Recency and career progression

2. **Skills Consolidation**: Aggregate technical skills from:
   - work_history.yaml technical_skills sections
   - work_experience.yaml tech_stack fields
   - Prioritize based on target role relevance

3. **Achievement Prioritization**: Select key achievements emphasizing:
   - Revenue/business impact ($30M+, 566% improvements)
   - Technical innovation (9 patents, AI frameworks)
   - Leadership scope (25-engineer teams)
   - Recent AI/automation work

### Step 3: Resume Generation
1. **Header Section**: Contact information and professional summary
2. **Key Achievements**: 5-7 bullet points with quantified results
3. **Technical Skills**: Categorized by domain (AI/ML, Languages, Systems, etc.)
4. **Experience Section**: 
   - Chronological employment history
   - 3-5 bullets per role with quantified results
   - Career progression narrative
5. **Education Section**: Degrees, institutions, thesis details

### Step 4: Format and Output
1. Apply specified format styling (standard/technical/executive/academic)
2. Adjust length based on target (1/2/full pages)
3. Generate output filename based on job_file or parameters
4. Save formatted resume to output directory
5. Generate separate analysis file (`*_analysis.md`) with detailed gap analysis and metrics

## Resume Formats

### Standard Format
- Clean professional layout
- Balanced technical and business content
- 2-page target length
- Industry-standard sections

### Technical Format  
- Emphasis on technical skills and achievements
- Detailed tech stack information
- Patent and publication highlights
- Code/project references

### Executive Format
- Leadership and business impact focus
- Revenue and team size emphasis
- Strategic decision-making examples
- Reduced technical detail

### Academic Format
- Research and publication emphasis
- Detailed education section
- Conference presentations
- Full chronological history

## Quality Guidelines

### Content Standards
1. **Quantified Results**: Every bullet point should include metrics when possible
2. **Action-Oriented**: Start bullets with strong action verbs
3. **Relevance**: Prioritize recent and role-relevant experiences
4. **Progression**: Show clear career advancement and growth

### Technical Accuracy
1. **Skills Verification**: Only include demonstrable technical skills
2. **Experience Mapping**: Ensure experiences align with employment timeline
3. **Patent Citations**: Include accurate patent numbers and links
4. **Achievement Validation**: Cross-reference claims with experience database

### Format Consistency
1. **Date Formatting**: Consistent YYYY-YYYY or YYYY-MM format
2. **Bullet Styling**: Consistent bullet point formatting
3. **Section Headers**: Clear section delineation
4. **Length Management**: Respect target page length

## Integration Notes

This command works in concert with:
- `write_cover_letter.md` - Shares experience database for consistency
- `analyze_fit.md` - Uses similar job requirement parsing
- `review_experience.md` - Relies on validated experience database

## Output File Naming

### When using --job_file (preferred):
Based on input job file name:
- Input: `--job_file=job_desc/_Rapyuta_Robo.SysIntEng.md`
- Output Resume: `output/resume_Rapyuta_Robo.SysIntEng.md`
- Analysis File: `output/resume_Rapyuta_Robo.SysIntEng_analysis.md`

**Naming Logic:** `resume_` + `[original_filename_without_extension]` + `.md/_analysis.md`

### When using manual parameters:
Traditional naming:
- `output/resume_[TargetRole]_[Company]_[YYYYMMDD].md`
- `output/resume_[TargetRole]_[Company]_[YYYYMMDD]_analysis.md`

Example outputs:
- `output/resume_SeniorAIEngineer_OpenAI_20250907.md`
- `output/resume_standard_20250907.md`

## Field Mapping Reference

### From work_history.yaml
- Professional summary → Resume header
- Employment history → Experience chronology  
- Education → Education section
- Key achievements → Achievement bullets
- Technical skills → Skills taxonomy

### From work_experience.yaml
- Quantified results → Experience bullets
- Tech stack → Skills consolidation
- Keywords → Role targeting
- Supporting links → References/citations

### From personal_info.md
- Contact details → Header information
- Location preferences → Geographic targeting