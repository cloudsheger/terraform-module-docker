# Terraform Dockerized Workflow

This guide outlines the steps to build your Docker image and execute Terraform commands (`terraform init`, `terraform plan`, and `terraform apply`) inside a container. This approach provides a consistent and isolated environment for running your Terraform operations.

## Prerequisites

Make sure you have Docker installed on your system.

## Steps

### 1. **Build the Docker Image:**

Navigate to the directory containing your Dockerfile and run the following command to build your Docker image:

```bash
docker build -t your-image-name:tag .
docker build -t cloudsheger/terraform-docker -f docker/Dockerfile .
```

Replace `your-image-name:tag` with the desired name and tag for your Docker image.

### 2. **Run Terraform Commands Inside the Container:**

You can use the built image to run Terraform commands. Here's how you can run `terraform init`, `terraform plan`, and `terraform apply` inside the container:

#### **Run `terraform init` Inside the Container:**

```bash
docker run -v $(pwd):/app/.state -v ~/.aws:/root/.aws cloudsheger/terraform-docker init frontendapp.tfvars
```

Replace `/path/to/your/terraform/files` with the actual path to the directory containing your Terraform configuration files.

#### **Run `terraform plan` Inside the Container:**

```bash
docker run -v $(pwd):/app/.state -v ~/.aws:/root/.aws cloudsheger/terraform-docker plan frontendapp.tfvars
```

#### **Run `terraform apply` Inside the Container:**

```bash
docker run -v /path/to/your/terraform/files:/app/.state your-image-name:tag apply
docker run -v $(pwd):/app/.state -v ~/.aws:/root/.aws cloudsheger/terraform-docker plan
```

Remember to replace `/path/to/your/terraform/files` with the actual path to your Terraform configuration files.

These commands will mount your local Terraform files into the container's `.state` directory and execute the corresponding Terraform commands inside the container.

Ensure that your `entrypoint.sh` script inside the container (`/app/entrypoint.sh`) contains the necessary Terraform commands (`terraform init`, `terraform plan`, `terraform apply`) in the correct order, along with any other setup or environment configurations you might need for your specific use case.


### Install security tools 

```
brew install pre-commit terraform-docs tflint tfsec checkov terrascan infracost tfupdate minamijoyo/hcledit/hcledit jq
```