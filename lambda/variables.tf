/*
 * # AWS Lambda Terraform Module 💡
 * Description
 * ============
 * This tf file provides Lambda resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/


/* Required variables */

variable "filename" {
  type        = string
  description = "Filename of lambda function source"
}

variable "func_name" {
  type        = string
  description = "Name of Lambda function"
}

variable "runtime" {
  type        = string
  description = "Lambda function runtime. Refer to [Lambda Runtimes](https://docs.aws.amazon.com/lambda/latest/dg/runtimes-modify.html) for available runtime values"
}

variable "arn_role" {
  type        = string
  description = "Lambda IAM role"
}

variable "handler_name" {
  type        = string
  description = "Name of a lambda function handler. For example function name `lambda.main`"
}

variable "memsize" {
  type        = number
  description = "Allocated Memory size for lambda in MB"
}

variable "timeout" {
  type        = number
  description = "Amount of time your Lambda Function has to run in seconds. Defaults to 3"
}

variable "tags" {
  type        = map(any)
  description = "Given resource taggings for resource inventory"
}

variable "vpc_subnet_ids" {
  type        = list(any)
  description = "List of subnet IDs associated with the Lambda function"
}

variable "vpc_sg_ids" {
  type        = list(any)
  description = "List of security group IDs associated with the Lambda function."
}


/* Optional variables */

variable "env_vars" {
  type        = map(any)
  default     = null
  description = "Map of environment variables that are accessible from the function code during execution"
}

variable "tracing_mode" {
  type        = string
  default     = null
  description = "Whether to to sample and trace a subset of incoming requests with AWS X-Ray. Valid values are `PassThrough` and `Active`. If `PassThrough`, Lambda will only trace the request from an upstream service if it contains a tracing header with `'sampled=1'`. If Active, Lambda will respect any tracing header it receives from an upstream service. If no tracing header is received, Lambda will call `X-Ray` for a tracing decision."
}

variable "image_config_enabled" {
  type        = bool
  default     = false
  description = "If image config is enabled/disabled. Dependent to `image_config` if enabled."
}

variable "image_config_command" {
  type        = list(string)
  default     = null
  description = "Parameters that you want to pass in with `entry_point`."
}

variable "image_config_entry_point" {
  type        = list(string)
  default     = null
  description = "Entry point to your application, which is typically the location of the runtime executable."
}

variable "image_config_working_directory" {
  type        = string
  default     = null
  description = "Working directory"
}

variable "filesystem_local_mount_path" {
  type        = string
  default     = null
  description = "Path where the function can access the file system, starting with `/mnt/`."
}

variable "filesystem_arn" {
  type        = string
  default     = null
  description = "Amazon Resource Name (ARN) of the Amazon EFS Access Point that provides access to the file system"
}

variable "dead_letter_config_arn" {
  type        = string
  default     = null
  description = "ARN of an SNS topic or SQS queue to notify when an invocation fails. If this option is used, the function's IAM role must be granted suitable access to write to the target object, which means allowing either the `sns:Publish` or `sqs:SendMessage` action on this ARN, depending on which service is targeted"
}

variable "codesigning_arn" {
  type        = string
  default     = null
  description = "To enable code signing for this function, specify the ARN of a code-signing configuration. A code-signing configuration includes a set of signing profiles, which define the trusted publishers for this function"
}

variable "description" {
  type        = string
  default     = null
  description = "Description of what your Lambda Function does"
}

variable "kms_arn" {
  type        = string
  default     = null
  description = "Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key that is used to encrypt environment variables. If this configuration is not provided when environment variables are in use, AWS Lambda uses a default service key. If this configuration is provided when environment variables are not in use, the AWS Lambda API does not save this configuration and Terraform will show a perpetual difference of adding the key. To fix the perpetual difference, remove this configuration"
}

variable "reserved_concurrent_executions" {
  type        = number
  default     = -1
  description = "Amount of reserved concurrent executions for this lambda function. A value of `0` disables lambda from being triggered and `-1` removes any concurrency limitations. Defaults to Unreserved Concurrency Limits `-1`."
}

variable "arch" {
  type        = list(string)
  default     = ["x86_64"]
  description = "Instruction set architecture for your Lambda function. Valid values are `['x86_64']` and `['arm64']`. Default is `['x86_64']`. Removing this attribute, function's architecture stay the same."
}
