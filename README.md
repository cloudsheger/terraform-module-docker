# Terraform EC2 App Module

This repository contains a Terraform module for creating EC2 instances. The module supports different environments (dev, test, and prod) using Terraform workspaces.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)

## Getting Started

1. Clone this repository to your local machine:

    ```sh
    git clone <repository_url>
    cd terraform-ec2-app
    ```

2. Switch to the desired workspace (dev, test, or prod):

    ```sh
    terraform workspace select dev
    ```

3. Initialize Terraform:

    ```sh
    terraform init
    ```

4. Create a variable file for your environment. For example, for the dev environment, create a `dev.tfvars` file in the `environments` directory with the following content:

    ```hcl
    instance_count   = 2
    infra_env        = "dev"
    infra_role       = "app"
    aws_region       = "us-west-1"
    instance_type    = "t2.micro"
    key_name         = "my-key"
    subnet_id        = "subnet-123456"
    instance_name    = "dev-instance"
    security_groups  = ["sg-123456"]
    ```

5. Apply the Terraform configuration using the variable file:

    ```sh
    terraform apply -var-file=environments/dev.tfvars
    ```

## Workspace Management

Terraform workspaces are used to manage different environments. To switch between workspaces, use the following commands:

- **Switch to dev workspace**:

    ```sh
    terraform workspace select dev
    ```

- **Switch to test workspace**:

    ```sh
    terraform workspace select test
    ```

- **Switch to prod workspace**:

    ```sh
    terraform workspace select prod
    ```

## Clean Up

To destroy the created resources, run:

```sh
terraform destroy -var-file=environments/dev.tfvars


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