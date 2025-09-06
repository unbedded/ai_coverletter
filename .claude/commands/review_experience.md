# Review Experience Database

Analyze and improve the work_experience.yaml database for better cover letter generation quality.

## Usage
```
review_experience [--experience_id=EXP_XXX] [--check-redundancy] [--suggest-improvements]
```

## Parameters
- **--experience_id** (optional): Review specific experience entry (e.g., EXP_001)
- **--check-redundancy** (optional): Flag redundant information across fields
- **--suggest-improvements** (optional): Provide enhancement recommendations

## What This Command Does

1. **Field Validation**: Ensures all required fields are present
2. **Redundancy Detection**: Identifies duplicate information across fields
3. **Quality Assessment**: Evaluates narrative hooks, quantified results, and evidence links
4. **Structure Review**: Checks STAR method implementation (Situation → Task → Action → Result)
5. **Reference Audit**: Validates inline [1], [2] references match supporting_links

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

## Example Commands

```bash
# Review all experiences for redundancy
review_experience --check-redundancy

# Get improvement suggestions for specific experience
review_experience --experience_id=EXP_001 --suggest-improvements

# Full analysis of single experience
review_experience --experience_id=EXP_026 --check-redundancy --suggest-improvements
```

## Troubleshooting

**Common Issues:**
- **Missing references**: Add [1], [2] citations after claims
- **Redundant metrics**: Move duplicate numbers to single appropriate field
- **Weak narrative hooks**: Start with quantified impact or notable achievement
- **Vague actions**: Replace generic terms with specific technical methods
- **Role misalignment**: Ensure role field matches narrative text ("Technical Lead" → "**Led as Technical Lead**...")
- **Missing role integration**: Weave role throughout action_description ("**As Principal Engineer**, implemented...")

## Benefits

- **Improved Cover Letter Quality**: Better experience matching and presentation
- **Consistency**: Ensures all experiences follow the same high standards
- **Evidence Tracking**: Validates that all supporting links are properly referenced
- **Efficiency**: Identifies the most impactful experiences for specific job types
- **Maintenance**: Keeps the experience database clean and optimized

Use this command regularly when adding new experiences or preparing for important application campaigns.