#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Initialize Terraform
echo "Initializing Terraform..."
terraform init

# Plan the Terraform deployment
echo "Planning Terraform deployment..."
terraform plan

# Apply the Terraform configuration with auto-accept
echo "Applying Terraform configuration..."
terraform apply -auto-approve

echo "Terraform deployment complete."
