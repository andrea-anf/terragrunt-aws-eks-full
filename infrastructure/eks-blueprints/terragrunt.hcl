locals {
  config_vars    = read_terragrunt_config("../../config.hcl")
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@bitbucket.org:beetobit/terraform-aws-eks.git"
}


inputs = {
  region                = local.config_vars.locals.region
  tenant                = local.config_vars.locals.tenant
  environment           = local.config_vars.locals.environment
  zone                  = local.config_vars.locals.zone
  terraform_version     = local.config_vars.locals.terraform_version
  cluster_version       = local.config_vars.locals.cluster_version

  managed_node_groups = {
    mg_4 = {
      node_group_name   = local.config_vars.locals.node_group_name
      instance_types    = local.config_vars.locals.instance_types
      min_size          = local.config_vars.locals.min_size
      max_size          = local.config_vars.locals.max_size
      desired_size      = local.config_vars.locals.desired_size
      max_unavailable   = local.config_vars.locals.max_unavailable
    }
  }

  vpc_id                = local.config_vars.locals.vpc_id
  vpc_cidr              = local.config_vars.locals.vpc_cidr
  enable_nat_gateway    = local.config_vars.locals.vpc_enable_nat_gateway
  create_igw            = local.config_vars.locals.vpc_create_igw
  enable_dns_hostnames  = local.config_vars.locals.vpc_enable_dns_hostnames
  single_nat_gateway    = local.config_vars.locals.vpc_single_nat_gateway

  private_subnet_ids    = local.config_vars.locals.vpc_private_subnets
  public_subnet_ids     = local.config_vars.locals.vpc_public_subnets
}