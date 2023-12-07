# EKS Terraform Basic Setup

This repository provides Terraform configurations for setting up a basic Amazon EKS (Elastic Kubernetes Service) cluster. The fundamental Terraform files included in this repository are:

- `eks-clusters.tf`: Terraform configuration for creating the EKS cluster.
- `nodegroup.tf`: Terraform configuration for defining EKS worker nodes.
- `iam-roles.tf`: Terraform configuration for managing IAM roles necessary for EKS.
- `providers.tf`: Terraform configuration specifying the necessary providers.
- `security-group.tf`: Terraform configuration for managing security groups.

## Prerequisites

Before using these Terraform configurations, make sure you have:

1. An AWS account and configured AWS CLI with necessary credentials.
2. Terraform installed on your local machine.

## Usage

1. Clone this repository:

    ```bash
    git clone https://github.com/your-username/eks-terraform-basic-setup.git
    cd eks-terraform-basic-setup
    ```

2. Modify the configuration files as needed, especially in `eks-clusters.tf`, `nodegroup.tf`, `iam-roles.tf`, `providers.tf`, and `security-group.tf`.

3. Initialize Terraform:

    ```bash
    terraform init
    ```

4. Review the plan:

    ```bash
    terraform plan
    ```

5. Apply the configuration:

    ```bash
    terraform apply
    ```

6. Confirm the changes by typing `yes` when prompted.

## Cleanup

To destroy the resources created by Terraform, run:

```bash
terraform destroy
