<!-- BEGIN_TF_DOCS -->
# AWS EKS Terraform Module 💡
Description
============
This tf file provides EKS resources definition for TF Modules <br>
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
| [aws_eks_addon.cluster_cni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.cluster_nodegroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Define the eks cluster name | `string` | n/a | yes |
| <a name="input_cluster_nodegroup_disk_size"></a> [cluster\_nodegroup\_disk\_size](#input\_cluster\_nodegroup\_disk\_size) | Desired storage size for worker nodes in GB. Defaults to 20GB | `string` | `"20"` | no |
| <a name="input_cluster_nodegroup_instance_types"></a> [cluster\_nodegroup\_instance\_types](#input\_cluster\_nodegroup\_instance\_types) | Specify list of desired nodegroup instance\_types | `list(string)` | <pre>[<br>  "t3.medium"<br>]</pre> | no |
| <a name="input_cluster_nodegroup_name"></a> [cluster\_nodegroup\_name](#input\_cluster\_nodegroup\_name) | Specify cluster nodegroup name | `string` | n/a | yes |
| <a name="input_cluster_nodegroup_role_arn"></a> [cluster\_nodegroup\_role\_arn](#input\_cluster\_nodegroup\_role\_arn) | Specify existing cluster nodegroup role arn | `string` | n/a | yes |
| <a name="input_cluster_role_arn"></a> [cluster\_role\_arn](#input\_cluster\_role\_arn) | Specify existing cluster role arn | `string` | n/a | yes |
| <a name="input_cluster_security_group_ids"></a> [cluster\_security\_group\_ids](#input\_cluster\_security\_group\_ids) | Specify cluster level security group ids | `list(string)` | n/a | yes |
| <a name="input_cluster_subnet_ids"></a> [cluster\_subnet\_ids](#input\_cluster\_subnet\_ids) | Specify list of cluster subnet ids | `list(string)` | n/a | yes |
| <a name="input_cluster_tags"></a> [cluster\_tags](#input\_cluster\_tags) | AWS EKS Cluster Tags | `map(any)` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Define the AWS EKS Cluster version | `string` | n/a | yes |
| <a name="input_cni_version"></a> [cni\_version](#input\_cni\_version) | Enable/Disable provisioning of AWS VPC CNI EKS Addon | `string` | `"v1.11.2-eksbuild.1"` | no |
| <a name="input_nodegroup_desired_size"></a> [nodegroup\_desired\_size](#input\_nodegroup\_desired\_size) | Number of desired worker nodes | `number` | `3` | no |
| <a name="input_nodegroup_max_size"></a> [nodegroup\_max\_size](#input\_nodegroup\_max\_size) | Maximum number of running worker nodes | `number` | `3` | no |
| <a name="input_nodegroup_min_size"></a> [nodegroup\_min\_size](#input\_nodegroup\_min\_size) | Minimum number of running worker nodes | `number` | `2` | no |
| <a name="input_nodegroup_tags"></a> [nodegroup\_tags](#input\_nodegroup\_tags) | AWS EKS Cluster Node Group Tags | `map(any)` | n/a | yes |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | Existing SSH keypair on AWS | `string` | `""` | no |
| <a name="input_vpc_cni_enabled"></a> [vpc\_cni\_enabled](#input\_vpc\_cni\_enabled) | Enable/Disable provisioning of AWS VPC CNI EKS Addon | `bool` | `true` | no |
| <a name="input_worker_node_subnet_ids"></a> [worker\_node\_subnet\_ids](#input\_worker\_node\_subnet\_ids) | List of desired subnets ids to be used by worker nodes | `list(string)` | n/a | yes |
| <a name="input_worker_remote_access_security_groups"></a> [worker\_remote\_access\_security\_groups](#input\_worker\_remote\_access\_security\_groups) | List of Remote Access security groups for SSH Access | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | EKS Cluster ARN |
| <a name="output_cluster_certificate_authority"></a> [cluster\_certificate\_authority](#output\_cluster\_certificate\_authority) | EKS Cluster certificate authority |
| <a name="output_cluster_certificate_authority_data"></a> [cluster\_certificate\_authority\_data](#output\_cluster\_certificate\_authority\_data) | EKS Cluster Ceritificate authority RAW DATA output |
| <a name="output_cluster_created_at"></a> [cluster\_created\_at](#output\_cluster\_created\_at) | Created Date output |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | EKS Cluster API Endpoint |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | EKS Cluster ID |
| <a name="output_cluster_identity"></a> [cluster\_identity](#output\_cluster\_identity) | EKS Cluster Identity |
| <a name="output_cluster_oidc"></a> [cluster\_oidc](#output\_cluster\_oidc) | EKS Cluster OIDC |
| <a name="output_cluster_platform_version"></a> [cluster\_platform\_version](#output\_cluster\_platform\_version) | Provisioned EKS Cluster platform version |
| <a name="output_cluster_security_group_id"></a> [cluster\_security\_group\_id](#output\_cluster\_security\_group\_id) | Created EKS Cluster Security Group ID's |
| <a name="output_cluster_status"></a> [cluster\_status](#output\_cluster\_status) | Cluster Currnet Status |
| <a name="output_cluster_tags_all"></a> [cluster\_tags\_all](#output\_cluster\_tags\_all) | EKS Tags |
| <a name="output_cluster_vpc_config"></a> [cluster\_vpc\_config](#output\_cluster\_vpc\_config) | EKS Cluster VPC Config |
| <a name="output_cluster_vpc_id"></a> [cluster\_vpc\_id](#output\_cluster\_vpc\_id) | VPC ID of created EKS Cluster |
| <a name="output_nodegroup_arn"></a> [nodegroup\_arn](#output\_nodegroup\_arn) | AWS EKS Node Group ARN |
| <a name="output_nodegroup_id"></a> [nodegroup\_id](#output\_nodegroup\_id) | AWS EKS Node Group ID |
| <a name="output_nodegroup_resources_remote_access_security_group_id"></a> [nodegroup\_resources\_remote\_access\_security\_group\_id](#output\_nodegroup\_resources\_remote\_access\_security\_group\_id) | AWS EKS Node Group Remote Access Security Group ID's |
| <a name="output_nodegroup_status"></a> [nodegroup\_status](#output\_nodegroup\_status) | AWS EKS Node Group Status |
| <a name="output_nodegroup_tags"></a> [nodegroup\_tags](#output\_nodegroup\_tags) | AWS EKS Node Group Tags |
<!-- END_TF_DOCS -->


Usage
======
```hcl
module "eks_poc" {
  source                           = "https://github.com/MyDevOpsTeam-io/aws-terraform-modules.git//eks?ref=eks-v1.0.0-alpha"
  cluster_name                     = "eks-cluster"
  cluster_version                  = "1.22"
  cluster_nodegroup_disk_size      = "80"
  cluster_nodegroup_instance_types = ["m5.xlarge"]
  cluster_nodegroup_name           = "eks_worker_nodes"
  cluster_nodegroup_role_arn       = "<your_nodegroup_iam_role_arn>"
  cluster_role_arn                 = "<your_nodegroup_iam_role_arn>"
  cluster_security_group_ids       = ["<security_group_1>","<security_group_2>","<security_group_3>"]
  cluster_subnet_ids = [
    "<private_subnet_1>",
    "<private_subnet_2>",
    "<private_subnet_3>",
    "<public_subnet_1>",
    "<public_subnet_2>",
    "<public_subnet_3>"
  ]
  cni_version            = "v1.11.2-eksbuild.1"
  vpc_cni_enabled        = true
  nodegroup_desired_size = 3
  nodegroup_max_size     = 3
  nodegroup_min_size     = 3
  ssh_key                = "<your_ssh_key>"
  worker_node_subnet_ids = [
    "<private_subnet_1>",
    "<private_subnet_2>",
    "<private_subnet_3>"
  ]
  worker_remote_access_security_groups = ["<ssh_security_group>"]
  cluster_tags                         = { Name = "EKS Cluster" }
  nodegroup_tags                       = { Name = "EKS Nodegroup" }
}
```
