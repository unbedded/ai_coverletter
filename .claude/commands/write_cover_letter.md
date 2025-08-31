# Write Cover Letter

Generate a tailored cover letter directly from a job description markdown file using source materials.

## Usage
```
write_cover_letter --job_file=<job_description_file_path>
```
Example: `write_cover_letter --job_file=raw_jobs/google_swe_2025-08-30.md`

## Parameters
- **job_file** (required): Path to the job description markdown file

## Required Source Files
The command requires these files in `source_materials/`:
1. **resume.md** - Your resume in markdown format
2. **work_experience.yaml** - Detailed skill:qualification database  
3. **personal_info.md** - Contact information and preferences

## Process
1. Read the job description from the provided file path
2. Extract company name, position, key REQUIRED and NICE TO HAVE requirements
3. Load source materials (resume, work experience YAML, personal info)
4. Match job requirements with qualifications from work_experience.yaml
5. Generate tailored cover letter using the specified template
6. **FLAG missing coverage** for REQUIRED skills not adequately supported by YAML
7. Save to `output/` directory

## Output File Naming
The cover letter will be saved to the `output/` directory with the prefix `cvrltr_`:
- Input: `--job_file=raw_jobs/example_swe_2025-08-30.md`
- Output: `output/cvrltr_example_swe_2025-08-30.md`

## Cover Letter Template Structure

```
[DATE]
Hiring Committee
[JOB TITLE]
[COMPANY]

RE: [JOB TITLE]

I am excited to apply for the [JOB TITLE] role at [COMPANY]. [3-4 sentences of why I am a great fit for this job].

I am eager to support [COMPANY] mission to [MISSION]. With over 20 years of experience working both in-country and remotely with Japanese engineering teams, I bring integration expertise, strong cross-cultural communication skills, and a deep respect for Japanese business practices. I exceed the minimum and nice-to-have qualifications with the following experience:

[EXPERIENCE TITLE - Pull the Requirement Directly from the Job Posting]
- [bullet list Demonstrating You Meet Requirements, provide a Specific Example from Your Work, and Highlight the Result or Outcome]

[EXPERIENCE TITLE 2]
- [bullet list with specific examples and quantified results]

[Additional experience sections as needed for REQUIRED qualifications, plus strong NICE TO HAVE matches]

[Closing text] I am excited about the opportunity to contribute to [company/project], leveraging my experience in [3x of the required skills that are strongest] and cross-cultural collaboration. I look forward to discussing how my skills align with [company's mission].

Sincerely,
Spencer Barrett

LINKS AND REFERENCES:
[1] [TITLE] : [HTML_LINK]
[2] [TITLE] : [HTML_LINK]

---

## ANALYSIS & METRICS

### Document Size Metrics
| Section | Lines | Words | Notes |
|---------|-------|-------|-------|
| Header & Opening | X | X | Contact info, intro paragraph |
| Experience Section 1 | X | X | [Requirement title] |
| Experience Section 2 | X | X | [Requirement title] |
| Experience Section 3 | X | X | [Requirement title] |
| Closing & Signature | X | X | Final paragraph, signature block |
| **TOTAL DOCUMENT** | **X** | **X** | **Target: <50 lines, <600 words** |

### Job Requirements Coverage Analysis
| Requirement | Type | Addressed | Quality | YAML Support | Notes |
|-------------|------|-----------|---------|--------------|-------|
| [Skill/Requirement 1] | REQUIRED | ✅/❌ | Strong/Good/Weak/None | ✅/⚠️/❌ | [Brief note] |
| [Skill/Requirement 2] | REQUIRED | ✅/❌ | Strong/Good/Weak/None | ✅/⚠️/❌ | [Brief note] |
| [Skill/Requirement 3] | NICE-TO-HAVE | ✅/❌ | Strong/Good/Weak/None | ✅/⚠️/❌ | [Brief note] |

**Quality Ratings:**
- **Strong**: Specific example with quantified results, direct skill match
- **Good**: Relevant example with some quantification, close skill match  
- **Weak**: General example, indirect skill connection
- **None**: Skill mentioned but no supporting evidence

### YAML Coverage Assessment
#### ✅ WELL-SUPPORTED REQUIRED SKILLS
- [Skill]: [Experience ID] - [Brief description of strong match]

#### ❌ INSUFFICIENT YAML COVERAGE FOR REQUIRED SKILLS  
- [Skill]: [Specific gap description] - **ACTION: Add experience entry**
- [Skill]: [Specific gap description] - **ACTION: Enhance existing entry EXP_XXX**

#### ⚠️ NICE-TO-HAVE SKILLS INCLUDED
- [Skill]: [Experience ID] - [Brief description]

#### 📝 YAML UPDATE RECOMMENDATIONS
1. **Missing Experience Entry Needed:**
   - **Skill:** [Skill name]
   - **Suggested Experience ID:** EXP_XXX
   - **Recommended Content:** [Specific suggestions for situation/action/result]

2. **Enhance Existing Entry:**
   - **Experience ID:** EXP_XXX  
   - **Enhancement Needed:** [Specific additions needed]
   - **Target Skills:** [Skills this would better support]
```

## Key Requirements
- **Length**: Keep to 1 page maximum
- **Priority**: Focus on REQUIRED experience first, include NICE TO HAVE only when strong matches exist
- **Specificity**: Pull experience titles directly from job posting requirements
- **Evidence**: Each bullet must include specific example from work and quantified result/outcome
- **Gap Detection**: **FLAG any REQUIRED skills where YAML lacks sufficient supporting evidence**
- **User Notification**: Alert when YAML updates are needed for better coverage
- **Links**: Include supporting links from work_experience.yaml when available
- **Cultural Context**: Emphasize 20+ years Japanese engineering collaboration when relevant
- **Matching**: Use work_experience.yaml categories, keywords, and story_adaptability ratings to select best examples

## Gap Flagging System
- **✅ WELL-SUPPORTED**: YAML has strong matching experience with quantified results
- **❌ INSUFFICIENT COVERAGE**: REQUIRED skill lacks adequate YAML evidence - UPDATE NEEDED
- **⚠️ NICE-TO-HAVE INCLUDED**: Optional skills where strong matches exist
- **📝 YAML UPDATE NEEDED**: Specific recommendations for missing experience entries

## Token Usage Tracking
The command tracks token usage and costs for each cover letter generation:

### Generation Footer
Each cover letter includes a footer with usage metrics:
```
---
GENERATION METADATA
Generated: 2025-08-31 12:45:30 UTC
Input tokens: 3,420 | Output tokens: 1,250 | Total: 4,670
Estimated cost: $0.14 (Claude Sonnet 4)
Session totals: 15,230 tokens | $0.46
```

### Cost Calculation
- **Claude Sonnet 4**: $3.00 per million input tokens, $15.00 per million output tokens
- **Session tracking**: Cumulative tokens and costs across all generations
- **Per-generation tracking**: Specific costs for this cover letter creation
- **Timestamp**: UTC timestamp for generation audit trail