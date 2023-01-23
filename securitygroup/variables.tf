/*
 * # AWS Security Group Terraform Module 💡
 * Description
 * ============
 * This tf file provides Security Group resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/

/* Required Variables */

variable "name" {
  type        = string
  description = "Name of the security group. If omitted, Terraform will assign a random, unique name"
}

variable "description" {
  type        = string
  description = "Security group description. Defaults to Managed by Terraform. Cannot be ''. **NOTE**: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use `tags`"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "inbound_ports" {
  type        = list(number)
  default     = [0]
  description = "Inbound rule ports to allow to."
}

variable "inbound_cidr_blocks" {
  type        = list(string)
  description = "Inbound CIDR Blocks to allow connectivity to."
}

variable "inbound_security_groups" {
  type        = list(string)
  default     = []
  description = "List of security group Group Names if using EC2-Classic, or Group IDs if using a VPC."
}

variable "inbound_protocol" {
  type        = number
  default     = -1
  description = "Allowed Protocol for Ingress Traffic"
}

variable "tags" {
  type        = map(any)
  description = "MAP of tags to assign to the resource. If configured with a provider"
}

/* Optional Variables */

variable "outbound_ports" {
  type        = list(number)
  default     = [0]
  description = "Outbound ports to allow egress traffic"
}

variable "outbound_protocol" {
  type        = number
  default     = -1
  description = "Allow Protocol for Egress Traffic "
}

variable "outbound_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "Egress CIDR Blocks"
}
