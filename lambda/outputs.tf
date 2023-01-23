/*
 * # AWS Lambda Terraform Module 💡
 * Description
 * ============
 * This tf file provides Lambda resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/

output "arn" {
  value       = aws_lambda_function.lambda.arn
  description = "Amazon Resource Name (ARN) identifying your Lambda Function"
}

output "invoke_arn" {
  value       = aws_lambda_function.lambda.invoke_arn
  description = "ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri."
}

output "last_modified" {
  value       = aws_lambda_function.lambda.last_modified
  description = "Date this resource was last modified."
}

output "qualified_arn" {
  value       = aws_lambda_function.lambda.qualified_arn
  description = "ARN identifying your Lambda Function Version (if versioning is enabled via publish = true)."
}

output "signing_job_arn" {
  value       = aws_lambda_function.lambda.signing_job_arn
  description = "ARN of the signing job"
}

output "signing_profile_version_arn" {
  value       = aws_lambda_function.lambda.signing_profile_version_arn
  description = "ARN of the signing profile version."
}

output "source_code_size" {
  value       = aws_lambda_function.lambda.source_code_size
  description = "Size in bytes of the function .zip file."
}

output "tags_all" {
  value       = aws_lambda_function.lambda.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider `default_tags` configuration block."
}

output "version" {
  value       = aws_lambda_function.lambda.version
  description = "Latest published version of your Lambda Function."
}

output "vpc_id" {
  value       = aws_lambda_function.lambda.vpc_config[0].vpc_id
  description = "ID of the VPC."
}
