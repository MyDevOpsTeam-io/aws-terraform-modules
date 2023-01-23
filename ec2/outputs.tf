/*
 * # AWS EC2 Terraform Module 💡
 * Description
 * ============
 * This tf file provides EC2 resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/

output "capacity_reservation_specification" {
  value = aws_instance.ec2.capacity_reservation_specification
}

output "instance_state" {
  value = aws_instance.ec2.instance_state
}

output "outpost_arn" {
  value = aws_instance.ec2.outpost_arn
}

output "password_data" {
  value     = aws_instance.ec2.password_data ? aws_instance.ec2.password_data : null
  sensitive = true
}

output "arn" {
  value = aws_instance.ec2.arn
}

output "public_ip" {
  value = aws_instance.ec2.public_ip ? aws_instance.ec2.public_ip : null
}

output "public_dns" {
  value = aws_instance.ec2.public_dns ? aws_instance.ec2.public_dns : null
}


output "private_dns" {
  value = aws_instance.ec2.private_dns
}

output "primary_network_interface_id" {
  value = aws_instance.ec2.primary_network_interface_id
}


output "tags_all" {
  value = aws_instance.ec2.tags_all
}

output "root_block_device" {
  value = aws_instance.ec2.root_block_device.0.volume_id
}
