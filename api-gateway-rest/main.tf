/*
 * # AWS API Gateway Terraform Module 💡
 * Description
 * ============
 * This tf file provides API Gateway REST resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/

resource "aws_api_gateway_rest_api" "rest" {
  name        = var.name
  description = var.description
  endpoint_configuration {
    types            = length(var.endpoint_configuration_types) == 0 || var.endpoint_configuration_types == null ? null : var.endpoint_configuration_types
    vpc_endpoint_ids = contains(var.endpoint_configuration_types, "PRIVATE") ? var.endpoint_configuration_vpc_id : null
  }
  binary_media_types           = length(var.binary_media_types) == 0 || var.binary_media_types == null ? [] : var.binary_media_types
  minimum_compression_size     = var.minimum_compression_size /* Value conforms in `bytes` */
  body                         = var.body
  policy                       = var.policy
  api_key_source               = length(var.api_key_source) == 0 || var.api_key_source == null ? "HEADER" : var.api_key_source
  disable_execute_api_endpoint = var.disable_execute_api_endpoint
  tags                         = var.tags
}
