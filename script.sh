#!/bin/bash

# This script installs Docker on Ubuntu Jammy (22.04 or later)

# Update and install dependencies
echo "Updating system and installing dependencies..."
sudo apt update -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common lsb-release

# Add Docker's official GPG key
echo "Adding Docker's official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up Docker repository
echo "Setting up Docker repository..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index
echo "Updating package index..."
sudo apt update -y

# Install Docker CE (Community Edition)
echo "Installing Docker CE..."
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Verify Docker installation
echo "Verifying Docker installation..."
sudo systemctl start docker
sudo systemctl enable docker
sudo docker --version

# Add the user to the Docker group to run Docker without sudo
echo "Adding current user to Docker group..."
sudo usermod -aG docker $USER

# Inform user about restarting the session
echo "Installation complete! Please log out and log back in for the Docker group changes to take effect."

# End of script
