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

The command uses the **Experience Database Reference** section from `write_cover_letter.md` as its review standard, including:

### Field Definition Compliance
- **narrative_hook**: One sentence, <25 words, strongest achievement with impact
- **situation_task**: Context and challenge, no numbers (save for results)
- **action_description**: Specific methods and approaches, no outcomes
- **quantified_results**: All metrics, percentages, and measurable proof

### Anti-Redundancy Rules
- Each fact appears in only ONE field
- No metric repetition across fields
- Each field adds NEW information
- Numbers in narrative_hook not repeated in quantified_results

### Evidence Integration
- Inline [1], [2] references properly placed in text
- Supporting links have corresponding inline references
- Reference numbers unique within each experience_id

## Sample Output

```
EXPERIENCE REVIEW: EXP_026
✅ Required fields: Complete
⚠️  Redundancy detected: "$30M+ sales" appears in both narrative_hook and quantified_results
❌ Missing inline reference: Patent US6706999B1 mentioned but no [4] reference in text
✅ Field hierarchy: Proper STAR method structure

RECOMMENDATIONS:
1. Remove "$30M+ sales" from quantified_results (already in narrative_hook)
2. Add [4] reference after "US6706999B1" in action_description
3. Consider shortening narrative_hook (currently 28 words, target <25)

QUALITY SCORE: 85/100
```

## Integration with write_cover_letter.md

This command references the comprehensive **Experience Database Reference** section in `write_cover_letter.md` which contains:

- Field Definition Rules (narrative_hook, situation_task, action_description, quantified_results)
- Information Hierarchy Rules (Tier 1-4 structure)  
- Anti-Redundancy Rules
- Best Practices for Experience Entries
- Complete example entry with proper structure

## Benefits

- **Improved Cover Letter Quality**: Better experience matching and presentation
- **Consistency**: Ensures all experiences follow the same high standards
- **Evidence Tracking**: Validates that all supporting links are properly referenced
- **Efficiency**: Identifies the most impactful experiences for specific job types
- **Maintenance**: Keeps the experience database clean and optimized

Use this command regularly when adding new experiences or preparing for important application campaigns.