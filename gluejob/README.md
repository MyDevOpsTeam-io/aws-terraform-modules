<!-- BEGIN_TF_DOCS -->
# AWS GlueJob Terraform Module 💡
Description
============
This tf file provides GlueJob resources definition for TF Modules <br>
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
| [aws_glue_job.glue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_command_name"></a> [command\_name](#input\_command\_name) | The name of the job command. Defaults to `glueetl`. Use `pythonshell` for Python Shell Job Type, `max_capacity` needs to be set if `pythonshell` is chosen. | `string` | `null` | no |
| <a name="input_default_arguments"></a> [default\_arguments](#input\_default\_arguments) | The map of default arguments for this job. You can specify arguments here that your own job-execution script consumes, as well as arguments that AWS Glue itself consumes. For information about how to specify and consume your own Job arguments, see the [Calling AWS Glue APIs in Python](http://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html) topic in the developer guide. For information about the key-value pairs that AWS Glue consumes to set up your job, see the [Special Parameters Used by AWS Glue](http://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-glue-arguments.html) topic in the developer guide. | `map(any)` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of a GlueJob. | `string` | `null` | no |
| <a name="input_glue_version"></a> [glue\_version](#input\_glue\_version) | The version of glue to use, for example `1.0`. For information about available versions, see the [AWS Glue Release Notes](https://docs.aws.amazon.com/glue/latest/dg/release-notes.html). | `string` | `"1.0"` | no |
| <a name="input_is_python"></a> [is\_python](#input\_is\_python) | Specify if gluejob is using a python runtime. | `bool` | `false` | no |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | The maximum number of AWS Glue data processing units (DPUs) that can be allocated when this job runs. `Required` when `pythonshell` is set, accept either `0.0625` or `1.0`. Use `number_of_workers` and `worker_type` arguments instead with `glue_version 2.0` and above | `number` | `null` | no |
| <a name="input_max_concurrent_runs"></a> [max\_concurrent\_runs](#input\_max\_concurrent\_runs) | The maximum number of concurrent runs allowed for a job. The default is `1`. | `number` | `1` | no |
| <a name="input_max_retries"></a> [max\_retries](#input\_max\_retries) | The maximum number of times to retry this job if it fails. | `number` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name you assign to this job. It must be unique in your account. | `string` | n/a | yes |
| <a name="input_non_overridable_arguments"></a> [non\_overridable\_arguments](#input\_non\_overridable\_arguments) | Non-overridable arguments for this job, specified as name-value pairs. | `map(any)` | `null` | no |
| <a name="input_notify_delay_after"></a> [notify\_delay\_after](#input\_notify\_delay\_after) | After a job run starts, the number of minutes to wait before sending a job run delay notification. | `number` | `null` | no |
| <a name="input_number_of_workers"></a> [number\_of\_workers](#input\_number\_of\_workers) | The number of workers of a defined workerType that are allocated when a job runs. | `number` | `null` | no |
| <a name="input_python_version"></a> [python\_version](#input\_python\_version) | The Python version being used to execute a Python shell job. Allowed values are `2` or `3`. | `number` | `null` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | Description of the job. | `string` | n/a | yes |
| <a name="input_script_location"></a> [script\_location](#input\_script\_location) | Specifies the S3 path to a script that executes a job. | `string` | n/a | yes |
| <a name="input_security_configuration"></a> [security\_configuration](#input\_security\_configuration) | The name of the Security Configuration to be associated with the job. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value map of resource tags. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level | `map(any)` | n/a | yes |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | The job timeout in minutes. The default is 2880 minutes (48 hours). | `number` | `2880` | no |
| <a name="input_worker_type"></a> [worker\_type](#input\_worker\_type) | The type of predefined worker that is allocated when a job runs. Accepts a value of Standard, `G.1X`, or `G.2X`. | `string` | `"G.1X"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name (ARN) of Glue Job |
| <a name="output_id"></a> [id](#output\_id) | Job name |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
<!-- END_TF_DOCS -->
