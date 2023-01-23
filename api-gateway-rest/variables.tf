/*
 * # AWS API Gateway Terraform Module 💡
 * Description
 * ============
 * This tf file provides API Gateway REST resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/

/* Required Variables */
variable "name" {
  type        = string
  description = "Name of the REST API. If importing an OpenAPI specification via the body argument, this corresponds to the `info.title` field. If the argument value is different than the OpenAPI value, the argument value will override the OpenAPI value"
}

variable "description" {
  type        = string
  description = "Description of the REST API. If importing an OpenAPI specification via the `body` argument, this corresponds to the `info.description` field. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value"
}

variable "tags" {
  type        = map(any)
  description = "Key-value map of resource tags. If configured with a provider"
}

/* Optional Variables */

variable "endpoint_configuration_types" {
  type        = list(string)
  default     = ["REGIONAL"]
  description = "A list of endpoint types. This resource currently only supports managing a single value. Valid values: `EDGE`, `REGIONAL` or `PRIVATE`. If unspecified, defaults to `EDGE`. Must be declared as `REGIONAL` in non-Commercial partitions. Refer to the documentation for more information on the difference between edge-optimized and regional APIs."
}

variable "endpoint_configuration_vpc_id" {
  type        = list(string)
  default     = null
  description = "Set of VPC Endpoint identifiers. It is only supported for `PRIVATE` endpoint type. If importing an OpenAPI specification via the body argument, this corresponds to the `x-amazon-apigateway-endpoint-configuration extension` `vpcEndpointIds` property. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value"
}

variable "binary_media_types" {
  type        = list(string)
  default     = []
  description = "List of binary media types supported by the REST API. By default, the REST API supports only UTF-8-encoded text payloads. If importing an OpenAPI specification via the body argument, this corresponds to the [x-amazon-apigateway-binary-media-types](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions-binary-media-types.html) extension. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value"
}

variable "minimum_compression_size" {
  type        = number
  default     = -1
  description = "Minimum response size to compress for the REST API. Integer between `-1` and `10485760 (10MB)`. Setting a value greater than `-1` will enable compression, `-1` disables compression (default). If importing an OpenAPI specification via the body argument, this corresponds to the [x-amazon-apigateway-minimum-compression-size extension](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-openapi-minimum-compression-size.html). If the argument value (except -1) is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value."
}

variable "body" {
  type        = string
  default     = null
  description = "OpenAPI specification that defines the set of routes and integrations to create as part of the REST API. This configuration, and any updates to it, will replace all REST API configuration except values overridden in this resource configuration and other resource updates applied after this resource but before any `aws_api_gateway_deployment` creation. More information about REST API OpenAPI support can be found in the API Gateway Developer Guide."
}

variable "policy" {
  type        = string
  default     = null
  description = "JSON formatted policy document that controls access to the API Gateway. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide. Terraform will only perform drift detection of its value when present in a configuration. It is recommended to use the [aws_api_gateway_rest_api_policy resource](https://registry.terraform.io/providers/hashicorp/aws/4.0.0/docs/resources/api_gateway_rest_api_policy) instead. If importing an OpenAPI specification via the body argument, this corresponds to the x-amazon-apigateway-policy extension. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value."
}

variable "api_key_source" {
  type        = string
  default     = "HEADER"
  description = "Source of the API key for requests. Valid values are `HEADER (default)` and `AUTHORIZER`. If importing an OpenAPI specification via the `body` argument, this corresponds to the [x-amazon-apigateway-api-key-source extension](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions-api-key-source.html). If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value."
}

variable "disable_execute_api_endpoint" {
  type        = bool
  default     = true
  description = "Specifies whether clients can invoke your API by using the default execute-api endpoint. By default, clients can invoke your API with the default `https://{api_id}.execute-api.{region}.amazonaws.com endpoint`. To require that clients use a custom domain name to invoke your API, disable the default endpoint. Defaults to `false`. If importing an OpenAPI specification via the body argument, this corresponds to the [x-amazon-apigateway-endpoint-configuration extension disableExecuteApiEndpoint property](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions-endpoint-configuration.html). If the argument value is `true` and is different than the OpenAPI value, the argument value will override the OpenAPI value."
}
