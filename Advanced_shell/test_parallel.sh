#!/bin/bash

# Test script for parallel processing with jobs and kill commands
echo "🧪 Testing Parallel Processing with Jobs and Kill Commands"
echo "========================================================="

# Function to simulate a long-running task
long_task() {
    local task_name="$1"
    local duration="$2"
    
    echo "Starting task: $task_name (will run for $duration seconds)"
    sleep "$duration"
    echo "✅ Task $task_name completed"
}

# Function to check jobs status
check_jobs_status() {
    echo ""
    echo "📋 Current jobs status:"
    jobs -l
    
    if jobs -r | grep -q .; then
        echo "🔄 Some jobs are still running..."
        return 0
    else
        echo "✅ All jobs completed!"
        return 1
    fi
}

# Function to kill all background jobs
kill_all_jobs() {
    echo "🛑 Killing all background jobs..."
    jobs -p | xargs -r kill
    echo "✅ All background jobs terminated."
}

# Signal handler
cleanup() {
    echo ""
    echo "⚠️  Script interrupted. Cleaning up..."
    kill_all_jobs
    exit 1
}

trap cleanup SIGINT SIGTERM

echo "🚀 Starting parallel tasks..."

# Start background tasks
long_task "Task A" 3 &
echo "Started Task A (Job ID: $!)"

long_task "Task B" 5 &
echo "Started Task B (Job ID: $!)"

long_task "Task C" 2 &
echo "Started Task C (Job ID: $!)"

echo ""
echo "📊 Initial jobs status:"
jobs -l

echo ""
echo "⏳ Monitoring jobs..."

# Monitor jobs
timeout_counter=0
max_timeout=10

while check_jobs_status && [ $timeout_counter -lt $max_timeout ]; do
    sleep 1
    timeout_counter=$((timeout_counter + 1))
done

if [ $timeout_counter -ge $max_timeout ]; then
    echo "⏰ Timeout reached. Killing remaining jobs..."
    kill_all_jobs
fi

echo ""
echo "🎉 Parallel processing test completed!" 