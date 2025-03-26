#!/bin/bash

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if conda is installed and initialized
if ! command_exists conda; then
    echo "Error: conda is not installed or not in PATH"
    exit 1
fi

# Create and activate conda environment
echo "Setting up environment..."

# Create environment if it doesn't exist
if ! conda env list | grep -q "offline_traj_tool"; then
    echo "Creating new conda environment with Python 3.9..."
    conda create -n offline_traj_tool python=3.9 pip -y
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create conda environment"
        exit 1
    fi
fi

# Activate the environment and install package
echo "Activating environment..."
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate offline_traj_tool

if [ $? -eq 0 ]; then
    echo "Environment activated successfully"
    
    # Install the package in editable mode
    echo "Installing package in development mode..."
    pip install -e .
    
    # Launch the editor
    echo "Launching trajectory editor..."
    trajectory_edit
else
    echo "Error: Failed to activate conda environment"
    exit 1
fi
