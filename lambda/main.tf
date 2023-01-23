/*
 * # AWS Lambda Terraform Module 💡
 * Description
 * ============
 * This tf file provides Lambda resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/


resource "aws_lambda_function" "lambda" {
  filename                       = var.filename
  function_name                  = var.func_name
  runtime                        = var.runtime
  role                           = var.arn_role
  handler                        = var.handler_name
  source_code_hash               = filebase64sha256(var.filename)
  memory_size                    = var.memsize
  timeout                        = var.timeout
  tags                           = var.tags
  architectures                  = var.arch
  reserved_concurrent_executions = var.reserved_concurrent_executions
  kms_key_arn                    = var.kms_arn == "" || var.kms_arn == null ? null : var.kms_arn
  description                    = var.description == "" || var.description == null ? null : var.description

  code_signing_config_arn = var.codesigning_arn == "" || var.codesigning_arn == null ? null : var.codesigning_arn


  /* Networking Configuration */
  vpc_config {
    subnet_ids         = var.vpc_subnet_ids
    security_group_ids = var.vpc_sg_ids
  }

  /* Below is Dynamic Configuration */

  /* Configuration if dead letter configuration should be enabled */
  dynamic "dead_letter_config" {

    /*
     * [] and [1] is just a placeholder since `for_each` is required.
     * So it will not fail on either result.
    */

    for_each = var.dead_letter_config_arn == "" || var.dead_letter_config_arn == null ? [] : [1]
    content {
      target_arn = var.dead_letter_config_arn
    }
  }

  /* Configuration if EFS filesystem configuration should be enabled */
  dynamic "file_system_config" {
    for_each = (var.filesystem_arn == "" || var.filesystem_arn == null) && (var.filesystem_local_mount_path == "" || var.filesystem_local_mount_path == null) ? [] : [1]
    content {
      arn              = var.filesystem_arn
      local_mount_path = var.filesystem_local_mount_path
    }
  }

  /* If lambda_image_config is enabled. Create image_config block */
  dynamic "image_config" {
    for_each = var.image_config_enabled == true ? [1] : []
    content {
      command           = var.image_config_command
      entry_point       = var.image_config_entry_point
      working_directory = var.image_config_working_directory
    }
  }

  /* If `tracing_config` is enabled */
  dynamic "tracing_config" {
    for_each = var.tracing_mode == "" || var.tracing_mode == null ? [] : [1]
    content {
      mode = var.tracing_mode
    }
  }

  /* If `environment` variables is set  */
  dynamic "environment" {
    for_each = var.env_vars == null || var.env_vars == {} ? [] : [1]
    content {
      variables = var.env_vars
    }
  }
}
