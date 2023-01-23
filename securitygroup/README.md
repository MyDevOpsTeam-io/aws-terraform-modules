<!-- BEGIN_TF_DOCS -->
# AWS Security Group Terraform Module 💡
Description
============
This tf file provides Security Group resources definition for TF Modules <br>
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
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Security group description. Defaults to Managed by Terraform. Cannot be ''. **NOTE**: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use `tags` | `string` | n/a | yes |
| <a name="input_inbound_cidr_blocks"></a> [inbound\_cidr\_blocks](#input\_inbound\_cidr\_blocks) | Inbound CIDR Blocks to allow connectivity to. | `list(string)` | n/a | yes |
| <a name="input_inbound_ports"></a> [inbound\_ports](#input\_inbound\_ports) | Inbound rule ports to allow to. | `list(number)` | <pre>[<br>  0<br>]</pre> | no |
| <a name="input_inbound_protocol"></a> [inbound\_protocol](#input\_inbound\_protocol) | Allowed Protocol for Ingress Traffic | `number` | `-1` | no |
| <a name="input_inbound_security_groups"></a> [inbound\_security\_groups](#input\_inbound\_security\_groups) | List of security group Group Names if using EC2-Classic, or Group IDs if using a VPC. | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the security group. If omitted, Terraform will assign a random, unique name | `string` | n/a | yes |
| <a name="input_outbound_cidr_blocks"></a> [outbound\_cidr\_blocks](#input\_outbound\_cidr\_blocks) | Egress CIDR Blocks | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_outbound_ports"></a> [outbound\_ports](#input\_outbound\_ports) | Outbound ports to allow egress traffic | `list(number)` | <pre>[<br>  0<br>]</pre> | no |
| <a name="input_outbound_protocol"></a> [outbound\_protocol](#input\_outbound\_protocol) | Allow Protocol for Egress Traffic | `number` | `-1` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | MAP of tags to assign to the resource. If configured with a provider | `map(any)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the security group |
| <a name="output_id"></a> [id](#output\_id) | ID of the security group. |
| <a name="output_owner_id"></a> [owner\_id](#output\_owner\_id) | Owner ID. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider `default_tags` |
<!-- END_TF_DOCS -->


Basic Usage 🔑
==============
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
  sg_tags = {
    "Provisioner" = "Terraform"
  }
}


module "sg" {
  source              = "https://github.com/MyDevOpsTeam-io/aws-terraform-modules.git//securitygroup?ref=securitygroup-v1.0.0-alpha"
  description         = "AWS Security Group"
  name                = "sample-sg"
  inbound_cidr_blocks = ["0.0.0.0/0"]
  inbound_ports       = [443, 80]
  tags                = local.sg_tags
  vpc_id              = "<your-vpc-id>"
}
```
