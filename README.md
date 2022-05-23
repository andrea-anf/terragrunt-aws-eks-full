# EKS cluster with add-ons

## Information
This module allows user to create an EKS cluster with the specified add-ons.
It has been created to orchestrate two modules:
    - terraform-aws-eks (terraform-aws-eks/src/1.0/)
    - terraform-aws-eks-addons (terraform-aws-eks-addons/src/1.0/)

## Usage
### Setup
To run the module you need to fill the following files with the desired values.
#### terraform.hcl
- set a proper name for the bucket where to store the remote state
- set the region

#### config.hcl
- VPC:
	- to use an existing one you need to set **vpc_id** and subnets vars 
	- to create a new one you need to leave **vpc_id** empty and set the **vpc_cidr**
	- set tags 
- EKS Cluster:
	- set the cluster's info and the node group's configuration
	- set *true* **enable_xx** to apply the required add-ons 

### Apply
From root directory of the module:
    1. `terragrunt run-all init`
    2. `terragrunt run-all apply`

Since dependencies has been used inside the module, the `terraform run-all plan` command may generate errors (check docs for info https://terragrunt.gruntwork.io/docs/reference/cli-options/#run-all).
