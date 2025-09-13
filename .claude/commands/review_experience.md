# Review Experience Database

Analyze and improve the work_experience.yaml database for better cover letter generation quality.

## Usage
```
review_experience [--experience_id=EXP_XXX] [--check-redundancy] [--suggest-improvements] [--renumber-refs]
```

## Parameters
- **--experience_id** (optional): Review specific experience entry (e.g., EXP_001)
- **--check-redundancy** (optional): Flag redundant information across fields
- **--suggest-improvements** (optional): Provide enhancement recommendations
- **--renumber-refs** (optional): Renumber all reference numbers globally for consistent footnoting

## What This Command Does

1. **Field Validation**: Ensures all required fields are present
2. **Redundancy Detection**: Identifies duplicate information across fields
3. **Quality Assessment**: Evaluates narrative hooks, quantified results, and evidence links
4. **Structure Review**: Checks STAR method implementation (Situation → Task → Action → Result)
5. **Reference Audit**: Validates inline [1], [2] references match supporting_links
6. **Reference Renumbering**: Creates globally sequential reference numbers across all experiences

## Review Criteria

This command applies the complete **Experience Database Reference** section from `write_cover_letter.md`:

### Field Requirements
- **role field**: Must match Standard Engineering Role Archetypes from write_cover_letter.md
- **narrative_hook**: Compelling opening (15-25 words, Tier 1 impact), must start with role
- **situation_task**: Context and objectives (Tier 2 setup)
- **action_description**: Specific actions taken (Tier 3 methods), must weave role throughout
- **quantified_results**: Measurable outcomes (Tier 4 evidence)
- **Role Harmonization**: role field must align with roles stated in narrative_hook and action_description

### Quality Standards
- **STAR Method Structure**: Situation → Task → Action → Result flow
- **Anti-Redundancy**: Each fact appears in only one field
- **Evidence Linking**: All claims backed by inline references [1], [2], etc.
- **Supporting Links Validation**: Referenced sources must exist and be accessible

### Best Practices
- Use active voice and specific metrics
- Include patent numbers, publication titles, or other verifiable evidence
- Maintain professional tone while showcasing impact
- Ensure logical progression from context to results

## Sample Output

```
EXPERIENCE REVIEW: EXP_026
✅ Required fields: Complete
⚠️  Redundancy detected: "$30M+ sales" appears in both narrative_hook and quantified_results
❌ Missing inline reference: Patent US6706999B1 mentioned but no [4] reference in text
✅ Field hierarchy: Proper STAR method structure
❌ Role harmonization: role field "Technical Lead" doesn't match narrative_hook "Technical leader who brought..."

RECOMMENDATIONS:
1. Remove "$30M+ sales" from quantified_results (already in narrative_hook)
2. Add [4] reference after "US6706999B1" in action_description
3. Consider shortening narrative_hook (currently 28 words, target <25)
4. Update narrative_hook to start with "**Led as Technical Lead**" to match role field
5. Weave "As Technical Lead" throughout action_description

QUALITY SCORE: 75/100
```

## Quality Score Methodology

**Score Breakdown (0-100 points):**
- **Field Completeness** (20 pts): All required fields present and properly formatted
- **STAR Structure** (15 pts): Clear progression from situation to results
- **Anti-Redundancy** (15 pts): No duplicate information across fields
- **Evidence Quality** (15 pts): Inline references match supporting_links
- **Impact Clarity** (15 pts): Quantified results and compelling narrative hook
- **Role Harmonization** (20 pts): role field matches narrative_hook/action_description integration

**Score Ranges:**
- **90-100**: Excellent, ready for high-impact applications
- **80-89**: Good, minor improvements needed
- **70-79**: Adequate, moderate improvements required
- **60-69**: Poor, significant revision needed
- **Below 60**: Requires complete restructuring

## Reference Renumbering Process (--renumber-refs)

When using `--renumber-refs`, the command will:

1. **Collect All References**: Scan all experiences and gather all supporting_links
2. **Create Global Sequence**: Assign new sequential numbers (1, 2, 3, 4, ...) across entire database
3. **Update ref_number Fields**: Modify all `ref_number:` values in supporting_links
4. **Update Inline Citations**: Replace all [X] references in text fields to match new numbering
5. **Preserve Link Order**: Maintain logical grouping while ensuring global uniqueness

### Before Renumbering (Current Problem):
```yaml
# EXP_026
supporting_links:
  - ref_number: 4    # US Patent
# EXP_027  
supporting_links:
  - ref_number: 1    # GitHub (conflicts!)
  - ref_number: 2    # Article (conflicts!)
# EXP_002
supporting_links:
  - ref_number: 1    # Investment (conflicts!)
  - ref_number: 2    # Conference (conflicts!)
```

### After Renumbering (Fixed):
```yaml
# EXP_026
supporting_links:
  - ref_number: 1    # US Patent (renumbered)
# EXP_027  
supporting_links:
  - ref_number: 2    # GitHub 
  - ref_number: 3    # Article
# EXP_002
supporting_links:
  - ref_number: 4    # Investment
  - ref_number: 5    # Conference
```

**Result**: Cover letter generators can now use footnotes [1], [2], [3]... without conflicts.

## Example Commands

```bash
# Review all experiences for redundancy
review_experience --check-redundancy

# Get improvement suggestions for specific experience
review_experience --experience_id=EXP_001 --suggest-improvements

# Full analysis of single experience
review_experience --experience_id=EXP_026 --check-redundancy --suggest-improvements

# Fix reference numbering conflicts across entire database
review_experience --renumber-refs

# Complete database cleanup and optimization
review_experience --check-redundancy --suggest-improvements --renumber-refs
```

## Troubleshooting

**Common Issues:**
- **Missing references**: Add [1], [2] citations after claims
- **Redundant metrics**: Move duplicate numbers to single appropriate field
- **Weak narrative hooks**: Start with quantified impact or notable achievement
- **Vague actions**: Replace generic terms with specific technical methods
- **Role misalignment**: Ensure role field matches narrative text ("Technical Lead" → "**Led as Technical Lead**...")
- **Missing role integration**: Weave role throughout action_description ("**As Principal Engineer**, implemented...")
- **Reference number conflicts**: Use `--renumber-refs` to fix footnote numbering issues
- **Broken footnote links**: After renumbering, cover letters will have correct sequential [1], [2], [3]... references

## Benefits

- **Improved Cover Letter Quality**: Better experience matching and presentation
- **Consistency**: Ensures all experiences follow the same high standards
- **Evidence Tracking**: Validates that all supporting links are properly referenced
- **Efficiency**: Identifies the most impactful experiences for specific job types
- **Maintenance**: Keeps the experience database clean and optimized
- **Fixed Footnoting**: Eliminates reference number conflicts for perfect cover letter footnotes

## Reference Renumbering Implementation Details

The `--renumber-refs` functionality follows this algorithm:

1. **Scan Order**: Process experiences in the order they appear in the YAML file
2. **Assignment Strategy**: Assign sequential numbers starting from 1
3. **Text Field Updates**: Update inline [X] references in these fields:
   - `action_description`
   - `quantified_results` 
   - `narrative_hook`
   - `situation_task`
4. **Preservation**: Maintain all URL links and titles exactly as they are
5. **Validation**: Ensure all inline references have matching supporting_links entries

**Expected Outcome**: After running `review_experience --renumber-refs`, all cover letters generated will have correct, sequential footnote numbering without conflicts.

Use this command regularly when adding new experiences or preparing for important application campaigns.