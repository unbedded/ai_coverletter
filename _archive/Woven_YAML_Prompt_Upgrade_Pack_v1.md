# Woven Cover-Letter Data & Prompt Upgrade — **Claude Code Task Pack (v1)**
**Date:** 2025‑09‑01 • **Author:** Spencer + Deep Thought • **Target repo:** your local project containing `work_experience.yaml`

> Paste this entire document into **Claude Code**. It contains goals, rationale, exact tasks, and patch-ready content so Claude can generate the scripts/changes and provide CLI commands you can run.

---

## 🎯 Goals (what to change & why)
**Motivation:** Letter B read “listy” and ATS‑ish, while **Letter A** landed better with humans: crisp hook, concrete outcomes (e.g., *six driverless vans*), and visible integration wins (ROS/CAN/telemetry, 8→15 fps). We’ll upgrade the **YAML data model** so future AI outputs combine **ATS coverage** *and* **impact narrative**.

**Key outcomes**
- Make results **machine‑parsable** and **human‑readable** (normalize metrics).
- Encode **integration/test context** (ROS2 nodes, CAN decoding, SIL/HIL/bench/track) for richer proof bullets.
- Add **job_alignment** to steer generation toward Woven’s stack (ROS2/C++/Linux/CAN/HIL/CI).
- Preserve truthfulness: **do not change domain standards** claims (e.g., keep IEC 61010 where it belongs). *(Per Spencer: skip the prior “High‑Impact #2” suggestion.)*
- Fold in key wins from **Letter A** (six vans deployed; 8→15 fps; ROS/CAN/telemetry story).

---

## 🧱 Schema upgrades (add these optional fields)
Claude: extend each `experience` item with these fields **if missing**. Do **not** delete existing fields; only add/normalize.

```yaml
# New optional fields to enrich generation
tech_stack:            # ["ROS2","C++17","Linux","Jetson","Docker","CMake","CAN","UDP","DBC","PTP"]
validation_methods:    # ["SIL","HIL","Bench","Closed-course","On-vehicle"]
integration_scopes:    # ["CAN decoding","sensor time-sync","node graph bring-up","telemetry dashboards"]
environments:          # ["Ubuntu 22.04","Jetson Orin","STM32 (FreeRTOS)"]
job_alignment:         # keywords tailored to the Woven role (see below)
impact_type:           # ["performance","quality","safety","cost","schedule","integration"]
metrics:               # normalized list of key numbers (see pattern below)
stakeholders:          # ["vehicle integration","safety","test ops","vendors"]
region_context:        # ["Japan","US","India"]
narrative_hook:        # 1–2 sentences that a human would care about first
```

**Normalized metrics pattern** (machine‑friendly, keep units explicit):
```yaml
metrics:
  - name: "Throughput"
    unit: "units/hour"
    baseline: 150000
    result: 1000000
    multiple: 6.67
    delta_percent: 567
  - name: "Frame rate"
    unit: "fps"
    baseline: 8
    result: 15
    delta_percent: 87.5
```

**Extraction hints for generators** (store once at top‑level if you have a config section, or keep handy in your prompt):
```yaml
result_patterns:
  - "X -> Y (~Z×, +P%)"
  - "reduced X from A to B (-P%)"
  - "improved X from A to B (+P%)"
  - "achieved latency <= L ms / jitter <= J ms"
  - "brought up N vehicles / M sites in T weeks"
  - "raised test pass rate from A% to B% (ΔPp)"
```

---

## 🧭 Woven role alignment keywords (for `job_alignment`)
Use a compact set to guide cover‑letter generation:
```
ROS2, C++, Linux, CAN, DBC, time-sync (PTP/Chrony), telemetry, CI/CD, Docker,
HIL/SIL/bench→track handoff, on‑vehicle bring‑up, sensor fusion, Euro NCAP exposure
```

---

## ✍️ Narrative lessons from **Letter A** (bake into YAML via `narrative_hook` + metrics)
- **Hook with outcome:** “Brought up **6 driverless vans**; improved perception **8→15 fps** via ROS2 pipeline tuning and CAN time‑sync.”
- **Integration story beats:** ROS2 nodes + CAN decoding + GPS/PTP time‑sync + telemetry → measurable stability/latency gains.
- **Keep bullets proof‑first;** move tool names to `tech_stack` and test context to `validation_methods`.

---

## 🧩 Entry‑specific patch snippets
Claude: for **each snippet below**, **apply only if** `experience_id` exists. Otherwise, skip without error. Merge with existing content; don’t duplicate facts.

### EXP_001 — On‑vehicle bring‑up (collision alert)
```yaml
- experience_id: "EXP_001"
  narrative_hook: "Brought up a pilot fleet of 6 driverless vans; tuned perception 8→15 fps by optimizing ROS2 node graph, CAN decoding, and telemetry feedback loops."
  tech_stack: ["ROS2","C++17","Ubuntu","Jetson","CAN","UDP","Docker","CMake","AWS"]
  validation_methods: ["Bench","SIL","On-vehicle"]
  integration_scopes: ["CAN decoding","sensor time-sync","node graph bring-up","telemetry dashboards"]
  job_alignment: ["ROS2","Linux","C++","CAN","on-vehicle bring-up","CI/CD"]
  impact_type: ["integration","performance"]
  metrics:
    - name: "Frame rate"
      unit: "fps"
      baseline: 8
      result: 15
      delta_percent: 87.5
    - name: "Vehicles deployed"
      unit: "count"
      result: 6
```

### EXP_013 — Automotive comms unification
```yaml
- experience_id: "EXP_013"
  narrative_hook: "Unified high‑speed CAN (DBC) and Ethernet sensors into time‑aligned ROS2 topics for real‑time validation."
  action_description: "Decoded CAN (DBC‑based) for speed/brake/steer; integrated GPS time‑sync (PTP/Chrony) and UDP/SOME‑IP sensors into ROS2 pipelines."
  tech_stack: ["ROS2","DBC","PTP","UDP","SOME/IP","Python tooling"]
  validation_methods: ["Bench","HIL"]
  impact_type: ["integration","quality"]
```

### EXP_018 — Throughput scaling (MLCC tester)
```yaml
- experience_id: "EXP_018"
  narrative_hook: "Scaled production throughput substantially via distributed control and high‑speed I/O."
  quantified_results: "Scaled MLCC tester throughput from 150k/hr to ~1.0M/hr (~6.7×, +567%); served as principal inventor on the Third Dynamics™ keystone patent."
  tech_stack: ["Real-time control","distributed controllers","high-speed I/O"]
  impact_type: ["performance","scale"]
  metrics:
    - name: "Throughput"
      unit: "units/hour"
      baseline: 150000
      result: 1000000
      multiple: 6.67
      delta_percent: 567
```

### EXP_002 — AEB/VRU testing
```yaml
- experience_id: "EXP_002"
  narrative_hook: "Expanded AEB VRU test coverage and quantified detection quality under Euro NCAP‑like scenarios."
  validation_methods: ["HIL","Closed-course","Bench"]
  impact_type: ["safety","quality"]
  metrics:
    - name: "False positives"
      unit: "rate"
      baseline: null
      result: null
    - name: "Scenario coverage"
      unit: "count"
      result: null
```

### EXP_020 — SLAM workcell
```yaml
- experience_id: "EXP_020"
  narrative_hook: "Improved robotic workcell precision and cycle time with SLAM‑based calibration."
  impact_type: ["quality","performance"]
  metrics:
    - name: "Repeatability"
      unit: "mm"
      result: null
    - name: "Cycle time"
      unit: "seconds"
      baseline: null
      result: null
```

### EXP_027 / EXP_003 — AI‑assisted dev & CI
```yaml
- experience_id: "EXP_027"
  narrative_hook: "Automated tests and CI pipelines to accelerate safe iteration."
  tech_stack: ["pytest","CTest","GitHub Actions","Docker","colcon"]
  impact_type: ["quality","schedule"]
- experience_id: "EXP_003"
  narrative_hook: "Built AI‑assisted workflows with reproducible prompts and regression tests."
  tech_stack: ["prompt tooling","YAML","OpenAI/Anthropic APIs"]
```

> **Note:** Do **not** alter domain safety standards (e.g., IEC 61010) claims. Only clarify when already true. *(Requested by Spencer.)*

---

## 🛠️ Tasks for Claude Code (create scripts + CLI)
Claude: generate the following in the repo root (paths may be adjusted to your layout).

### 1) Script: `scripts/upgrade_experience_yaml.py`
**Purpose:** apply schema upgrades, merge patch snippets, normalize metrics, and back up original.

**Requirements**
- Python 3.8+
- `pyyaml`

**Behavior**
- Input: `--in data/work_experience.yaml`
- Output (in‑place by default) with a safety backup: `data/work_experience.yaml.bak`
- Idempotent: running twice should not duplicate fields.

**CLI**
```bash
python scripts/upgrade_experience_yaml.py --in data/work_experience.yaml --out data/work_experience.yaml
```

**Implementation sketch (high‑level):**
1. Load YAML as list/dict.
2. For each `experience` item, ensure new fields exist (empty or inferred).
3. Merge patch blocks above **by `experience_id`** when present.
4. Normalize any free‑text “A→B” metrics into `metrics` objects when possible (regex).
5. Write `*.bak` then write the updated YAML.

### 2) Script: `scripts/validate_yaml.py`
- Validate required shape (no malformed YAML, fields are proper types).
- Option: `--strict` to fail on unknown keys.

**CLI**
```bash
python scripts/validate_yaml.py --in data/work_experience.yaml --strict
```

---

## 🧪 Quick test plan
1. Run the upgrader:
   ```bash
   python scripts/upgrade_experience_yaml.py --in data/work_experience.yaml --out data/work_experience.yaml
   ```
2. Validate:
   ```bash
   python scripts/validate_yaml.py --in data/work_experience.yaml --strict
   ```
3. Regenerate Letter B with the **new prompt** (below). Confirm:
   - ~250–400 words, human‑first hook, **three proof bullets**, and a clear CTA.
   - Uses `narrative_hook`, `metrics`, `validation_methods`, `integration_scopes`.
   - Keeps safety standards truthful (no substitutions).

---

## 🧠 Updated **generation prompt** for cover letters
> Use this as your Claude **system** (or “instructions”) prompt when generating a cover letter from the YAML.

```
You are an expert cover-letter generator for engineering roles.
Write a concise (250–400 words) letter that blends ATS coverage with a human, outcome-first narrative.

DATA MODEL HINTS
- Prefer these fields when present: narrative_hook, tech_stack, validation_methods, integration_scopes, environments, job_alignment, metrics, stakeholders, region_context.
- Use metrics in normalized form and present results like: “A → B (~×, +%).”
- Pull exactly 3 proof bullets; each must contain an outcome (number or concrete result) and a short “how.”
- Use job_alignment to map keywords to the role (e.g., ROS2/C++/Linux/CAN/HIL/CI).
- If a metric value is missing, do not hallucinate; omit or generalize.
- Preserve domain standards truthfully; do NOT alter IEC 61010 / ISO 26262 claims unless explicitly stated in the data.

STYLE
- Lead with `narrative_hook` (or craft one from data).
- Keep tool names out of the hook; use them in bullets.
- Close with a low-friction CTA tied to the team’s near-term priorities (e.g., e‑Palette bring-up).

OUTPUT SHAPE
- Greeting line to the company or team.
- 1 short hook paragraph.
- 3 bullets (outcome → how → stack/context).
- 1 closing paragraph with CTA and links (if available).
```

---

## 🧾 Example “compose” call (Claude user message)
Paste this as your user prompt when you want the letter generated:

```
Role: Software Integration Engineer — driverless e-Palette @ Woven by Toyota
Company keywords: ROS2, C++, Linux, CAN, DBC, PTP/Chrony, CI/CD, Docker, HIL/SIL, on-vehicle bring-up, telemetry
Use the attached YAML (post-upgrade). Write 250–400 words.

Remember to:
- Start with narrative_hook if present.
- Include exactly three proof bullets tied to outcomes and how they were achieved.
- If metrics exist (e.g., 6 vehicles, 8→15 fps), use the “A → B (~×, +%)” format.
- Keep standards truthful—do not change IEC 61010/other standards unless the data states it.
- End with a CTA about discussing e‑Palette bring-up priorities and 90-day ramp.
```

---

## ✅ Acceptance checklist
- [ ] YAML upgrades applied with backup `.bak` created.
- [ ] No hallucinated standards; **IEC 61010** etc. unchanged unless already true.
- [ ] `narrative_hook` present on key entries (EXP_001/013/018…).
- [ ] Metrics normalized where available; no duplicate facts.
- [ ] New prompt used; new Letter B shows human‑first hook + 3 proof bullets.
- [ ] Links are public (no LinkedIn overlay) where used.

---

## 🧵 Rollback
If needed:
```bash
cp data/work_experience.yaml.bak data/work_experience.yaml
```

---

## 📌 Notes for Claude
- Be conservative: only write facts present in the YAML.
- If an `experience_id` from patches doesn’t exist, skip silently.
- Preserve original ordering unless you must append new keys.
- Keep diffs small and idempotent.
