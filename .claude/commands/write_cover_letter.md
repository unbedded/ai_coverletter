# Write Cover Letter

Generate a tailored cover letter directly from a job description file using intelligent extraction and source materials matching.

**Quick Help:** Use `write_cover_letter -h` or `write_cover_letter --help` to display usage information.

## Usage
```
write_cover_letter --job_file=<job_description_file_path> [--haiku] [--no-analytics]
```
Example: `write_cover_letter --job_file=job_desc/Rapyuta_Robo.SysIntEng.md --haiku`

## Parameters
- **job_file** (required): Path to the job description markdown file - **THE SINGLE SOURCE OF TRUTH**
- **--haiku** (optional): Use Claude Haiku model for cost optimization (~85% cost reduction)
- **--no-analytics** (optional): Skip analysis section generation to reduce tokens and cost

## Why Job-File-Centric Design Is Powerful

The `--job_file` argument automatically extracts **everything needed** for perfect targeting:
- ✅ **Company name & mission** - Direct from job posting
- ✅ **Role title & responsibilities** - Exact job language  
- ✅ **Required vs. preferred skills** - Weighted by importance
- ✅ **Company-specific context** - Platform names, team structure, challenges
- ✅ **Industry terminology** - Uses employer's own language

**Result:** Superior targeting without manual specification or human error.

## Required Source Files
The command requires these files in `source_materials/`:
1. **work_experience.yaml** - Detailed skill:qualification database (see Experience Database Reference at end)  
2. **personal_info.md** - Contact information and preferences

**Note:** The consolidated `work_experience.yaml` database is self-sufficient for high-quality cover letter generation. After extensive testing and database consolidation (45.1% keyword reduction, duplicate elimination, field separation), the YAML-only approach produces superior results with better job requirement alignment and complete reference link coverage.

## Process
1. Read the job description from the provided file path
2. Extract company name, position, key REQUIRED and NICE TO HAVE requirements
3. Load source materials (work_experience YAML, personal info)
4. Match job requirements with qualifications from work_experience.yaml
5. **Select diverse examples**: Choose opening achievement from best job-matching narrative_hook, then select DIFFERENT experiences for each section
6. Generate tailored cover letter using the specified template:
   - **Concise opening**: Use narrative_hook from strongest matching experience + company mission connection
   - **Distinct experience sections**: Use different experiences than the opening narrative_hook
   - **Target 350-400 words total**
   - Ensure all bullet points follow "As [Role], [action], [result]" pattern
7. **FLAG missing coverage** for REQUIRED skills not adequately supported by YAML
8. Save to `output/` directory both a markdown version and an ASCII version
   - The ASCII version uses ALL CAP for bold
9. Generate separate analysis file (`*_analysis.md`) with detailed gap analysis and metrics

## Output File Naming
The command generates three files in the `output/` directory based on the input job file name:
- Input: `--job_file=job_desc/_Rapyuta_Robo.SysIntEng.md`
- Output Markdown: `output/cvrltr_Rapyuta_Robo.SysIntEng.md`
- Output ASCII: `output/cvrltr_Rapyuta_Robo.SysIntEng.txt`
- Analysis File: `output/cvrltr_Rapyuta_Robo.SysIntEng_analysis.md`

**Naming Logic:** `cvrltr_` + `[original_filename_without_extension]` + `.md/.txt/_analysis.md`

## Cover Letter Template Structure

```
[DATE]

Hiring Committee<br>
[COMPANY]<br>
RE: [JOB TITLE]

[CONCISE OPENING - 1-2 sentences maximum connecting strongest achievement to company mission. Use the narrative_hook from your strongest matching experience, then connect to company mission. Examples:
- "Engineering Manager who scaled autonomous collision system from POC demo to 6-vehicle production pilot fleet through 5 customer phase gates [1]. Excited to contribute to [COMPANY]'s [SPECIFIC MISSION/CHALLENGE]."
- "Staff Engineer who pioneered AI-assisted development workflow combining 20+ years expertise with automated code generation [1]. Excited to contribute to [COMPANY]'s [SPECIFIC MISSION/CHALLENGE]."
- "Technical Lead who brought new products to market generating $30M+ sales while managing 25-engineer team [1]. Excited to contribute to [COMPANY]'s [SPECIFIC MISSION/CHALLENGE]."]

[EXPERIENCE TITLE 1 - Pull the Requirement Directly from the Job Posting]
- [bullet list Demonstrating You Meet Requirements, provide a Specific Example from Your Work, and Highlight the Result or Outcome]

[Additional experience sections as needed for REQUIRED qualifications, plus strong NICE TO HAVE matches]

[Closing text] I look forward to the opportunity to contribute to [company/project], leveraging my experience in [3x of the required skills that are strongest] and cross-cultural collaboration. I look forward to discussing how my skills align with [company's mission].

Sincerely,
Spencer Barrett

**LINKS AND REFERENCES:**

 - [ 1 ] [TITLE] : [HTML_LINK]
 - [ 2 ] [TITLE] : [HTML_LINK]
 ...
 - [ N ] [TITLE] : [HTML_LINK]
```

## Analysis File Template Structure

The separate `*_analysis.md` file should contain:

```
# Cover Letter Analysis Report
**Generated:** [TIMESTAMP]  
**Job File:** [JOB_FILE_PATH]  
**Target:** [COMPANY] - [ROLE]

## GENERATION METADATA
**Model:** Claude [Sonnet 4/Haiku]  
**Input tokens:** [X] | **Output tokens:** [X] | **Total:** [X]  
**Estimated cost:** $[X.XX]  
**Session totals:** [X] tokens | $[X.XX]

## Document Size Metrics
| Section | Lines | Words | Notes |
|---------|-------|-------|-------|
| Header & Opening | X | X | Contact info, intro paragraph |
| Experience Section 1 | X | X | [Requirement title] |
| Experience Section 2 | X | X | [Requirement title] |
| Experience Section 3 | X | X | [Requirement title] |
| Closing & Signature | X | X | Final paragraph, signature block |
| **TOTAL DOCUMENT** | **X** | **X** | **Target: <50 lines, <600 words** |

## Job Requirements Coverage Analysis
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

## YAML Coverage Assessment
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
- **Length**: Target 350-400 words maximum (industry standard)
- **Priority**: Focus on REQUIRED experience first, include NICE TO HAVE only when strong matches exist
- **Specificity**: Pull experience titles directly from job posting requirements
- **Evidence**: Each bullet must include specific example from work and quantified result/outcome
- **Anti-Redundancy**: **NEVER repeat the opening achievement in experience sections - use different examples**
- **Gap Detection**: **FLAG any REQUIRED skills where YAML lacks sufficient supporting evidence**
- **User Notification**: Alert when YAML updates are needed for better coverage
- **Links**: Include supporting links from work_experience.yaml when available
- **Cultural Context**: Emphasize 20+ years Japanese engineering collaboration when relevant
- **Matching**: Use work_experience.yaml categories, keywords, and story_adaptability ratings to select best examples

## Enhanced Haiku Model Directives
When using `--haiku` flag, apply these additional requirements to match Sonnet 4 quality:

### Content Enhancement
- **Target Length**: 350-400 words (industry standard, vs default ~250 for basic)
- **Experience Sections**: Include 2-3 bullet points per section (focused and concise)
- **Technical Detail**: Expand technical descriptions and context
- **Quantified Results**: Always include specific metrics and outcomes

### Required Sections
- **LINKS AND REFERENCES**: Always include this section with 2+ relevant supporting links from work_experience.yaml
- **Source Footnotes**: Insert footnote flags [1], [2] within experience bullets when referencing supporting links
- **GENERATION METADATA**: Include cost and token tracking (already implemented)

### Quality Matching
- **Professional Language**: Use sophisticated phrasing and smooth transitions
- **Technical Depth**: Match Sonnet's level of technical detail and terminology
- **Experience Integration**: Provide nuanced matching of experiences to job requirements
- **Comprehensive Coverage**: Address all job requirements with specific examples

## Gap Flagging System
- **✅ WELL-SUPPORTED**: YAML has strong matching experience with quantified results
- **❌ INSUFFICIENT COVERAGE**: REQUIRED skill lacks adequate YAML evidence - UPDATE NEEDED
- **⚠️ NICE-TO-HAVE INCLUDED**: Optional skills where strong matches exist
- **📝 YAML UPDATE NEEDED**: Specific recommendations for missing experience entries

## Token Usage Tracking
The command tracks token usage and costs for each cover letter generation:

### Cost Calculation
- **Claude Sonnet 4**: $3.00 per million input tokens, $15.00 per million output tokens
- **Claude Haiku**: $0.25 per million input tokens, $1.25 per million output tokens (85% cost reduction)
- **Session tracking**: Cumulative tokens and costs across all generations
- **Per-generation tracking**: Specific costs for this cover letter creation
- **Timestamp**: UTC timestamp for generation audit trail

## Cost Optimization Options

### Model Selection
- **Sonnet 4** (default): Highest quality, comprehensive analysis (~$0.35-0.40 per letter)
- **Haiku + --no-analytics**: Fastest, most economical (~$0.05-0.08 per letter, 85% savings)
- **Haiku with analytics**: Balanced option (~$0.10-0.15 per letter, 65% savings)

### Usage Recommendations
- **High-stakes applications**: Use default Sonnet 4 with full analytics
- **Bulk generation**: Use `--haiku --no-analytics` for maximum cost efficiency
- **Quality review**: Use `--haiku` (with analytics) for cost-conscious quality assurance

---

# Experience Database Reference

## YAML Structure: work_experience.yaml

The `work_experience.yaml` file is the core database that powers intelligent experience matching. Each experience entry should follow this structure:

### Required Fields (MUST have for matching to work):
```yaml
- experience_id: EXP_XXX  # Unique identifier (e.g., EXP_001)
  category: [Category Name]  # One of: Industry Experience, Core Programming Languages, etc.
  primary_skill: [Main Skill]  # Primary skill/capability demonstrated
  experience_title: [Title]  # Concise title for this experience
  action_description: [Description]  # What you did (past tense, specific actions)
  quantified_results: [Results]  # Measurable outcomes achieved
  role: [Your Role]
  proficiency_level: [Expert|Advanced|Intermediate]  # Your skill level
  keywords: [list]  # Domain concepts, methodologies, high-level capabilities for job matching
  story_adaptability: [High|Medium|Low]  # How flexible this story is for different contexts
```

### Highly Recommended Fields (for better matching):
```yaml
  context:  # Where/when this happened
    company: [Company Name]
    timeframe: [Time Period]
    team_size: [number or null]
  situation_task: [Background]  # Problem/challenge you faced (sets up the story)
  narrative_hook: [One-liner]  # Catchy summary for cover letter opening
  tech_stack:  # Specific technologies/tools/frameworks used
    - [Technology 1]
    - [Framework 2] 
    - [Tool 3]
  supporting_links:  # Evidence/portfolio links
    - ref_number: [1-9]  # Use [1], [2] etc. inline in action_description or quantified_results
      title: [Link Title]
      url: [URL]
```

### Field Separation Guidelines

**CRITICAL: Avoid Content Overlap Between Fields**

#### `keywords:` - Domain Expertise & Business Concepts
**Purpose:** High-level capabilities, methodologies, domain knowledge for job requirement matching
**Include:**
- Business domains (autonomous vehicles, manufacturing systems, financial services)
- Methodologies & processes (V-model, FMEA, Agile, DevOps practices)  
- High-level technical capabilities (system architecture, sensor fusion, distributed systems)
- Leadership & management skills (technical leadership, team management, stakeholder management)
- Certifications & standards (TÜV certification, ISO compliance, safety standards)
- Business outcomes (patent development, market analysis, cost optimization)

**Examples:**
```yaml
keywords:
  - autonomous vehicles        # Domain
  - V-model methodology       # Process  
  - technical leadership      # Capability
  - sensor fusion            # High-level tech concept
  - patent development       # Business outcome
```

#### `tech_stack:` - Specific Technologies & Tools
**Purpose:** Concrete implementation tools, languages, frameworks, platforms
**Include:**
- Programming languages (C++17, Python, JavaScript, Rust)
- Frameworks & libraries (ROS2, React, Django, OpenCV, TensorFlow)
- Development tools (Docker, CMake, Git, Jira, Jenkins)
- Platforms & services (AWS, Azure, Ubuntu, Windows)
- Protocols & standards (CAN, TCP/IP, HTTP, MQTT)
- Databases & storage (PostgreSQL, MongoDB, Redis)

**Examples:**
```yaml
tech_stack:
  - C++17                    # Language
  - ROS2                     # Framework
  - Docker                   # Tool
  - AWS                      # Platform
  - CAN                      # Protocol
```

#### **Migration Rules:**
- **Remove from keywords:** Specific technologies, programming languages, tools → Move to `tech_stack`
- **Keep in keywords:** Domain expertise, business concepts, methodologies
- **No Duplication:** Each term appears in exactly ONE field

### Removed Fields (Schema Simplification):
The following fields have been removed for cleaner maintenance:
- `secondary_skills` → Content merged into `keywords` and `tech_stack`  
- `tags` → Content merged into `keywords`
- `stakeholders`, `region_context`, `environments`, `job_alignment`, `integration_scopes`, `validation_methods`, `metrics`, `impact_type` → Removed due to sparse usage

## Standard Engineering Role Archetypes

Use these standardized roles for consistent role clarity across all experience entries:

### **Leadership Roles** (Team/Project/Technical Direction)
- **Technical Lead** - Led technical direction for team/project
- **Engineering Manager** - Managed team of engineers  
- **Principal Engineer** - Senior technical authority/architecture decisions
- **Lead Architect** - Architected system design and technical strategy
- **Project Lead** - Led cross-functional project delivery
- **Team Lead** - Led small engineering team (3-8 people)

### **Architecture & Design Roles** (System/Technical Design)
- **System Architect** - Designed overall system architecture
- **Software Architect** - Architected software systems and frameworks
- **Solutions Architect** - Designed technical solutions for business problems
- **Platform Architect** - Architected platform/infrastructure systems

### **Senior Individual Contributor Roles** (High-Impact IC Work)
- **Senior Engineer** - Advanced individual contributor with mentoring
- **Staff Engineer** - High-impact individual contributor across teams
- **Principal Developer** - Lead developer on critical systems
- **Subject Matter Expert** - Domain expert consulted across teams
- **Technical Specialist** - Deep specialist in specific technology area

### **Individual Contributor Roles** (Direct Implementation)
- **Software Engineer** - Individual contributor on development team
- **Developer** - Individual software development work
- **Engineer** - General individual contributor engineering work
- **Research Engineer** - Individual contributor in research context

### **Collaborative/Support Roles** (Cross-team/Consultative)
- **Technical Consultant** - Provided technical guidance/recommendations
- **Integration Engineer** - Focused on system integration aspects
- **Platform Engineer** - Individual contributor to platform/infrastructure
- **DevOps Engineer** - Infrastructure and deployment automation
- **Field Engineer** - Customer-facing technical implementation

### **Research & Innovation Roles** (Investigation/Development)
- **Principal Investigator** - Led research initiative/study
- **Research Lead** - Led research team or project
- **Innovation Engineer** - Drove innovative technical solutions
- **Prototype Developer** - Built proof-of-concept systems

## Field Definition Rules

### Role Harmonization Requirements
- The `role` field must match the role stated in `narrative_hook` and `action_description`
- Example: If `role: Technical Lead`, then narrative_hook should start "**Led as Technical Lead**..."
- Example: If `role: Principal Engineer`, then action_description should include "**As Principal Engineer**, implemented..."
- This ensures consistency between structured data and narrative presentation
- All roles must come from the Standard Engineering Role Archetypes list above

### narrative_hook:
- **Purpose**: One-sentence elevator pitch / cover letter opener. Use a storytelling style.
- **Content**: Your role + #1 achievement + scale + business impact
- **Format**: **[Role] + [Action] + [Scale/Context] + [Single Most Impressive Business Outcome]**
- **Length**: 1 sentence, <30 words
- **Role Required**: MUST start with specific role from Standard Engineering Role Archetypes above
- **Impact Type**: High-level business outcome (revenue, market leadership, team scale) - NOT technical metrics
- **Example**: "**Led as Technical Lead** MLCC platform generating $30M+ sales while managing 25-engineer team through market leadership achievement [4]"

### situation_task:
- **Purpose**: Set the stage - what challenge needed solving?
- **Content**: Business context, constraints, why this was hard
- **Format**: The problem/opportunity that required your intervention
- **No numbers**: Save metrics for results
- **Example**: "Required ground-up development of testing platform following formal V-model processes to achieve market leadership"

### action_description:
- **Purpose**: What you specifically did (the "how") with role context
- **Content**: Use a storytelling style. Your methods, processes, decisions, leadership actions with role woven throughout
- **Format**: **[Role Context] + Specific verbs + technical approaches + management/individual scope**
- **Role Integration**: Weave role throughout - "As Lead Architect, designed...", "Managing team, implemented...", "Working as Senior Engineer, developed..."
- **No outcomes**: Save results for quantified_results
- **Include references**: Add [1], [2] where evidence supports specific actions
- **Example**: "**As Principal Engineer**, implemented ROS2 architecture [1], designed custom IDL for API generation, **led cross-team** FMEA analysis sessions"

### quantified_results:
- **Purpose**: Measurable proof of success beyond the narrative_hook
- **Content**: Technical metrics, performance improvements, certifications, patents, additional business outcomes
- **Format**: Specific metrics + context + validation
- **Include references**: Add [1], [2] for proven results
- **Avoid**: Repeating the main business impact already stated in narrative_hook
- **Example**: "Produced 9 patents filed with 6 issued [4], achieved 87.5% performance improvement (8→15 fps), obtained TÜV certification, delivered 1M+ devices/hour capability"

## Information Hierarchy Rules
- **Tier 1 (Hook)** → narrative_hook: Single biggest win that makes someone want to hire you
- **Tier 2 (Context)** → situation_task: Why this mattered / what made it challenging  
- **Tier 3 (Process)** → action_description: Your specific contributions and methods
- **Tier 4 (Proof)** → quantified_results: All the numbers that validate your success

## Anti-Redundancy Rules
- Each fact appears in only ONE field
- No metric should be repeated across fields
- Each field should add NEW information
- **narrative_hook gets the #1 business impact** (revenue, team size, market position)
- **quantified_results gets all other metrics** (technical performance, certifications, additional outcomes)
- If $30M revenue is in narrative_hook, don't repeat it in quantified_results

## Best Practices for Experience Entries
1. **Quantify Everything**: Use numbers, percentages, time saved, cost reduced
2. **Be Specific**: Name technologies, frameworks, methodologies used
3. **Front-load Impact**: Lead with your strongest achievement in narrative_hook
4. **Match Job Language**: Use keywords from job descriptions in your keywords list
5. **Provide Evidence**: Include supporting_links to portfolios, papers, or projects
6. **Link Evidence Inline**: Add [1], [2] etc. directly in text where that specific evidence applies
7. **Eliminate Redundancy**: Each fact should appear exactly once across all fields
8. **Use STAR Method**: Situation → Task → Action → Result flow across the four main fields

## Example Entry:
```yaml
- experience_id: EXP_001
  category: Industry Experience
  primary_skill: Autonomous Vehicle Systems Management
  experience_title: 3D Collision Alert System with Fleet Deployment
  context:
    company: PREACT TECHNOLOGIES
    timeframe: 2022-2024
    role: Engineering Manager
    team_size: null
  situation_task: Required Linux-based collision alert system advancement from proof-of-concept through integration and field deployment in pilot delivery van fleet while managing vendor relationships
  action_description: As Engineering Manager, managed sensor integration using ROS2 and FLASH LiDAR [1], implemented cloud connectivity via AWS for real-time data analysis, negotiated and executed $50k+ infrastructure vendor contracts
  quantified_results: Successfully deployed to 6-vehicle pilot fleet, achieved 87.5% performance improvement (8→15 fps) through ROS2 optimization [1]  
  proficiency_level: Expert
  keywords:
    # Domain expertise & business concepts (following separation guidelines)
    - collision detection
    - autonomous vehicles  
    - sensor fusion
    - real-time systems
    - fleet deployment
    - vendor management
    - contract negotiation
    - stakeholder management
    - project management
  story_adaptability: High
  narrative_hook: Engineering Manager who transformed crude vehicle collision detection demo into production 6-vehicle pilot fleet through 5 customer-facing phase gate demonstrations [1]
  tech_stack:
    # Specific technologies, tools & platforms (following separation guidelines)
    - ROS2
    - C++17
    - Ubuntu
    - Jetson
    - CAN
    - UDP
    - Docker
    - CMake
    - AWS
  supporting_links:
    - ref_number: 1
      title: Fleet Deployment Technical Documentation
      url: https://example.com/fleet-deployment
```

## Reference Numbering
- Reference numbers (`ref_number`) only need to be unique within each `experience_id`
- Use [ 1 ], [ 2 ], etc. inline in your YAML text fields where that evidence applies
- The cover letter generator will automatically renumber all references sequentially in the final output
- format the reference number callout with a space after the opening square bracket and a space before the closing bracket.