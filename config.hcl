locals {
  region = ""
  
  # VPC variables to use only if you want use an existing VPC
  vpc_id = ""
  vpc_private_subnets = []
  vpc_public_subnets = []

  # VPC variables to use if you want to create a new VPC
  vpc_cidr = ""
  vpc_enable_nat_gateway    = true
  vpc_single_nat_gateway    = true
  vpc_enable_dns_hostnames  = true
  vpc_create_igw            = true

  vpc_tags_Name        = "vpc-eks" 
  vpc_tags_Owner       = ""
  vpc_tags_Contact     = ""
  vpc_tags_Project     = ""
  vpc_tags_Environment = ""

  # EKS cluster config
  tenant = ""
  environment = ""
  zone = ""
  terraform_version = "Terraform 1.0.1"
  cluster_version = "1.21"

  node_group_name = ""
  instance_types = ["t3.large"]
  min_size = "2"
  max_size = "4"
  desired_size = "3"
  max_unavailable = "1"


  # EKS Blueprints addons
  
  #Karpenter
  enable_karpenter                      = false
  karpenter_tag_name                    = "karpenter"
  block_device_mappings_volume_type     = "gp3"
  block_device_mappings_volume_size     = "100"
  
  enable_grafana                        = false
  k8s_grafana_namespace                 = "monitoring"

#Ingress controllers
  enable_alb_ingress_controller         = false
  k8s_alb_ingress_controller_namespace  = "kube-system"
  enable_ingress_nginx                  = false

  enable_aws_for_fluentbit              = false
  enable_fargate_fluentbit              = false

  enable_amazon_eks_aws_ebs_csi_driver  = false

  enable_amazon_eks_coredns             = false
  enable_amazon_eks_kube_proxy          = false
  enable_amazon_eks_vpc_cni             = false
 
  enable_aws_load_balancer_controller   = false
  enable_metrics_server                 = false
  enable_cluster_autoscaler             = false
  enable_aws_cloudwatch_metrics         = false
  enable_argocd                         = false 
  enable_aws_node_termination_handler   = false
  enable_prometheus                     = false
  enable_traefik                        = false
  enable_agones                         = false
  enable_spark_k8s_operator             = false
  enable_keda                           = false
  enable_vpa                            = false
  enable_yunikorn                       = false
}