# AI Cover Letter & Resume Generator

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

*"The one thing worse than having to work is having to look for a job."*

**Frustrated by AI filters that block your resume before a human ever sees it?** This project flips the script—using AI to outmaneuver the ATS systems that filter out 88% of applicants. Instead of sending generic resumes into the void, you'll generate precision-targeted applications from a structured database of your experiences.

**The result?** I've cut application time by 85% (from 2-3 hours to 15 minutes), landed multiple interviews, and built a system that treats career documentation like code—structured, version-controlled, and maintainable.

**This is "Career as Code"**: one source of truth that generates tailored cover letters, ATS-friendly resumes, and interview prep materials in minutes.

📖 **[Read the full story](#why-this-exists---full-article)** about how this system was built and why it works.

---

## Table of Contents

- [⚡ Quick Start](#-quick-start)
- [🚀 Features](#-features)
- [🛠️ Commands](#-commands)
- [📁 File Structure](#-file-structure)
- [📖 Why This Exists - Full Article](#-why-this-exists---full-article)
- [📋 Version Information](#-version-information)

---

## ⚡ Quick Start

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

---

## 🚀 Features

### Dual Generation System
- **Cover Letters**: Tailored to specific job descriptions with RAG-based matching
- **Resumes**: Multiple formats (standard, technical, executive, academic) with role targeting

### 📊 YAML Database Architecture
- **Consolidated Experience Database**: `work_experience.yaml` with 28+ structured experiences
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

---

## 🛠️ Commands

| Command | Purpose | Key Options |
|---------|---------|-------------|
| `write_cover_letter` | Generate tailored cover letters | `--job_file`, `--haiku`, `--no-analytics` |
| `write_resume` | Generate multi-format resumes | `--format`, `--target_role`, `--emphasis`, `--length` |
| `review_experience` | Analyze and improve experience database | `--experience_id`, `--check-redundancy`, `--suggest-improvements` |

---

## 📁 File Structure

```
├── source_materials/
│   ├── work_experience.yaml    # Detailed experience database (28+ entries)
│   ├── work_history.yaml       # Employment timeline & resume data
│   └── personal_info.md        # Contact information
├── job_desc/                   # Job description files
├── output/                     # Generated documents (cover letters & resumes)
├── article/                    # Article images and resources
├── docs/                       # Documentation
└── .claude/commands/           # Command definitions
    ├── write_cover_letter.md
    ├── write_resume.md
    └── review_experience.md
```

---

## 📖 Why This Exists - Full Article

# Spear Resuming - a Fresh AI Perspective

*"The one thing worse than having to work is having to look for a job."*

Unemployed with too much time on my hands and a resume that says "I'm a problem-solver," I decided to use AI to leverage this job hunt. The result? A system that helped me land many interviews—and I hope it can do the same for you.

## Man vs. Machine — Or Man WITH Machine?

<div>
  <img src="./article/JohnHenry_RacingAgainst_AI.powered.steam.shovel.png" alt="A floating image" style="width: 300px; height: 200px; float: left; margin-right: 15px; margin-bottom: 10px;">
</div>

Man against machine—it can feel like stepping into The Matrix. The system seems stacked against you, scanning, filtering, shutting you out. But here's the twist: the real power comes when you learn to bend the rules from inside—using AI to outmaneuver AI.

Because today, it's not just recruiters you need to impress. Your first opponent is often an ATS (Applicant Tracking System)—a digital firewall that scans resumes and filters out up to 88% of applicants before a human ever sees them. That's exactly where I KEPT GETTING stuck—until I flipped the script. I stopped seeing AI as the gatekeeper and started using it as my amplifier—building targeted resumes and cover letters that finally broke through.


## "Spear Resuming": The Targeted Approach

<div>
  <img src="./article/SpearResume.png" alt="A floating image" style="width: 150px; height: 200px; float: right; margin-right: 15px; margin-bottom: 10px;">
</div>

Most resumes are spam: generic, bloated, and destined for the discard pile. But what if you could *spear resume* instead? Precision-targeted applications that read like they were written for one job and one job only.

That's what I built: a system that takes structured work experience data, fuses it with AI-powered targeting, and produces professional documents that overcome the ATS filter and resonate with hiring managers—in minutes, not hours.


## The Problem: Career Documentation Chaos

For years, every job application felt like chaos. I'd dig through old resumes, trying to recall quantified results, patch together phrasing, and end up with inconsistent, stitched-together documents.

Like many engineers, I had decades of rich experience—autonomous vehicles, manufacturing automation, AI, international collaboration—but it was scattered across Word docs, LinkedIn snippets, and fading memories.

The result? Generic applications that IMPRESSED neither ATS systems nor recruiters. Worse, I was underselling myself. My resumes often failed to show how I contributed or what measurable impact I delivered. Saying "I worked on Project X" wasn't enough. Without context and quantified results, it read like filler, not proof. Breaking experiences into Hook, Context, Process, and Proof later made these weaknesses abundantly clear—and showed me exactly which experiences were too weak to include without more work, and which were strong enough to anchor a resume.

That weakness carried into interviews too. I would jump straight into solutions without setting the stage—missing the chance to tell a compelling story of challenge, action, and outcome. And that's the bigger picture: the problem isn't just getting a positive reply in your inbox. The real test is the interview room, where you need powerful, structured stories that demonstrate your value. This framework supports that.

I tried off-the-shelf resume tools, but they felt shallow—expensive, generic, and incomplete. If AI was already powering those systems, why couldn't I build my own version to handle resume customization, cover letter generation, and even interview prep?

---

## The Insight: Work Experience as a Story Framework

<div>
  <img src="./article/4xTIER.png" alt="A floating image" style="width: 270px; height: 200px; float: left; margin-right: 15px; margin-bottom: 10px;">
</div>

I realized I needed to begin with the end in mind. The goal wasn't just another cover letter — it was a story powerful enough to carry me through an ATS filter and resonate with a hiring manager.

That shift changed everything. Instead of juggling a cache of slightly different resumes for different jobs, I stepped back and looked at the bigger picture. I needed a story framework for my work history — a structured way to translate raw experience into compelling, reusable building blocks.

Here's the truth: AI can't help you if you don't give it quality input. It's the classic garbage in, garbage out problem. To get real results, I had to supply clear, well-structured data — not a mess of ad-hoc edits.

So I extracted my qualifications and broke them down into a database of experiences. Each one became a self-contained, well-defined qualification I could pull from. And to make those experiences powerful, I built them around four tiers:

Tier 1 (Hook) → narrative_hook: The single biggest win that makes someone want to hire you

Tier 2 (Context) → situation_task: Why this mattered / what made it challenging

Tier 3 (Process) → action_description: Your specific contributions and methods

Tier 4 (Proof) → quantified_results: The numbers that validate your success


## How the 4 tiers work

* Improved pass-through rates
* One source of truth
* Tailored, keyword-matched resumes

---

This isn't just about beating ATS—it's about engineering your professional story in the clearest and most favorable light possible.

---


### 1) NARRATIVE HOOK – Single biggest win that makes someone want to hire you

* **Purpose**: One-sentence elevator pitch / cover letter opener in a storytelling style.
* **Content**: Role + #1 achievement + scale + business impact.
* **Format**: **\[Role] + \[Action] + \[Scale/Context] + \[Single Most Impressive Business Outcome]**.
* **Length**: One sentence, <30 words.
* **Impact**: High-level business outcome (revenue, market leadership, team scale) — not technical metrics.
* **Example**: **Led as Technical Lead** MLCC platform generating \$30M+ sales while managing 25-engineer team through market leadership achievement \[4].
* **Note**: The hook can sometimes look redundant—but it's intentional. Your most powerful hook, when aligned with the job you're applying for, is often the first thing you highlight in a cover letter. Leading with it gives you narrative control: it sets the frame for how the recruiter or hiring manager understands the rest of your story.

### 2) SITUATION TASK – Why this mattered / what made it challenging

* **Purpose**: Set the stage — what challenge needed solving?
* **Content**: Business context, constraints, why it mattered.
* **Format**: The problem/opportunity that required intervention.
* **No numbers**: Save metrics for results.
* **Example**: Required ground-up development of testing platform following formal V-model processes to achieve market leadership.

### 3) ACTION DESCRIPTION – Your specific contributions and methods

* **Purpose**: The "how" — what you specifically did.
* **Content**: Storytelling style with role integrated. Methods, processes, leadership, and technical actions.
* **Format**: **\[Role Context] + Verbs + Actions**.
* **Role Integration**: Weave role throughout — "As Lead Architect, designed...", "Managing team, implemented...", "Working as Senior Engineer, developed..."
* **No outcomes**: Save results for quantified\_results.
* **Example**: **As Principal Engineer**, implemented ROS2 architecture \[1], designed custom IDL for API generation, **led cross-team** FMEA analysis sessions.

### 4) QUANTIFIED RESULTS – The numbers that validate your success

* **Purpose**: Proof of success beyond the hook.
* **Content**: Technical metrics, performance improvements, certifications, patents, outcomes.
* **Format**: Metrics + context + validation.
* **Include references**: Add \[1], \[2] for proven results.
* **Avoid**: Repeating the main business impact already stated in narrative\_hook.
* **Example**: Produced 9 patents filed with 6 issued \[4], achieved 87.5% performance improvement (8→15 fps), obtained TÜV certification, delivered 1M+ devices/hour capability.

---

## Information Hierarchy Rules (Consolidated)

* **Tier 1 (Hook)** → narrative\_hook: Single biggest win that makes someone want to hire you
* **Tier 2 (Context)** → situation\_task: Why this mattered / what made it challenging
* **Tier 3 (Process)** → action\_description: Your specific contributions and methods
* **Tier 4 (Proof)** → quantified\_results: All the numbers that validate your success

## Anti-Redundancy Rules

* Each fact appears in only ONE field
* No metric should be repeated across fields
* Each field should add NEW information
* **narrative\_hook gets the #1 business impact** (revenue, team size, market position)
* **quantified\_results gets all other metrics** (technical performance, certifications, additional outcomes)
* If \$30M revenue is in narrative\_hook, don't repeat it in quantified\_results



## The Solution: Work Experience as Structured Data

The solution was obvious in hindsight: **treat experience like data.** One living, structured source of truth to generate resumes, cover letters, and interview scripts. No more multiple, conflicting resumes. No more blank-page syndrome. I call it a **Career RAG System**—Retrieval-Augmented Generation, repurposed for career management.

I kept it simple: a YAML file containing a **list** of experiences in a consistent format:

```yaml
experience_id: EXP_XXX # Unique identifier (e.g., EXP_001)
category: [Category Name] # One of: Industry Experience, Core Programming Languages, etc.
primary_skill: [Main Skill] # Primary skill/capability demonstrated
experience_title: [Title] # Concise title for this experience
action_description: [Description] # What you did (past tense, specific actions)
quantified_results: [Results] # Measurable outcomes achieved
role: [Your Role]
proficiency_level: [Expert|Advanced|Intermediate]
keywords: [list]
story_adaptability: [High|Medium|Low]
context:
  company: [Company Name]
  timeframe: [Time Period]
  team_size: [number or null]
situation_task: [Background]
narrative_hook: [One-liner]
tech_stack: [Tools/Frameworks]
```

## The Architecture: YAML + AI = Career Engine

### Core Components

**1. Experience Database** (`work_experience.yaml`)

* 28+ structured entries
* Quantified results, skills, adaptability ratings
* Keywords and tech stacks for ATS and recruiter alignment

**2. Career Timeline** (`work_history.yaml`)

* Company progression, education, certifications
* Resume formatting preferences
* Career-phase summaries

**3. AI-Powered Generation**

* Targeted cover letters with job-description keywords
* Multiple resume formats (ATS-friendly, technical, exec)
* Fit/gap analysis
* Interview prep docs

**Why YAML?**

* Human-readable
* Structured and consistent
* Version-controlled
* AI-ready for parsing

---

## Real-World Results

**Before**

* 2–3 hours per application
* Conflicting resume versions
* Generic targeting
* High ATS rejection rates

**After**

* \~15 minutes per application
* One source of truth
* Tailored, keyword-matched resumes
* Improved pass-through rates

---

## Key Technical Insights

**1. Granularity is everything**

```yaml
- experience_id: EXP_020
  situation_task: "Required autonomous robotic workcell for regression testing..."
  action_description: "Managed 20×20m autonomous ROS-based robotic workcell..."
  quantified_results: "Achieved precision trajectory control in production tests..."
  story_adaptability: High
  keywords: [multi-robot coordination, ROS, autonomous systems]
  tech_stack: [ROS, OptiTrack, LQR controller]
```

**2. Separate content from presentation**

* *Content*: Relevant experiences
* *Formatting*: ATS-safe resumes vs. human-readable design
* *Targeting*: Keyword emphasis for each role

**3. Use AI as filter, not fabricator**
AI doesn't invent your story—it curates and emphasizes what matters.

---

## Practical Implementation

```bash
# Generate a tailored cover letter
write_cover_letter --job_file=job_desc/Company_Role.md

# Create a role-specific resume
write_resume --target_role="Senior AI Engineer" --format=technical --emphasis=ai

# Review and improve experience database quality
review_experience --check-redundancy --suggest-improvements
```

**Evolution**

* v0.1 → simple resume generator
* v0.5 → added cover letter targeting
* v1.0 → full YAML consolidation
* Today → AI-driven with ATS alignment

---

## Lessons Learned

**What Works**

* Quantified results
* Story adaptability scores
* Keyword separation (domain vs. tech tools)
* Git versioning of career progression
* Open-source iteration

**What Doesn't**

* Over-engineering schemas
* Generic content
* Static templates
* Manual updates

---

## The Bigger Picture: Career as Code

We already version control code, track deployments, automate testing. Why not apply the same discipline to our careers?

* Version-controlled experience DB
* Automated, ATS-proof documents
* Quality metrics & gap analysis
* Continuous integration of new skills

This isn't just about beating ATS—it's about engineering your professional story.

---

## Results That Matter

Since adopting this approach:

* 15+ hyper-targeted applications
* Application time cut by 85%
* Higher recruiter response rates
* Authentic, consistent messaging

Even better: structuring my experiences surfaced growth patterns I never noticed before.

---

## Open Source and Next Steps

**Highlights**

* YAML schema for work experiences
* Claude Code commands
* ATS-safe formatting
* Gap analysis tools
* Docs and examples

**Future Directions**

* Automated interview prep
* Skills tracking over time
* Job board API hooks
* Collaborative filtering for relevance

---

## The Meta Lesson

The act of structuring your experience is **as valuable as the documents themselves**. It's not just about getting past the firewall—it's about clarity, credibility, and control in an age where AI stands between you and your ideal position.

---

## Try It Yourself

1. Start small: structure one project
2. Add numbers: metrics make stories real
3. Iterate your schema for your field
4. Automate step by step
5. Version control everything

You're not just writing resumes. You're engineering a system that adapts to the AI age.

---

*How are you navigating the AI disruption in hiring? Have you tried structuring your experiences? I'd love to hear in the comments.*

---

**Tags:** AI · Career Development · RAG · Automation · ATS · Open Source · Future of Work

---

**About the Author**

Spencer Barrett is a systems engineer with 20+ years in robotics, AI-accelerated development, and international collaboration. He believes the future of career success lies in learning to leverage machines—not fight them.

---

## 📋 Version Information

Current Version: **1.0.0**

This project follows [Semantic Versioning](https://semver.org/) with [PEP 440](https://peps.python.org/pep-0440/) pre-release tags. See [CHANGELOG.md](CHANGELOG.md) for detailed release notes.
