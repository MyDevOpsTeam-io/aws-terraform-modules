<!-- BEGIN_TF_DOCS -->
# AWS EC2 Terraform Module 💡
Description
============
This tf file provides EC2 resources definition for TF Modules <br>
***Author***: Alfred Valderrama (@redopsbay) <br>

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | AMI for AWS EC2 Instance | `string` | n/a | yes |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Enable Public ip address for AWS EC2 Instance | `bool` | `null` | no |
| <a name="input_delete_block_device_on_termination"></a> [delete\_block\_device\_on\_termination](#input\_delete\_block\_device\_on\_termination) | Whether to delete block device when terminating ec2 instance | `bool` | `true` | no |
| <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination) | Enable/Disable termination protection for AWS EC2 Instance | `bool` | `true` | no |
| <a name="input_instance_profile"></a> [instance\_profile](#input\_instance\_profile) | Instance profile for AWS EC2 Instance | `string` | `null` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type for AWS EC2 Instance | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | SSH Key Pair name for AWS EC2 Instance | `string` | n/a | yes |
| <a name="input_monitoring_enabled"></a> [monitoring\_enabled](#input\_monitoring\_enabled) | Enable Enable/Disable Monitoring on AWS EC2 Instance | `bool` | `false` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of Security Group ids for AWS EC2 Instance | `list(string)` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID for AWS EC2 Instance | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for AWS EC2 Instance | `map(any)` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User data provided to bootstrap ec2 instance | `string` | `null` | no |
| <a name="input_volume_iops"></a> [volume\_iops](#input\_volume\_iops) | Volume IOPS for AWS EC2 Instance volume | `string` | `"300"` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | Volume size in GB for AWS EC2 Instance | `string` | n/a | yes |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | Volume type for AWS EC2 Instance | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_capacity_reservation_specification"></a> [capacity\_reservation\_specification](#output\_capacity\_reservation\_specification) | n/a |
| <a name="output_instance_state"></a> [instance\_state](#output\_instance\_state) | n/a |
| <a name="output_outpost_arn"></a> [outpost\_arn](#output\_outpost\_arn) | n/a |
| <a name="output_password_data"></a> [password\_data](#output\_password\_data) | n/a |
| <a name="output_primary_network_interface_id"></a> [primary\_network\_interface\_id](#output\_primary\_network\_interface\_id) | n/a |
| <a name="output_private_dns"></a> [private\_dns](#output\_private\_dns) | n/a |
| <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns) | n/a |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | n/a |
| <a name="output_root_block_device"></a> [root\_block\_device](#output\_root\_block\_device) | n/a |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | n/a |
<!-- END_TF_DOCS -->


Usage
=======
```hcl
terraform {
  backend "local" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.0.0"
    }
  }
}


provider "aws" {
  region = "ap-southeast-1"
}


locals {
  ec2_tags = {
    "Provisioner" = "Terraform"
    "Name" = "mydevopsteam"
  }
}

module "ec2" {
  source             = ""
  ami                = "ami-1234567890"
  instance_type      = "t2.micro"
  key_name           = "devops_key"
  security_group_ids = ["sg-12345678949"]
  subnet_id          = "subnet-1234567890"
  tags               = local.ec2_tags
  volume_size        = "30"
  volume_type        = "gp3"
  volume_iops        = "800"
}
```
