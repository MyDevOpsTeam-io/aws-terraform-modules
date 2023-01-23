/*
 * # AWS EKS Terraform Module 💡
 * Description
 * ============
 * This tf file provides EKS resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/
resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn
  version  = var.cluster_version

  vpc_config {
    security_group_ids = var.cluster_security_group_ids
    subnet_ids         = var.cluster_subnet_ids
  }
  tags = var.cluster_tags
}

resource "aws_eks_node_group" "cluster_nodegroup" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = var.cluster_nodegroup_name
  node_role_arn   = var.cluster_nodegroup_role_arn
  instance_types  = var.cluster_nodegroup_instance_types
  disk_size       = var.cluster_nodegroup_disk_size
  version         = var.cluster_version
  remote_access {
    ec2_ssh_key               = var.ssh_key == "" && length(var.worker_remote_access_security_groups) == 0 ? null : var.ssh_key
    source_security_group_ids = length(var.worker_remote_access_security_groups) == 0 && var.ssh_key == "" ? null : var.worker_remote_access_security_groups
  }

  subnet_ids = var.worker_node_subnet_ids

  scaling_config {
    desired_size = var.nodegroup_desired_size
    max_size     = var.nodegroup_max_size
    min_size     = var.nodegroup_min_size
  }

  tags = var.nodegroup_tags
}

resource "aws_eks_addon" "cluster_cni" {
  cluster_name  = aws_eks_cluster.cluster.name
  addon_name    = "vpc-cni"
  addon_version = var.cni_version == "" ? null : var.cni_version
  count         = var.vpc_cni_enabled == true ? 1 : 0
}
