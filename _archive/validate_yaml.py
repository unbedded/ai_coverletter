#!/usr/bin/env python3
"""
YAML Validation Script
Validates work_experience.yaml structure and field types
"""

import yaml
import argparse
from pathlib import Path
from typing import Dict, List, Any, Set

def load_yaml(file_path: str) -> Dict[str, Any]:
    """Load and parse YAML file"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            return yaml.safe_load(f)
    except yaml.YAMLError as e:
        raise ValueError(f"Invalid YAML syntax: {e}")

def validate_experience_entry(experience: Dict[str, Any], index: int, strict: bool = False) -> List[str]:
    """Validate a single experience entry"""
    errors = []
    
    # Required fields
    required_fields = ['experience_id', 'category', 'primary_skill']
    for field in required_fields:
        if field not in experience:
            errors.append(f"Entry {index}: Missing required field '{field}'")
        elif not experience[field]:
            errors.append(f"Entry {index}: Empty required field '{field}'")
    
    # Field type validation
    string_fields = [
        'experience_id', 'category', 'primary_skill', 'experience_title',
        'situation_task', 'action_description', 'quantified_results',
        'proficiency_level', 'story_adaptability', 'narrative_hook'
    ]
    
    list_fields = [
        'secondary_skills', 'keywords', 'tags', 'tech_stack',
        'validation_methods', 'integration_scopes', 'environments',
        'job_alignment', 'impact_type', 'stakeholders', 'region_context'
    ]
    
    for field in string_fields:
        if field in experience and experience[field] is not None:
            if not isinstance(experience[field], str):
                errors.append(f"Entry {index}: Field '{field}' must be string, got {type(experience[field])}")
    
    for field in list_fields:
        if field in experience and experience[field] is not None:
            if not isinstance(experience[field], list):
                errors.append(f"Entry {index}: Field '{field}' must be list, got {type(experience[field])}")
    
    # Validate metrics structure
    if 'metrics' in experience and experience['metrics']:
        if not isinstance(experience['metrics'], list):
            errors.append(f"Entry {index}: 'metrics' must be a list")
        else:
            for i, metric in enumerate(experience['metrics']):
                if not isinstance(metric, dict):
                    errors.append(f"Entry {index}, metric {i}: Must be a dictionary")
                    continue
                
                # Check metric fields
                metric_required = ['name']
                for req_field in metric_required:
                    if req_field not in metric:
                        errors.append(f"Entry {index}, metric {i}: Missing required field '{req_field}'")
                
                # Type checks for numeric fields
                numeric_fields = ['baseline', 'result', 'multiple', 'delta_percent']
                for num_field in numeric_fields:
                    if num_field in metric and metric[num_field] is not None:
                        if not isinstance(metric[num_field], (int, float)):
                            errors.append(f"Entry {index}, metric {i}: '{num_field}' must be numeric")
    
    # Validate supporting_links structure
    if 'supporting_links' in experience and experience['supporting_links']:
        if not isinstance(experience['supporting_links'], list):
            errors.append(f"Entry {index}: 'supporting_links' must be a list")
        else:
            for i, link in enumerate(experience['supporting_links']):
                if not isinstance(link, dict):
                    errors.append(f"Entry {index}, link {i}: Must be a dictionary")
                    continue
                
                link_required = ['title', 'url']
                for req_field in link_required:
                    if req_field not in link:
                        errors.append(f"Entry {index}, link {i}: Missing required field '{req_field}'")
    
    # Strict mode: check for unknown fields
    if strict:
        known_fields = {
            'experience_id', 'category', 'primary_skill', 'secondary_skills',
            'experience_title', 'context', 'situation_task', 'action_description',
            'quantified_results', 'proficiency_level', 'keywords', 'story_adaptability',
            'tags', 'supporting_links', 'tech_stack', 'validation_methods',
            'integration_scopes', 'environments', 'job_alignment', 'impact_type',
            'metrics', 'stakeholders', 'region_context', 'narrative_hook'
        }
        
        unknown_fields = set(experience.keys()) - known_fields
        if unknown_fields:
            errors.append(f"Entry {index}: Unknown fields in strict mode: {', '.join(unknown_fields)}")
    
    return errors

def validate_yaml_structure(data: Dict[str, Any], strict: bool = False) -> List[str]:
    """Validate overall YAML structure"""
    errors = []
    
    # Check top-level structure
    if not isinstance(data, dict):
        errors.append("Root element must be a dictionary")
        return errors
    
    if 'experiences' not in data:
        errors.append("Missing required 'experiences' section")
        return errors
    
    if not isinstance(data['experiences'], list):
        errors.append("'experiences' must be a list")
        return errors
    
    if len(data['experiences']) == 0:
        errors.append("'experiences' list is empty")
        return errors
    
    # Validate each experience entry
    experience_ids = set()
    for i, experience in enumerate(data['experiences']):
        if not isinstance(experience, dict):
            errors.append(f"Experience entry {i}: Must be a dictionary")
            continue
        
        # Check for duplicate experience_ids
        exp_id = experience.get('experience_id')
        if exp_id:
            if exp_id in experience_ids:
                errors.append(f"Duplicate experience_id: {exp_id}")
            experience_ids.add(exp_id)
        
        # Validate individual entry
        entry_errors = validate_experience_entry(experience, i, strict)
        errors.extend(entry_errors)
    
    return errors

def validate_yaml_file(file_path: str, strict: bool = False) -> bool:
    """Main validation function"""
    print(f"🔍 Validating YAML: {file_path}")
    
    try:
        data = load_yaml(file_path)
    except Exception as e:
        print(f"❌ Failed to load YAML: {e}")
        return False
    
    errors = validate_yaml_structure(data, strict)
    
    if not errors:
        print(f"✅ YAML validation passed ({len(data['experiences'])} entries)")
        if strict:
            print("   Strict mode: All fields are recognized")
        return True
    else:
        print(f"❌ YAML validation failed with {len(errors)} errors:")
        for error in errors:
            print(f"   • {error}")
        return False

def main():
    parser = argparse.ArgumentParser(description='Validate work_experience.yaml structure')
    parser.add_argument('--in', dest='input_file', required=True, help='YAML file to validate')
    parser.add_argument('--strict', action='store_true', help='Strict validation (fail on unknown fields)')
    
    args = parser.parse_args()
    
    if not Path(args.input_file).exists():
        print(f"❌ File not found: {args.input_file}")
        return 1
    
    try:
        success = validate_yaml_file(args.input_file, args.strict)
        return 0 if success else 1
    except Exception as e:
        print(f"❌ Validation error: {e}")
        return 1

if __name__ == '__main__':
    exit(main())