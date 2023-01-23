/*
 * # AWS EC2 Terraform Module 💡
 * Description
 * ============
 * This tf file provides EC2 resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/

/* Required Variables */

variable "ami" {
  type        = string
  description = "AMI for AWS EC2 Instance"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for AWS EC2 Instance"
}

variable "tags" {
  type        = map(any)
  description = "Tags for AWS EC2 Instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type for AWS EC2 Instance"
}

variable "key_name" {
  type        = string
  description = "SSH Key Pair name for AWS EC2 Instance"
}


variable "security_group_ids" {
  type        = list(string)
  description = "List of Security Group ids for AWS EC2 Instance"
}

variable "volume_type" {
  type        = string
  description = "Volume type for AWS EC2 Instance"
}

variable "volume_size" {
  type        = string
  description = "Volume size in GB for AWS EC2 Instance"
}


/* Optional Arguments */

variable "volume_iops" {
  type        = string
  default     = "300"
  description = "Volume IOPS for AWS EC2 Instance volume"
}


variable "user_data" {
  type        = string
  default     = null
  description = "User data provided to bootstrap ec2 instance"
}

variable "instance_profile" {
  type        = string
  default     = null
  description = "Instance profile for AWS EC2 Instance"
}

variable "disable_api_termination" {
  type        = bool
  default     = true
  description = "Enable/Disable termination protection for AWS EC2 Instance"
}


variable "delete_block_device_on_termination" {
  type        = bool
  default     = true
  description = "Whether to delete block device when terminating ec2 instance"
}

variable "associate_public_ip_address" {
  type        = bool
  default     = null
  description = "Enable Public ip address for AWS EC2 Instance"
}

variable "monitoring_enabled" {
  type        = bool
  default     = false
  description = "Enable Enable/Disable Monitoring on AWS EC2 Instance"
}
