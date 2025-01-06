#!/bin/bash

# Script to install AWS CLI on Ubuntu

echo "Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

echo "Installing prerequisites (curl and unzip)..."
sudo apt install curl unzip -y

echo "Downloading the AWS CLI installer..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

echo "Extracting the AWS CLI installer..."
unzip awscliv2.zip

echo "Installing AWS CLI..."
sudo ./aws/install

echo "Verifying AWS CLI installation..."
aws --version

if [ $? -eq 0 ]; then
    echo "AWS CLI installed successfully!"
else
    echo "AWS CLI installation failed. Please check the logs."
fi

echo "Cleaning up installation files..."
rm -rf awscliv2.zip aws

echo "Done! You can now configure AWS CLI using 'aws configure'."
