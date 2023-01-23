/*
 * # AWS EKS Terraform Module 💡
 * Description
 * ============
 * This tf file provides EKS resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/

/* Required Variables */
variable "cluster_name" {
  type        = string
  description = "Define the eks cluster name"
}

variable "cluster_version" {
  type        = string
  description = "Define the AWS EKS Cluster version"
}

variable "cluster_role_arn" {
  type        = string
  description = "Specify existing cluster role arn"
}

variable "cluster_security_group_ids" {
  type        = list(string)
  description = "Specify cluster level security group ids"
}

variable "cluster_subnet_ids" {
  type        = list(string)
  description = "Specify list of cluster subnet ids"
}

variable "cluster_nodegroup_name" {
  type        = string
  description = "Specify cluster nodegroup name"
}

variable "cluster_nodegroup_role_arn" {
  type        = string
  description = "Specify existing cluster nodegroup role arn"
}

variable "worker_node_subnet_ids" {
  type        = list(string)
  description = "List of desired subnets ids to be used by worker nodes"
}

variable "cluster_tags" {
  type        = map(any)
  description = "AWS EKS Cluster Tags"
}


variable "nodegroup_tags" {
  type        = map(any)
  description = "AWS EKS Cluster Node Group Tags"
}

/* Optional Variables */

variable "cluster_nodegroup_instance_types" {
  type        = list(string)
  default     = ["t3.medium"]
  description = "Specify list of desired nodegroup instance_types"
}

variable "cluster_nodegroup_disk_size" {
  type        = string
  default     = "20"
  description = "Desired storage size for worker nodes in GB. Defaults to 20GB"
}

variable "ssh_key" {
  type        = string
  default     = ""
  description = "Existing SSH keypair on AWS"
}

variable "worker_remote_access_security_groups" {
  type        = list(string)
  default     = [""]
  description = "List of Remote Access security groups for SSH Access"
}

variable "nodegroup_desired_size" {
  type        = number
  default     = 3
  description = "Number of desired worker nodes"
}

variable "nodegroup_max_size" {
  type        = number
  default     = 3
  description = "Maximum number of running worker nodes"
}

variable "nodegroup_min_size" {
  type        = number
  default     = 2
  description = "Minimum number of running worker nodes"
}

variable "vpc_cni_enabled" {
  type        = bool
  default     = true
  description = "Enable/Disable provisioning of AWS VPC CNI EKS Addon"
}

variable "cni_version" {
  type        = string
  default     = "v1.11.2-eksbuild.1"
  description = "Enable/Disable provisioning of AWS VPC CNI EKS Addon"
}
