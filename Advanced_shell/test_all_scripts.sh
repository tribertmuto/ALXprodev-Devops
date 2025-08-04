#!/bin/bash

# Test script for all Pokémon API automation scripts
# This script runs all tasks in sequence to verify functionality

echo "🧪 Testing Pokémon API Automation Scripts"
echo "=========================================="
echo ""

# Function to run a script and check its status
run_script() {
    local script_name="$1"
    local description="$2"
    
    echo "📋 Running: $description"
    echo "Script: $script_name"
    echo "----------------------------------------"
    
    if [ -f "$script_name" ]; then
        if bash "$script_name"; then
            echo "✅ $script_name completed successfully"
        else
            echo "❌ $script_name failed"
            return 1
        fi
    else
        echo "❌ Script $script_name not found"
        return 1
    fi
    
    echo ""
}

# Test Task 0 - API Request Automation
run_script "apiAutomation-0x00" "API Request Automation (Task 0)"

# Test Task 1 - Extract Pokémon Data
run_script "data_extraction_automation-0x01" "Extract Pokémon Data (Task 1)"

# Test Task 2 - Batch Pokémon Data Retrieval
run_script "batchProcessing-0x02" "Batch Pokémon Data Retrieval (Task 2)"

# Test Task 3 - Summarize Pokémon Data
run_script "summaryData-0x03" "Summarize Pokémon Data (Task 3)"

# Test Task 5 - Parallel Data Fetching
run_script "batchProcessing-0x04" "Parallel Data Fetching (Task 5)"

echo "🎉 All tests completed!"
echo ""
echo "📁 Generated files:"
ls -la *.json *.csv *.txt pokemon_data/ 2>/dev/null || echo "No files found"

echo ""
echo "📊 Summary:"
echo "- data.json: Pikachu data from API"
echo "- pokemon_data/: Directory with individual Pokémon JSON files"
echo "- pokemon_report.csv: CSV report with all Pokémon data"
echo "- errors.txt: Error log (if any errors occurred)" 