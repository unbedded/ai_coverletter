# Write Resume

Generate tailored resumes from structured experience database and work history.

## Usage
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

## File Locations
- **{WORK_EXP_DB}** = `source_materials/work_experience.yaml`
- **{WORK_HISTORY}** = `source_materials/work_history.yaml`
- **{PERSONAL_INFO}** = `source_materials/personal_info.md`
- **{OUTPUT_DIR}** = `output/`

## INPUTS (Required Files)
1. **Experience Database**: {WORK_EXP_DB} - Detailed experience with quantified results
2. **Work History**: {WORK_HISTORY} - Employment timeline, education, resume formatting
3. **Personal Info**: {PERSONAL_INFO} - Contact details and preferences
4. **Job Description** (optional): `--job_file` parameter for targeted generation

## OUTPUTS (Generated Files)
All files saved to {OUTPUT_DIR} with naming pattern: `resume_{basename}*`

1. **Resume (Markdown)**: `resume_{basename}.md`
2. **Analysis Report**: `resume_{basename}_analysis.md`

**Example:** `--job_file=job_desc/Mujin_RoboSysEng_COPY.md` generates:
- `{OUTPUT_DIR}/resume_Mujin_RoboSysEng_COPY.md`
- `{OUTPUT_DIR}/resume_Mujin_RoboSysEng_COPY_analysis.md`

## Generation Process
1. **Load Source Files**: Read {WORK_HISTORY}, {WORK_EXP_DB}, and {PERSONAL_INFO}
2. **Parse Job File**: Extract target role requirements (if provided)
3. **Select Content**: Match relevant experiences and skills to target role
4. **Generate Resume**: Create formatted resume with quantified achievements
5. **Create Analysis**: Generate gap analysis and metrics
6. **Save Files**: Output to {OUTPUT_DIR} with consistent naming

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

## File Naming Convention

**Primary Pattern:** `resume_{basename}*` where `{basename}` comes from job file name

**Manual Parameters:** When no job file provided:
- `resume_{target_role}_{company}_{date}.md`
- `resume_standard_{date}.md` (fallback)

## Field Mapping Reference

### From {WORK_HISTORY}
- Professional summary → Resume header
- Employment history → Experience chronology
- Education → Education section
- Key achievements → Achievement bullets
- Technical skills → Skills taxonomy

### From {WORK_EXP_DB}
- Quantified results → Experience bullets
- Tech stack → Skills consolidation
- Keywords → Role targeting
- Supporting links → References/citations

### From {PERSONAL_INFO}
- Contact details → Header information
- Location preferences → Geographic targeting