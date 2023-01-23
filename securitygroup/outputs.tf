/*
 * # AWS Security Group Terraform Module 💡
 * Description
 * ============
 * This tf file provides Security Group resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/
output "arn" {
  value       = aws_security_group.sg.arn
  description = "ARN of the security group"
}

output "id" {
  value       = aws_security_group.sg.id
  description = "ID of the security group."
}

output "owner_id" {
  value       = aws_security_group.sg.owner_id
  description = "Owner ID."
}

output "tags_all" {
  value       = aws_security_group.sg.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider `default_tags`"
}
