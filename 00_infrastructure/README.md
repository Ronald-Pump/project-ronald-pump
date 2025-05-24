# Terraform S3 Bucket Infrastructure

This project contains the Terraform configuration for creating an Amazon S3 bucket.

## Project Structure

- `main.tf`: Contains the main Terraform configuration for creating the S3 bucket.
- `variables.tf`: Defines the input variables for the Terraform configuration, such as bucket name and region.
- `outputs.tf`: Specifies the output values after the S3 bucket is created, including the bucket URL.
- `README.md`: Documentation for the project.

## Getting Started

To get started with this project, follow these steps:

1. **Install Terraform**: Ensure that you have Terraform installed on your machine. You can download it from the [Terraform website](https://www.terraform.io/downloads.html).

2. **Clone the Repository**: Clone this repository to your local machine.

3. **Navigate to the Project Directory**: Change into the project directory:
   ```
   cd 00_infrastructure
   ```

4. **Initialize Terraform**: Run the following command to initialize the Terraform configuration:
   ```
   terraform init
   ```

5. **Plan the Deployment**: To see what resources will be created, run:
   ```
   terraform plan
   ```

6. **Apply the Configuration**: To create the S3 bucket, run:
   ```
   terraform apply
   ```

7. **Review Outputs**: After the apply command completes, review the output values to find the bucket URL.

## Cleanup

To remove the resources created by this configuration, run:
```
terraform destroy
```

## Notes

- Ensure that your AWS credentials are configured properly to allow Terraform to create resources in your AWS account.
- Modify the `variables.tf` file to customize the bucket name and region as needed.