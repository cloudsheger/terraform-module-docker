#!/bin/sh

# Function to display usage instructions
display_usage() {
    echo "Usage: $0 <command> <variable_file>"
    echo "Available commands: init, plan, apply, destroy"
}

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
    echo "Error: Invalid number of arguments."
    display_usage
    exit 1
fi

# Extract the command and variable file provided by the user
command=$1
variable_file=$2

# Initialize Terraform and process the command
case $command in
    "init")
        echo "Initializing Terraform..."
        terraform init
        ;;
    "plan")
        echo "Initializing Terraform..."
        terraform init
        echo "Creating Terraform plan..."
        terraform plan -var-file=$variable_file
        ;;
    "apply")
        echo "Initializing Terraform..."
        terraform init
        echo "Creating Terraform plan..."
        terraform plan -var-file=$variable_file
        echo "Applying Terraform changes..."
        terraform apply -auto-approve -var-file=$variable_file
        ;;
    "destroy")
        echo "Initializing Terraform..."
        terraform init
        echo "Creating Terraform destruction plan..."
        terraform plan -var-file=$variable_file
        echo "Destroying Terraform resources..."
        terraform destroy -auto-approve -var-file=$variable_file
        ;;
    *)
        echo "Error: Invalid command. Available commands: init, plan, apply, destroy."
        display_usage
        exit 1
        ;;
esac

exit 0
