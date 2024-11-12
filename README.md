# Highly Available AWS Infrastructure with Terraform

This project sets up a highly available infrastructure on AWS using Terraform. The setup includes VPC, public and private subnets across multiple availability zones, an Elastic Beanstalk environment, RDS, Memcached, ActiveMQ, and a bastion host for secure database access. This README provides an overview of the setup and instructions for deployment.

![High Avalability VPC](https://github.com/user-attachments/assets/7d61e6f5-34ff-4031-83cb-e2fda0dbf11e)

## Project Architecture

![Terraform for cloud State Management Converted](https://github.com/user-attachments/assets/ed73155c-a75d-4017-8f2d-fbd9224b6d8f)

The architecture comprises the following components:
- **VPC**: Created using the AWS VPC module, includes two public and two private subnets across different availability zones for high availability.
- **Elastic Beanstalk Environment**: Deployed in the private subnets, running a Tomcat application on AWS Elastic Beanstalk for automatic scaling and application management.
- **RDS**: MySQL instance hosted in private subnets for database management, accessible only through the bastion host for enhanced security.
- **Memcached**: Deployed in private subnets, providing a distributed memory caching solution for enhanced application performance.
- **ActiveMQ**: Also deployed in private subnets, providing a message broker for communication between application components.
- **Bastion Host**: Hosted in a public subnet, used to securely access the RDS instance in private subnets for database patching and management tasks.

## Key Features

- **High Availability**: Infrastructure spans multiple availability zones for fault tolerance and high availability.
- **Secure Access**: Private resources are accessible only through the bastion host, minimizing exposure to the public internet.
- **Scalable Setup**: Elastic Beanstalk automatically scales the application as traffic increases, ensuring performance under load.

## Prerequisites

- **Terraform**: Install Terraform to manage and deploy the infrastructure.
- **AWS Account**: Ensure you have an AWS account with IAM permissions to create resources.
- **SSH Key Pair**: Generate an SSH key pair for accessing the bastion host.

## Infrastructure Diagram

Include the architecture diagram images here to illustrate the setup visually.

## Setup Instructions

1. **Clone the Repository**: Clone this repository to your local machine.
   ```bash
   git clone https://github.com/ubaidmundewadi/Highly-Available-AWS-Infrastructure-with-Terraform.git
   cd Highly-Available-AWS-Infrastructure-with-Terraform
   ```

2. **Modify Configuration Files**: Update the configuration files in the `variables.tf` file to match your AWS account settings, such as the region, VPC CIDR range, and subnet CIDRs.

3. **Initialize Terraform**:
   ```bash
   terraform init
   ```

4. **Review Plan**: Run a plan to see the changes that Terraform will make.
   ```bash
   terraform plan
   ```

5. **Deploy Infrastructure**: Apply the Terraform configuration to deploy the infrastructure.
   ```bash
   terraform apply
   ```

6. **Access the Bastion Host**: Use the bastion host in the public subnet to connect securely to the RDS instance in private subnets.
   ```bash
   ssh -i <path-to-your-ssh-key> ec2-user@<bastion-host-public-ip>
   ```

7. **Database Patching and Management**: From the bastion host, connect to the RDS instance and apply SQL schema patches as needed.

## Cleanup

To remove all resources and avoid unnecessary charges, run the following command:
```bash
terraform destroy
```

## Additional Details

- **Terraform State Management**: The Terraform state is stored in an S3 bucket (not included in this repository; please set up an S3 bucket for state management if desired).
- **Cost Optimization**: The setup uses private subnets and a NAT Gateway for cost-effective internet access for resources in private subnets.
- **Security Best Practices**: Implemented IAM roles, security groups, and least privilege principles for enhanced security.

## Contributing

If you'd like to contribute, please fork the repository and make changes as you'd like. Pull requests are warmly welcomed.
