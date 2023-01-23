<!-- BEGIN_TF_DOCS -->
# AWS Lambda Terraform Module 💡
Description
============
This tf file provides Lambda resources definition for TF Modules <br>
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
| [aws_lambda_function.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_arch"></a> [arch](#input\_arch) | Instruction set architecture for your Lambda function. Valid values are `['x86_64']` and `['arm64']`. Default is `['x86_64']`. Removing this attribute, function's architecture stay the same. | `list(string)` | <pre>[<br>  "x86_64"<br>]</pre> | no |
| <a name="input_arn_role"></a> [arn\_role](#input\_arn\_role) | Lambda IAM role | `string` | n/a | yes |
| <a name="input_codesigning_arn"></a> [codesigning\_arn](#input\_codesigning\_arn) | To enable code signing for this function, specify the ARN of a code-signing configuration. A code-signing configuration includes a set of signing profiles, which define the trusted publishers for this function | `string` | `null` | no |
| <a name="input_dead_letter_config_arn"></a> [dead\_letter\_config\_arn](#input\_dead\_letter\_config\_arn) | ARN of an SNS topic or SQS queue to notify when an invocation fails. If this option is used, the function's IAM role must be granted suitable access to write to the target object, which means allowing either the `sns:Publish` or `sqs:SendMessage` action on this ARN, depending on which service is targeted | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of what your Lambda Function does | `string` | `null` | no |
| <a name="input_env_vars"></a> [env\_vars](#input\_env\_vars) | Map of environment variables that are accessible from the function code during execution | `map(any)` | `null` | no |
| <a name="input_filename"></a> [filename](#input\_filename) | Filename of lambda function source | `string` | n/a | yes |
| <a name="input_filesystem_arn"></a> [filesystem\_arn](#input\_filesystem\_arn) | Amazon Resource Name (ARN) of the Amazon EFS Access Point that provides access to the file system | `string` | `null` | no |
| <a name="input_filesystem_local_mount_path"></a> [filesystem\_local\_mount\_path](#input\_filesystem\_local\_mount\_path) | Path where the function can access the file system, starting with `/mnt/`. | `string` | `null` | no |
| <a name="input_func_name"></a> [func\_name](#input\_func\_name) | Name of Lambda function | `string` | n/a | yes |
| <a name="input_handler_name"></a> [handler\_name](#input\_handler\_name) | Name of a lambda function handler. For example function name `lambda.main` | `string` | n/a | yes |
| <a name="input_image_config_command"></a> [image\_config\_command](#input\_image\_config\_command) | Parameters that you want to pass in with `entry_point`. | `list(string)` | `null` | no |
| <a name="input_image_config_enabled"></a> [image\_config\_enabled](#input\_image\_config\_enabled) | If image config is enabled/disabled. Dependent to `image_config` if enabled. | `bool` | `false` | no |
| <a name="input_image_config_entry_point"></a> [image\_config\_entry\_point](#input\_image\_config\_entry\_point) | Entry point to your application, which is typically the location of the runtime executable. | `list(string)` | `null` | no |
| <a name="input_image_config_working_directory"></a> [image\_config\_working\_directory](#input\_image\_config\_working\_directory) | Working directory | `string` | `null` | no |
| <a name="input_kms_arn"></a> [kms\_arn](#input\_kms\_arn) | Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key that is used to encrypt environment variables. If this configuration is not provided when environment variables are in use, AWS Lambda uses a default service key. If this configuration is provided when environment variables are not in use, the AWS Lambda API does not save this configuration and Terraform will show a perpetual difference of adding the key. To fix the perpetual difference, remove this configuration | `string` | `null` | no |
| <a name="input_memsize"></a> [memsize](#input\_memsize) | Allocated Memory size for lambda in MB | `number` | n/a | yes |
| <a name="input_reserved_concurrent_executions"></a> [reserved\_concurrent\_executions](#input\_reserved\_concurrent\_executions) | Amount of reserved concurrent executions for this lambda function. A value of `0` disables lambda from being triggered and `-1` removes any concurrency limitations. Defaults to Unreserved Concurrency Limits `-1`. | `number` | `-1` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Lambda function runtime. Refer to [Lambda Runtimes](https://docs.aws.amazon.com/lambda/latest/dg/runtimes-modify.html) for available runtime values | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Given resource taggings for resource inventory | `map(any)` | n/a | yes |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Amount of time your Lambda Function has to run in seconds. Defaults to 3 | `number` | n/a | yes |
| <a name="input_tracing_mode"></a> [tracing\_mode](#input\_tracing\_mode) | Whether to to sample and trace a subset of incoming requests with AWS X-Ray. Valid values are `PassThrough` and `Active`. If `PassThrough`, Lambda will only trace the request from an upstream service if it contains a tracing header with `'sampled=1'`. If Active, Lambda will respect any tracing header it receives from an upstream service. If no tracing header is received, Lambda will call `X-Ray` for a tracing decision. | `string` | `null` | no |
| <a name="input_vpc_sg_ids"></a> [vpc\_sg\_ids](#input\_vpc\_sg\_ids) | List of security group IDs associated with the Lambda function. | `list(any)` | n/a | yes |
| <a name="input_vpc_subnet_ids"></a> [vpc\_subnet\_ids](#input\_vpc\_subnet\_ids) | List of subnet IDs associated with the Lambda function | `list(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name (ARN) identifying your Lambda Function |
| <a name="output_invoke_arn"></a> [invoke\_arn](#output\_invoke\_arn) | ARN to be used for invoking Lambda Function from API Gateway - to be used in aws\_api\_gateway\_integration's uri. |
| <a name="output_last_modified"></a> [last\_modified](#output\_last\_modified) | Date this resource was last modified. |
| <a name="output_qualified_arn"></a> [qualified\_arn](#output\_qualified\_arn) | ARN identifying your Lambda Function Version (if versioning is enabled via publish = true). |
| <a name="output_signing_job_arn"></a> [signing\_job\_arn](#output\_signing\_job\_arn) | ARN of the signing job |
| <a name="output_signing_profile_version_arn"></a> [signing\_profile\_version\_arn](#output\_signing\_profile\_version\_arn) | ARN of the signing profile version. |
| <a name="output_source_code_size"></a> [source\_code\_size](#output\_source\_code\_size) | Size in bytes of the function .zip file. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider `default_tags` configuration block. |
| <a name="output_version"></a> [version](#output\_version) | Latest published version of your Lambda Function. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the VPC. |
<!-- END_TF_DOCS -->



Usage 💡
========
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
  lambda_tags = {
    "Provisioner" = "Terraform"
  }
}

module "lambda" {
  source         = "https://github.com/MyDevOpsTeam-io/aws-terraform-modules.git//lambda?ref=lambda-v1.0.0-alpha"
  arch           = ["x86_64"]
  arn_role       = "<lambda_arn_role>"
  description    = "AWS Lambda Function"
  filename       = "./snippets/lambda.zip" /* location of lambda zip file */
  func_name      = "Sample Lambda Function"
  handler_name   = "lambda.main"
  memsize        = 512
  runtime        = "python3.8"
  tags           = local.lambda_tags
  timeout        = 10
  vpc_sg_ids     = [<sg_ids>]
  vpc_subnet_ids = [<subnet_ids>]
}
```
