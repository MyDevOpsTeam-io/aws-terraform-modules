/*
 * # AWS EKS Terraform Module 💡
 * Description
 * ============
 * This tf file provides EKS resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/

output "cluster_arn" {
  value       = aws_eks_cluster.cluster.arn
  description = "EKS Cluster ARN"
}

output "cluster_certificate_authority" {
  value       = aws_eks_cluster.cluster.certificate_authority
  description = "EKS Cluster certificate authority"
}

output "cluster_created_at" {
  value       = aws_eks_cluster.cluster.created_at
  description = "Created Date output"
}

output "cluster_endpoint" {
  value       = aws_eks_cluster.cluster.endpoint
  description = "EKS Cluster API Endpoint"
}

output "cluster_id" {
  value       = aws_eks_cluster.cluster.id
  description = "EKS Cluster ID"
}

output "cluster_identity" {
  value       = aws_eks_cluster.cluster.identity
  description = "EKS Cluster Identity"
}

output "cluster_platform_version" {
  value       = aws_eks_cluster.cluster.platform_version
  description = "Provisioned EKS Cluster platform version"
}

output "cluster_status" {
  value       = aws_eks_cluster.cluster.status
  description = "Cluster Currnet Status"
}

output "cluster_tags_all" {
  value       = aws_eks_cluster.cluster.tags_all
  description = "EKS Tags"
}

output "cluster_vpc_config" {
  value       = aws_eks_cluster.cluster.vpc_config
  description = "EKS Cluster VPC Config"
}

output "cluster_certificate_authority_data" {
  value       = aws_eks_cluster.cluster.certificate_authority.0.data
  description = "EKS Cluster Ceritificate authority RAW DATA output"
}

output "cluster_oidc" {
  value       = aws_eks_cluster.cluster.identity.0.oidc
  description = "EKS Cluster OIDC"
}

output "cluster_security_group_id" {
  value       = aws_eks_cluster.cluster.vpc_config.*.cluster_security_group_id
  description = "Created EKS Cluster Security Group ID's"
}

output "cluster_vpc_id" {
  value       = aws_eks_cluster.cluster.vpc_config.*.vpc_id
  description = "VPC ID of created EKS Cluster"
}

/* Nodegroup resource outputs */

output "nodegroup_id" {
  value       = aws_eks_node_group.cluster_nodegroup.id
  description = "AWS EKS Node Group ID"
}

output "nodegroup_arn" {
  value       = aws_eks_node_group.cluster_nodegroup.arn
  description = "AWS EKS Node Group ARN"
}

output "nodegroup_resources_remote_access_security_group_id" {
  value       = aws_eks_node_group.cluster_nodegroup.resources.*.remote_access_security_group_id
  description = "AWS EKS Node Group Remote Access Security Group ID's"
}

output "nodegroup_status" {
  value       = aws_eks_node_group.cluster_nodegroup.status
  description = "AWS EKS Node Group Status"
}


output "nodegroup_tags" {
  value       = aws_eks_node_group.cluster_nodegroup.tags_all
  description = "AWS EKS Node Group Tags"
}
