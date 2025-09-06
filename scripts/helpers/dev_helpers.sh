#!/bin/bash
# Development workflow helpers

# Clean up generated files
clean_output() {
    echo "🧹 Cleaning output directories..."
    rm -rf output/* data/temp/* 
    echo "✅ Output directories cleaned"
}

# Backup important files
backup_sources() {
    local backup_dir="backups/$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$backup_dir"
    cp -r source_materials/ "$backup_dir/"
    cp -r .claude/ "$backup_dir/"
    echo "💾 Backed up to: $backup_dir"
}

# Quick project setup check
check_setup() {
    echo "🔍 Setup Check:"
    echo "   Git repo: $([[ -d .git ]] && echo '✅' || echo '❌')"
    echo "   Virtual env: $([[ -n "${VIRTUAL_ENV:-}" ]] && echo '✅' || echo '❌')"
    echo "   Claude config: $([[ -d .claude ]] && echo '✅' || echo '❌')"
    echo "   GitHub CLI: $(command -v gh >/dev/null && echo '✅' || echo '❌')"
}

export -f clean_output backup_sources check_setup
