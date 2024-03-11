#!/bin/bash
# Prompt the user for directory input
read -p "Enter the directory path: " directory_path

# Validate if the directory exists
if [ ! -d "$directory_path" ]; then
    echo "Directory does not exist."
    exit 1
fi

# Create a new .env file with the updated ROS_PROJECT_PATH
echo "ROS_PROJECT_PATH='$directory_path'" > .env

echo "Directory path added to .env file."

sudo docker pull ros:noetic-ros-core-focal
sudo docker-compose up -d
sudo docker attach ros-dev-vm
