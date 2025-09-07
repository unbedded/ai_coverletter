# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html) with [PEP 440](https://peps.python.org/pep-0440/) pre-release tags.

## [1.0.0] - 2025-09-07

### Added
- **Resume Generation System**: Complete `write_resume` command with multiple formats (standard/technical/executive/academic)
- **YAML Database Architecture**: Consolidated `work_experience.yaml` with `work_history.yaml` for comprehensive career data management
- **Job Targeting**: Both cover letter and resume generation support job description targeting
- **Multi-Format Support**: Technical, executive, academic, and standard resume formats
- **Skills Consolidation**: Automated aggregation from experience database and work history
- **Quality Guidelines**: Quantified results emphasis and technical accuracy standards

### Changed  
- **Database Schema**: Removed 8 sparse fields from work_experience.yaml (45.1% keyword reduction)
- **Field Consolidation**: Merged secondary_skills, keywords, and tags into unified keywords field
- **YAML-Only Workflow**: Eliminated resume.md dependency, proven superior approach
- **Documentation Updates**: Updated write_cover_letter.md for new workflow

### Removed
- **Deprecated Commands**: Removed 16 unused Claude commands (add_ci, parse_job, etc.)
- **Legacy Scripts**: Archived 39+ old files including consolidation tools and outdated references
- **Sparse YAML Fields**: Eliminated stakeholders, region_context, environments, and 5 other low-usage fields

### Fixed
- **Git Ignore**: Optimized patterns for generated output files
- **Field Separation**: Clear guidelines for keywords (domain concepts) vs tech_stack (technical items)
- **Database Consistency**: Resolved content overlap between multiple fields

## Version Guidelines

### Semantic Versioning (SemVer)
- **MAJOR** (X.0.0): Breaking changes to command interfaces or data formats
- **MINOR** (X.Y.0): New features, commands, or significant enhancements  
- **PATCH** (X.Y.Z): Bug fixes, documentation updates, minor improvements

### Pre-release Tags (PEP 440)
- **Alpha**: `X.Y.ZaN` - Early development, unstable features
- **Beta**: `X.Y.ZbN` - Feature complete, testing phase  
- **Release Candidate**: `X.Y.ZrcN` - Final testing before release

### Examples
- `1.0.0` - Initial stable release
- `1.1.0a1` - First alpha of minor feature addition
- `1.1.0b2` - Second beta of minor feature addition  
- `1.1.0rc1` - Release candidate
- `1.1.0` - Stable minor release
- `2.0.0a1` - Alpha of major breaking changes

## Release Process
1. Update VERSION file with target version
2. Update CHANGELOG.md with release notes
3. Commit version bump: `git commit -m "Bump version to X.Y.Z"`
4. Create git tag: `git tag vX.Y.Z`
5. Push tag: `git push origin vX.Y.Z`  
6. Merge develop → main via PR
7. Create GitHub release from tag