/*
 * # AWS GlueJob Terraform Module 💡
 * Description
 * ============
 * This tf file provides GlueJob resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/

resource "aws_glue_job" "glue" {
  name     = var.name
  role_arn = var.role_arn

  command {
    script_location = var.script_location
    name            = var.command_name
    python_version  = var.is_python == true && length(var.python) != 0 ? var.python_version : null
  }

  execution_property {
    max_concurrent_runs = var.max_concurrent_runs
  }

  notification_property {
    notify_delay_after = var.notify_delay_after
  }

  default_arguments         = var.default_arguments
  non_overridable_arguments = var.non_overridable_arguments
  description               = var.description
  glue_version              = var.glue_version
  max_capacity              = var.max_capacity
  max_retries               = var.max_retries
  tags                      = var.tags
  timeout                   = var.timeouts
  security_configuration    = var.security_configuration
  worker_type               = var.worker_type
  number_of_workers         = var.number_of_workers
}
