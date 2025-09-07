# AI Cover Letter & Resume Generator

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

This repository contains an AI-powered system for generating personalized cover letters and resumes based on job descriptions and a structured database of work experiences.

## Features

### 🚀 Dual Generation System
- **Cover Letters**: Tailored to specific job descriptions with RAG-based matching
- **Resumes**: Multiple formats (standard, technical, executive, academic) with role targeting

### 📊 YAML Database Architecture  
- **Consolidated Experience Database**: `work_experience.yaml` with 32+ detailed experiences
- **Employment Timeline**: `work_history.yaml` with career progression and resume formatting
- **Personal Information**: Contact details and preferences in `personal_info.md`

### 🎯 Job Targeting
- Parse job descriptions for requirements matching
- Prioritize relevant experiences and skills
- Generate role-specific content emphasis

### 📈 Quantified Results
- Emphasizes measurable achievements (566% throughput improvements, $30M revenue, etc.)
- Patent citations and technical innovations
- Team leadership scope and project impact

## Quick Start

### Generate Cover Letter
```bash
write_cover_letter --job_file=job_desc/Company_Role.md --no-analytics
```

### Generate Resume  
```bash
# Standard resume
write_resume

# Technical resume for specific role
write_resume --target_role="Senior AI Engineer" --format=technical --emphasis=ai

# Executive format
write_resume --format=executive --emphasis=management
```

## Commands

| Command | Purpose | Key Options |
|---------|---------|-------------|
| `write_cover_letter` | Generate tailored cover letters | `--job_file`, `--haiku`, `--no-analytics` |
| `write_resume` | Generate multi-format resumes | `--format`, `--target_role`, `--emphasis` |

## File Structure

```
├── source_materials/
│   ├── work_experience.yaml    # Detailed experience database  
│   ├── work_history.yaml       # Employment timeline & resume data
│   └── personal_info.md        # Contact information
├── job_desc/                   # Job description files
├── output/                     # Generated documents
└── .claude/commands/           # Command definitions
```

## Version Information

Current Version: **1.0.0**

This project follows [Semantic Versioning](https://semver.org/) with [PEP 440](https://peps.python.org/pep-0440/) pre-release tags. See [CHANGELOG.md](CHANGELOG.md) for detailed release notes.
