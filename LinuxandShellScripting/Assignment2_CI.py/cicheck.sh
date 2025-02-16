#!/bin/bash

# Function to run a command and handle output
run_command() {
    echo "Running: $1"
    output=$(eval "$1" 2>&1)
    exit_code=$?
    
    echo "$output"
    
    if [ $exit_code -ne 0 ]; then
        echo "Error: Command failed with exit code $exit_code" >&2
    fi
    
    return $exit_code
}

# Function to run unit tests
run_tests() {
    echo "Running unit tests..."
    run_command "python -m unittest discover -s tests"
    return $?
}

# Main CI process
main() {
    echo "Starting Continuous Integration Process..."

    # Step 1: Pull the latest code (if using Git)
    if [ -d ".git" ]; then
        echo "Fetching latest code from Git..."
        run_command "git pull origin main"
        if [ $? -ne 0 ]; then
            echo "Failed to pull latest code. Exiting."
            exit 1
        fi
    fi

    # Step 2: Run Tests
    run_tests
    if [ $? -ne 0 ]; then
        echo "Tests failed! Fix errors before merging."
        exit 1
    fi

    echo "✅ Continuous Integration completed successfully!"
}

# Execute main function
main