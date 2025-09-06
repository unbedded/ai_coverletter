#!/usr/bin/env python3
"""
YAML Experience Upgrade Script
Applies schema enhancements and patch snippets to work_experience.yaml
"""

import yaml
import argparse
import shutil
import re
from pathlib import Path
from typing import Dict, List, Any, Optional

def load_yaml(file_path: str) -> Dict[str, Any]:
    """Load YAML file safely"""
    with open(file_path, 'r', encoding='utf-8') as f:
        return yaml.safe_load(f)

def save_yaml(data: Dict[str, Any], file_path: str) -> None:
    """Save YAML file with proper formatting"""
    with open(file_path, 'w', encoding='utf-8') as f:
        yaml.dump(data, f, default_flow_style=False, sort_keys=False, 
                 allow_unicode=True, width=120, indent=2)

def create_backup(file_path: str) -> str:
    """Create backup file"""
    backup_path = f"{file_path}.bak"
    shutil.copy2(file_path, backup_path)
    print(f"✅ Backup created: {backup_path}")
    return backup_path

def normalize_metrics(text: str) -> List[Dict[str, Any]]:
    """Extract and normalize metrics from text"""
    metrics = []
    
    # Pattern: "X to Y (Z% improvement)" or "X→Y"
    patterns = [
        r'(\d+(?:,\d+)*(?:\.\d+)?)(?:k|K)?(?:/hr)?.*?to.*?(\d+(?:,\d+)*(?:\.\d+)?)(?:k|K)?(?:/hr)?.*?\((\d+)%',
        r'(\d+(?:,\d+)*(?:\.\d+)?)(?:k|K)?.*?→.*?(\d+(?:,\d+)*(?:\.\d+)?)(?:k|K)?',
        r'from (\d+(?:,\d+)*(?:\.\d+)?)(?:k|K)?.*?to (\d+(?:,\d+)*(?:\.\d+)?)(?:k|K)?'
    ]
    
    for pattern in patterns:
        matches = re.finditer(pattern, text, re.IGNORECASE)
        for match in matches:
            try:
                baseline = float(match.group(1).replace(',', ''))
                result = float(match.group(2).replace(',', ''))
                
                # Handle k/K suffix
                if 'k' in match.group(1).lower() or 'K' in match.group(1):
                    baseline *= 1000
                if 'k' in match.group(2).lower() or 'K' in match.group(2):
                    result *= 1000
                    
                delta_percent = round(((result - baseline) / baseline) * 100, 1) if baseline > 0 else 0
                multiple = round(result / baseline, 2) if baseline > 0 else 0
                
                metric = {
                    "name": "Performance metric",
                    "unit": "units/hour" if "/hr" in text else "units",
                    "baseline": int(baseline),
                    "result": int(result),
                    "multiple": multiple,
                    "delta_percent": delta_percent
                }
                metrics.append(metric)
                break
            except (ValueError, IndexError):
                continue
                
    return metrics

def add_schema_fields(experience: Dict[str, Any]) -> Dict[str, Any]:
    """Add new schema fields if missing"""
    new_fields = {
        'tech_stack': [],
        'validation_methods': [],
        'integration_scopes': [],
        'environments': [],
        'job_alignment': [],
        'impact_type': [],
        'metrics': [],
        'stakeholders': [],
        'region_context': [],
        'narrative_hook': ""
    }
    
    for field, default_value in new_fields.items():
        if field not in experience:
            experience[field] = default_value
    
    return experience

def apply_patch_snippets(experiences: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
    """Apply specific patch snippets by experience_id"""
    
    patches = {
        "EXP_001": {
            "narrative_hook": "Brought up a pilot fleet of 6 driverless vans; tuned perception 8→15 fps by optimizing ROS2 node graph, CAN decoding, and telemetry feedback loops.",
            "tech_stack": ["ROS2","C++17","Ubuntu","Jetson","CAN","UDP","Docker","CMake","AWS"],
            "validation_methods": ["Bench","SIL","On-vehicle"],
            "integration_scopes": ["CAN decoding","sensor time-sync","node graph bring-up","telemetry dashboards"],
            "job_alignment": ["ROS2","Linux","C++","CAN","on-vehicle bring-up","CI/CD"],
            "impact_type": ["integration","performance"],
            "metrics": [
                {
                    "name": "Frame rate",
                    "unit": "fps",
                    "baseline": 8,
                    "result": 15,
                    "delta_percent": 87.5
                },
                {
                    "name": "Vehicles deployed",
                    "unit": "count",
                    "result": 6
                }
            ]
        },
        "EXP_013": {
            "narrative_hook": "Unified high‑speed CAN (DBC) and Ethernet sensors into time‑aligned ROS2 topics for real‑time validation.",
            "action_description": "Decoded CAN (DBC‑based) for speed/brake/steer; integrated GPS time‑sync (PTP/Chrony) and UDP/SOME‑IP sensors into ROS2 pipelines.",
            "tech_stack": ["ROS2","DBC","PTP","UDP","SOME/IP","Python tooling"],
            "validation_methods": ["Bench","HIL"],
            "impact_type": ["integration","quality"]
        },
        "EXP_018": {
            "narrative_hook": "Scaled production throughput substantially via distributed control and high‑speed I/O.",
            "quantified_results": "Scaled MLCC tester throughput from 150k/hr to ~1.0M/hr (~6.7×, +567%); served as principal inventor on the Third Dynamics™ keystone patent.",
            "tech_stack": ["Real-time control","distributed controllers","high-speed I/O"],
            "impact_type": ["performance","scale"],
            "metrics": [
                {
                    "name": "Throughput",
                    "unit": "units/hour",
                    "baseline": 150000,
                    "result": 1000000,
                    "multiple": 6.67,
                    "delta_percent": 567
                }
            ]
        },
        "EXP_002": {
            "narrative_hook": "Expanded AEB VRU test coverage and quantified detection quality under Euro NCAP‑like scenarios.",
            "validation_methods": ["HIL","Closed-course","Bench"],
            "impact_type": ["safety","quality"]
        },
        "EXP_020": {
            "narrative_hook": "Improved robotic workcell precision and cycle time with SLAM‑based calibration.",
            "impact_type": ["quality","performance"]
        },
        "EXP_027": {
            "narrative_hook": "Automated tests and CI pipelines to accelerate safe iteration.",
            "tech_stack": ["pytest","CTest","GitHub Actions","Docker","colcon"],
            "impact_type": ["quality","schedule"]
        },
        "EXP_003": {
            "narrative_hook": "Built AI‑assisted workflows with reproducible prompts and regression tests.",
            "tech_stack": ["prompt tooling","YAML","OpenAI/Anthropic APIs"]
        }
    }
    
    for experience in experiences:
        exp_id = experience.get('experience_id')
        if exp_id in patches:
            patch_data = patches[exp_id]
            for key, value in patch_data.items():
                if key not in experience or not experience[key]:
                    experience[key] = value
                elif isinstance(value, list) and isinstance(experience[key], list):
                    # Merge lists, avoiding duplicates
                    existing_items = []
                    for item in experience[key]:
                        if isinstance(item, (str, int, float)):
                            existing_items.append(item)
                    
                    for item in value:
                        if isinstance(item, (str, int, float)) and item not in existing_items:
                            experience[key].append(item)
    
    return experiences

def upgrade_yaml(input_file: str, output_file: str) -> None:
    """Main upgrade function"""
    print(f"🔧 Upgrading YAML: {input_file}")
    
    # Create backup
    if input_file == output_file:
        create_backup(input_file)
    
    # Load existing data
    data = load_yaml(input_file)
    
    if 'experiences' not in data:
        print("❌ No 'experiences' section found in YAML")
        return
    
    experiences = data['experiences']
    print(f"📊 Processing {len(experiences)} experience entries")
    
    # Apply schema upgrades
    for i, experience in enumerate(experiences):
        print(f"  Processing {experience.get('experience_id', f'entry_{i}')}...")
        experiences[i] = add_schema_fields(experience)
        
        # Auto-extract metrics from existing text
        if not experience['metrics']:
            action_desc = experience.get('action_description', '')
            quantified_results = experience.get('quantified_results', '')
            combined_text = f"{action_desc} {quantified_results}"
            auto_metrics = normalize_metrics(combined_text)
            if auto_metrics:
                experience['metrics'].extend(auto_metrics)
    
    # Apply patch snippets
    experiences = apply_patch_snippets(experiences)
    
    # Update data
    data['experiences'] = experiences
    
    # Save upgraded YAML
    save_yaml(data, output_file)
    print(f"✅ Upgrade complete: {output_file}")

def main():
    parser = argparse.ArgumentParser(description='Upgrade work_experience.yaml with enhanced schema')
    parser.add_argument('--in', dest='input_file', required=True, help='Input YAML file path')
    parser.add_argument('--out', dest='output_file', required=True, help='Output YAML file path')
    
    args = parser.parse_args()
    
    if not Path(args.input_file).exists():
        print(f"❌ Input file not found: {args.input_file}")
        return 1
    
    try:
        upgrade_yaml(args.input_file, args.output_file)
        return 0
    except Exception as e:
        print(f"❌ Upgrade failed: {e}")
        return 1

if __name__ == '__main__':
    exit(main())