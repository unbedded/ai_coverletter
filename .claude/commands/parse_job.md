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
