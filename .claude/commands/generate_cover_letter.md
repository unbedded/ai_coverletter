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
