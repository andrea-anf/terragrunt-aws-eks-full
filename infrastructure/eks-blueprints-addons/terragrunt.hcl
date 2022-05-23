locals {
  config_vars    = read_terragrunt_config("../../config.hcl")
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@bitbucket.org:beetobit/terraform-aws-eks-addons.git"
}

dependency "eks_blueprints" {
  config_path = "../eks-blueprints"
  mock_outputs = {
    eks_cluster_id = "prov_value"
    eks_cluster_endpoint = "prov_value"
    eks_cluster_certificate_authority_data = "prov_value"
    azs = ["prov_value"]
    managed_node_group_iam_instance_profile_id = "prov_value"
    worker_node_security_group_id = "prov_value"
    eks_cluster_name = "prov_value"
    eks_oidc_issuer_url = "prov_value"
    eks_oidc_provider_arn = "prov_value"
  }
}


inputs = {
  region                                = local.config_vars.locals.region

  eks_cluster_id                        = dependency.eks_blueprints.outputs.eks_cluster_id
  eks_cluster_endpoint                  = dependency.eks_blueprints.outputs.eks_cluster_endpoint
  eks_cluster_certificate_authority_data = dependency.eks_blueprints.outputs.eks_cluster_certificate_authority_data
  cluster_version                       = local.config_vars.locals.cluster_version

// karpenter
  enable_karpenter                      = local.config_vars.locals.enable_karpenter
  azs                                   = dependency.eks_blueprints.outputs.azs
  managed_node_group_iam_instance_profile_id = dependency.eks_blueprints.outputs.managed_node_group_iam_instance_profile_id
  worker_node_security_group_id         = dependency.eks_blueprints.outputs.worker_node_security_group_id
  karpenter_tag_name                    = local.config_vars.locals.karpenter_tag_name
  block_device_mappings_volume_type     = local.config_vars.locals.block_device_mappings_volume_type
  block_device_mappings_volume_size     = local.config_vars.locals.block_device_mappings_volume_size
  eks_cluster_name                      = dependency.eks_blueprints.outputs.eks_cluster_id
  node_group_name                       = local.config_vars.locals.node_group_name

// grafana
  enable_grafana                        = local.config_vars.locals.enable_grafana
  eks_oidc_issuer_url                   = dependency.eks_blueprints.outputs.eks_oidc_issuer_url
  eks_oidc_provider_arn                 = dependency.eks_blueprints.outputs.eks_oidc_provider_arn
  k8s_grafana_namespace                 = local.config_vars.locals.k8s_grafana_namespace

// ingress controllers
  enable_ingress_nginx                  = local.config_vars.locals.enable_ingress_nginx
  enable_alb_ingress_controller         = local.config_vars.locals.enable_alb_ingress_controller
  k8s_alb_ingress_controller_namespace  = local.config_vars.locals.k8s_alb_ingress_controller_namespace

  enable_amazon_eks_coredns             = local.config_vars.locals.enable_amazon_eks_coredns
  enable_amazon_eks_kube_proxy          = local.config_vars.locals.enable_amazon_eks_kube_proxy
  enable_amazon_eks_vpc_cni             = local.config_vars.locals.enable_amazon_eks_vpc_cni
  enable_amazon_eks_aws_ebs_csi_driver  = local.config_vars.locals.enable_amazon_eks_aws_ebs_csi_driver
 
  enable_aws_load_balancer_controller   = local.config_vars.locals.enable_aws_load_balancer_controller
  enable_metrics_server                 = local.config_vars.locals.enable_metrics_server
  enable_cluster_autoscaler             = local.config_vars.locals.enable_cluster_autoscaler
  enable_aws_cloudwatch_metrics         = local.config_vars.locals.enable_aws_cloudwatch_metrics
  enable_argocd                         = local.config_vars.locals.enable_argocd 
  enable_aws_for_fluentbit              = local.config_vars.locals.enable_aws_for_fluentbit
  enable_aws_node_termination_handler   = local.config_vars.locals.enable_aws_node_termination_handler
  enable_prometheus                     = local.config_vars.locals.enable_prometheus
  enable_traefik                        = local.config_vars.locals.enable_traefik
  enable_agones                         = local.config_vars.locals.enable_agones
  enable_spark_k8s_operator             = local.config_vars.locals.enable_spark_k8s_operator
  enable_fargate_fluentbit              = local.config_vars.locals.enable_fargate_fluentbit
  enable_keda                           = local.config_vars.locals.enable_keda
  enable_vpa                            = local.config_vars.locals.enable_vpa
  enable_yunikorn                       = local.config_vars.locals.enable_yunikorn
}
