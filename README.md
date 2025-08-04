# ALXprodev-Devops

This repository contains various DevOps projects and automation scripts.

## Projects

### Advanced Shell Scripting - Pokémon API Automation

Located in the `Advanced_shell/` directory, this project demonstrates advanced shell scripting techniques through a series of tasks that automate API requests to the Pokémon API.

#### Features:
- **API Request Automation**: Automated requests to the Pokémon API
- **Data Extraction**: Advanced text manipulation using `jq`, `awk`, and `sed`
- **Batch Processing**: Handling multiple API requests with error handling
- **Data Summarization**: Generating CSV reports and calculating statistics
- **Parallel Processing**: Background process management for concurrent requests
- **Error Handling**: Robust retry logic and error logging

#### Quick Start:
```bash
cd Advanced_shell
./install_dependencies.sh
./test_all_scripts.sh
```

For detailed documentation, see [Advanced_shell/README.md](Advanced_shell/README.md).

## Directory Structure

```
ALXprodev-Devops/
├── Advanced_shell/          # Pokémon API automation scripts
│   ├── apiAutomation-0x00   # Task 0: API Request Automation
│   ├── data_extraction_automation-0x01  # Task 1: Data Extraction
│   ├── batchProcessing-0x02 # Task 2: Batch Processing
│   ├── summaryData-0x03     # Task 3: Data Summarization
│   ├── batchProcessing-0x04 # Task 5: Parallel Processing
│   ├── install_dependencies.sh  # Dependency checker
│   ├── test_all_scripts.sh  # Test runner
│   └── README.md            # Detailed documentation
└── README.md               # This file
```

