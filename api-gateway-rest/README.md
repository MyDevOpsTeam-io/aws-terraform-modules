<!-- BEGIN_TF_DOCS -->
# AWS API Gateway Terraform Module 💡
Description
============
This tf file provides API Gateway REST resources definition for TF Modules <br>
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
| [aws_api_gateway_rest_api.rest](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key_source"></a> [api\_key\_source](#input\_api\_key\_source) | Source of the API key for requests. Valid values are `HEADER (default)` and `AUTHORIZER`. If importing an OpenAPI specification via the `body` argument, this corresponds to the [x-amazon-apigateway-api-key-source extension](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions-api-key-source.html). If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value. | `string` | `"HEADER"` | no |
| <a name="input_binary_media_types"></a> [binary\_media\_types](#input\_binary\_media\_types) | List of binary media types supported by the REST API. By default, the REST API supports only UTF-8-encoded text payloads. If importing an OpenAPI specification via the body argument, this corresponds to the [x-amazon-apigateway-binary-media-types](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions-binary-media-types.html) extension. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value | `list(string)` | `[]` | no |
| <a name="input_body"></a> [body](#input\_body) | OpenAPI specification that defines the set of routes and integrations to create as part of the REST API. This configuration, and any updates to it, will replace all REST API configuration except values overridden in this resource configuration and other resource updates applied after this resource but before any `aws_api_gateway_deployment` creation. More information about REST API OpenAPI support can be found in the API Gateway Developer Guide. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the REST API. If importing an OpenAPI specification via the `body` argument, this corresponds to the `info.description` field. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value | `string` | n/a | yes |
| <a name="input_disable_execute_api_endpoint"></a> [disable\_execute\_api\_endpoint](#input\_disable\_execute\_api\_endpoint) | Specifies whether clients can invoke your API by using the default execute-api endpoint. By default, clients can invoke your API with the default `https://{api_id}.execute-api.{region}.amazonaws.com endpoint`. To require that clients use a custom domain name to invoke your API, disable the default endpoint. Defaults to `false`. If importing an OpenAPI specification via the body argument, this corresponds to the [x-amazon-apigateway-endpoint-configuration extension disableExecuteApiEndpoint property](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions-endpoint-configuration.html). If the argument value is `true` and is different than the OpenAPI value, the argument value will override the OpenAPI value. | `bool` | `true` | no |
| <a name="input_endpoint_configuration_types"></a> [endpoint\_configuration\_types](#input\_endpoint\_configuration\_types) | A list of endpoint types. This resource currently only supports managing a single value. Valid values: `EDGE`, `REGIONAL` or `PRIVATE`. If unspecified, defaults to `EDGE`. Must be declared as `REGIONAL` in non-Commercial partitions. Refer to the documentation for more information on the difference between edge-optimized and regional APIs. | `list(string)` | <pre>[<br>  "REGIONAL"<br>]</pre> | no |
| <a name="input_endpoint_configuration_vpc_id"></a> [endpoint\_configuration\_vpc\_id](#input\_endpoint\_configuration\_vpc\_id) | Set of VPC Endpoint identifiers. It is only supported for `PRIVATE` endpoint type. If importing an OpenAPI specification via the body argument, this corresponds to the `x-amazon-apigateway-endpoint-configuration extension` `vpcEndpointIds` property. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value | `list(string)` | `null` | no |
| <a name="input_minimum_compression_size"></a> [minimum\_compression\_size](#input\_minimum\_compression\_size) | Minimum response size to compress for the REST API. Integer between `-1` and `10485760 (10MB)`. Setting a value greater than `-1` will enable compression, `-1` disables compression (default). If importing an OpenAPI specification via the body argument, this corresponds to the [x-amazon-apigateway-minimum-compression-size extension](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-openapi-minimum-compression-size.html). If the argument value (except -1) is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value. | `number` | `-1` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the REST API. If importing an OpenAPI specification via the body argument, this corresponds to the `info.title` field. If the argument value is different than the OpenAPI value, the argument value will override the OpenAPI value | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | JSON formatted policy document that controls access to the API Gateway. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide. Terraform will only perform drift detection of its value when present in a configuration. It is recommended to use the [aws\_api\_gateway\_rest\_api\_policy resource](https://registry.terraform.io/providers/hashicorp/aws/4.0.0/docs/resources/api_gateway_rest_api_policy) instead. If importing an OpenAPI specification via the body argument, this corresponds to the x-amazon-apigateway-policy extension. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value map of resource tags. If configured with a provider | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name (ARN) |
| <a name="output_created_date"></a> [created\_date](#output\_created\_date) | The creation date of the REST API |
| <a name="output_execution_arn"></a> [execution\_arn](#output\_execution\_arn) | The execution ARN part to be used in `lambda_permission's` `source_arn` when allowing API Gateway to invoke a Lambda function, e.g., `arn:aws:execute-api:eu-west-2:123456789012:z4675bid1j`, which can be concatenated with allowed stage, method and resource path. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the REST API |
| <a name="output_root_resource_id"></a> [root\_resource\_id](#output\_root\_resource\_id) | The resource ID of the REST API's root |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | n/a |
<!-- END_TF_DOCS -->


Usage 💡
========

```hcl
terraform {
  backend "local" {} /* Subject to change and use s3 bucket */
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
  apigw_tags = {
    "Provisioner" = "Terraform"
  }
}

module "api_gateway" {
  source                       = "https://github.com/MyDevOpsTeam-io/aws-terraform-modules.git//api-gateway-rest?ref=apigw-v1.0.0-alpha"
  description                  = "API Gateway"
  name                         = "test-api-gateway"
  tags                         = local.apigw_tags
  endpoint_configuration_types = ["REGIONAL"]
}
```
