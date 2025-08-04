#!/bin/bash

# Installation script for Pokémon API automation dependencies
# Checks for required tools and provides installation instructions

echo "🔧 Checking dependencies for Pokémon API automation scripts"
echo "=========================================================="
echo ""

# Function to check if a command exists
check_command() {
    local cmd="$1"
    local package_name="$2"
    local install_instructions="$3"
    
    if command -v "$cmd" >/dev/null 2>&1; then
        echo "✅ $cmd is installed"
        return 0
    else
        echo "❌ $cmd is not installed"
        echo "   Package: $package_name"
        echo "   Install: $install_instructions"
        echo ""
        return 1
    fi
}

# Check all required dependencies
echo "Checking required tools:"
echo "-----------------------"

curl_ok=false
jq_ok=false
bc_ok=false
awk_ok=false
sed_ok=false

check_command "curl" "curl" "sudo apt-get install curl (Ubuntu/Debian) or brew install curl (macOS)" && curl_ok=true
check_command "jq" "jq" "sudo apt-get install jq (Ubuntu/Debian) or brew install jq (macOS)" && jq_ok=true
check_command "bc" "bc" "sudo apt-get install bc (Ubuntu/Debian) or brew install bc (macOS)" && bc_ok=true
check_command "awk" "gawk" "Usually pre-installed on most systems" && awk_ok=true
check_command "sed" "sed" "Usually pre-installed on most systems" && sed_ok=true

echo ""
echo "📋 Installation Summary:"
echo "========================"

if [ "$curl_ok" = true ] && [ "$jq_ok" = true ] && [ "$bc_ok" = true ] && [ "$awk_ok" = true ] && [ "$sed_ok" = true ]; then
    echo "🎉 All dependencies are installed! You can now run the Pokémon API scripts."
    echo ""
    echo "Next steps:"
    echo "1. Make scripts executable: chmod +x *.sh"
    echo "2. Run the test script: ./test_all_scripts.sh"
    echo "3. Or run individual scripts as needed"
else
    echo "⚠️  Some dependencies are missing. Please install them before running the scripts."
    echo ""
    echo "Quick installation commands:"
    echo "Ubuntu/Debian:"
    echo "  sudo apt-get update && sudo apt-get install curl jq bc"
    echo ""
    echo "macOS (with Homebrew):"
    echo "  brew install curl jq bc"
    echo ""
    echo "Windows (with WSL or Git Bash):"
    echo "  Install the tools through your package manager"
fi

echo ""
echo "📚 For more information, see the README.md file." 