/*
 * # AWS GlueJob Terraform Module 💡
 * Description
 * ============
 * This tf file provides GlueJob resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/


/* Required Variables */

variable "name" {
  type        = string
  description = "The name you assign to this job. It must be unique in your account."
}

variable "role_arn" {
  type        = string
  description = "Description of the job."
}

variable "script_location" {
  type        = string
  description = "Specifies the S3 path to a script that executes a job."
}

variable "tags" {
  type        = map(any)
  description = "Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
}

/* Optional Variables */

variable "command_name" {
  type        = string
  default     = null
  description = "The name of the job command. Defaults to `glueetl`. Use `pythonshell` for Python Shell Job Type, `max_capacity` needs to be set if `pythonshell` is chosen."
}

variable "is_python" {
  type        = bool
  default     = false
  description = "Specify if gluejob is using a python runtime."
}

variable "python_version" {
  type        = number
  default     = null
  description = "The Python version being used to execute a Python shell job. Allowed values are `2` or `3`."
}

variable "max_concurrent_runs" {
  type        = number
  default     = 1
  description = "The maximum number of concurrent runs allowed for a job. The default is `1`."
}

variable "notify_delay_after" {
  type        = number
  default     = null
  description = "After a job run starts, the number of minutes to wait before sending a job run delay notification."
}

variable "default_arguments" {
  type        = map(any)
  default     = null
  description = "The map of default arguments for this job. You can specify arguments here that your own job-execution script consumes, as well as arguments that AWS Glue itself consumes. For information about how to specify and consume your own Job arguments, see the [Calling AWS Glue APIs in Python](http://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html) topic in the developer guide. For information about the key-value pairs that AWS Glue consumes to set up your job, see the [Special Parameters Used by AWS Glue](http://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-glue-arguments.html) topic in the developer guide."
}

variable "non_overridable_arguments" {
  type        = map(any)
  default     = null
  description = "Non-overridable arguments for this job, specified as name-value pairs."
}

variable "description" {
  type        = string
  default     = null
  description = "Description of a GlueJob."
}

variable "glue_version" {
  type        = string
  default     = "1.0"
  description = "The version of glue to use, for example `1.0`. For information about available versions, see the [AWS Glue Release Notes](https://docs.aws.amazon.com/glue/latest/dg/release-notes.html)."
}

variable "max_capacity" {
  type        = number
  default     = null
  description = "The maximum number of AWS Glue data processing units (DPUs) that can be allocated when this job runs. `Required` when `pythonshell` is set, accept either `0.0625` or `1.0`. Use `number_of_workers` and `worker_type` arguments instead with `glue_version 2.0` and above"
}

variable "max_retries" {
  type        = number
  default     = null
  description = "The maximum number of times to retry this job if it fails."
}

variable "timeouts" {
  type        = number
  default     = 2880
  description = "The job timeout in minutes. The default is 2880 minutes (48 hours)."
}

variable "security_configuration" {
  type        = string
  default     = null
  description = "The name of the Security Configuration to be associated with the job."
}

variable "worker_type" {
  type        = string
  default     = "G.1X"
  description = "The type of predefined worker that is allocated when a job runs. Accepts a value of Standard, `G.1X`, or `G.2X`."
}

variable "number_of_workers" {
  type        = number
  default     = null
  description = "The number of workers of a defined workerType that are allocated when a job runs."
}
