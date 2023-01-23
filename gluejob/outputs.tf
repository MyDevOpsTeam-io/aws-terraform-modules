/*
 * # AWS GlueJob Terraform Module 💡
 * Description
 * ============
 * This tf file provides GlueJob resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/


output "arn" {
  value       = aws_glue_job.glue.arn
  description = "Amazon Resource Name (ARN) of Glue Job"
}

output "id" {
  value       = aws_glue_job.glue.id
  description = "Job name"
}

output "tags_all" {
  value       = aws_glue_job.glue.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}
