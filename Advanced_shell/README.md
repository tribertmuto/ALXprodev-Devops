# Pokémon API Automation Scripts

This directory contains a series of shell scripts for automating API requests to the Pokémon API and processing the data.

## Prerequisites

- Bash shell environment (Git Bash, WSL, or Linux)
- `curl` for making HTTP requests
- `jq` for JSON processing
- `bc` for floating-point calculations
- `awk` and `sed` for text processing

## Scripts Overview

### 1. `apiAutomation-0x00` - API Request Automation
Makes a request to the Pokémon API for Pikachu data and saves the response to `data.json`.

**Usage:**
```bash
./apiAutomation-0x00
```

**Output:**
- `data.json` - Contains Pikachu's data from the API
- `errors.txt` - Error log if the request fails

### 2. `data_extraction_automation-0x01` - Extract Pokémon Data
Extracts name, height, weight, and type from the JSON file using `jq`, `awk`, and `sed`.

**Usage:**
```bash
./data_extraction_automation-0x01
```

**Output:**
```
Pikachu is of type Electric, weighs 6kg, and is 0.4m tall.
```

### 3. `batchProcessing-0x02` - Batch Pokémon Data Retrieval
Fetches data for multiple Pokémon with error handling and retry logic.

**Usage:**
```bash
./batchProcessing-0x02
```

**Output:**
- `pokemon_data/` directory containing individual JSON files
- `errors.txt` - Error log for failed requests

### 4. `summaryData-0x03` - Summarize Pokémon Data
Generates a CSV report with all Pokémon data and calculates averages.

**Usage:**
```bash
./summaryData-0x03
```

**Output:**
- `pokemon_report.csv` - CSV file with name, height, and weight
- Average height and weight calculations

### 5. `batchProcessing-0x04` - Parallel Data Fetching
Fetches Pokémon data in parallel using background processes with proper job management.

**Usage:**
```bash
./batchProcessing-0x04
```

**Features:**
- Uses `jobs` command to monitor background processes
- Uses `kill` command to terminate processes if needed
- Signal handlers for graceful cleanup on interruption
- Timeout mechanism to prevent hanging
- Real-time job status monitoring

## Execution Order

For the best experience, run the scripts in this order:

1. `apiAutomation-0x00` - Get initial Pikachu data
2. `data_extraction_automation-0x01` - Extract and display Pikachu info
3. `batchProcessing-0x02` - Fetch multiple Pokémon data
4. `summaryData-0x03` - Generate summary report
5. `batchProcessing-0x04` - Try parallel fetching

## Sample Output

### Task 0 - API Request
```bash
$ ./apiAutomation-0x00
Fetching Pikachu data from Pokémon API...
✅ Successfully retrieved Pikachu data and saved to data.json
```

### Task 1 - Data Extraction
```bash
$ ./data_extraction_automation-0x01
Pikachu is of type Electric, weighs 6.0kg, and is 0.4m tall.
```

### Task 2 - Batch Processing
```bash
$ ./batchProcessing-0x02
Starting batch Pokémon data retrieval with error handling...
==========================================================
Fetching data for bulbasaur...
Saved data to pokemon_data/bulbasaur.json ✅
Fetching data for ivysaur...
Saved data to pokemon_data/ivysaur.json ✅
...
```

### Task 3 - Summary Report
```bash
$ ./summaryData-0x03
CSV Report generated at: pokemon_report.csv

Name,Height (m),Weight (kg)
Bulbasaur,0.7,6.9
Charmander,0.6,8.5
...

Average Height: 1.08 m
Average Weight: 29.48 kg
```

## Error Handling

All scripts include comprehensive error handling:
- Network failures are logged to `errors.txt`
- Retry logic (up to 3 attempts) for failed requests
- Graceful handling of missing files/directories
- Process management for parallel execution

## Notes

- The scripts use the public Pokémon API (https://pokeapi.co/api/v2/)
- Rate limiting is implemented with 1-second delays between requests
- All data is saved in JSON format for easy processing
- Unit conversions are handled automatically (decimeters to meters, hectograms to kilograms) 