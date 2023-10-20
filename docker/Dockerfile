FROM hashicorp/terraform:latest

# Install necessary dependencies
RUN apk add --no-cache curl

# Set up the working directory and add Terraform configuration files
WORKDIR /app
COPY main.tf variables.tf frontendapp.tfvars backendapp.tfvars /app/

# Add the EC2 module to the Docker image
COPY modules /app/modules

# Add the terraform backend to docker image
#COPY tf-backend /app/tf-backend

# Add entrypoint script
COPY ../scripts/entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh

# Create a volume for Terraform state directory
VOLUME /app/.state

# Set the entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]
